import 'package:flutter/material.dart' as material;
import 'package:flutter_localizations/flutter_localizations.dart' as locale;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_value/shared_value.dart';
import 'package:pacman_apk/parser/android_utils.dart';
import 'package:pacman_apk/apk_installer.dart';
import 'package:pacman_apk/parser/isolate_runner.dart';
import 'package:pacman_apk/utils/misc_utils.dart';
import 'package:pacman_apk/utils/adbwsa_utils.dart';
import 'package:pacman_apk/utils/locale_utils.dart';
import 'package:pacman_apk/utils/string_utils.dart';
import 'package:pacman_apk/windows/win_info.dart';
import 'package:pacman_apk/windows/win_reg.dart';
import 'package:pacman_apk/windows/wsa_status.dart';
import 'package:pacman_apk/windows/win_io.dart';
import 'package:pacman_apk/widget/move_window_nomax.dart';
import 'package:pacman_apk/windows/win_path.dart';
import 'package:pacman_apk/screens/device_state.dart';
import 'package:pacman_apk/screens/settings.dart';
import 'package:pacman_apk/global_state.dart';
import 'package:pacman_apk/theme.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart' as flutter_acrylic;
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:ui';
import 'dart:io';
import 'dart:async';

const String appTitle = 'APK Package Manager';
const String appVersion = '1.6.0';

late bool darkMode;

class WSAStatusAlert {
  WSAStatusAlert(this.type, this.severity, this.title, this.desc);
  final ConnectionStatus type;
  final InfoBarSeverity severity;
  final String Function(AppLocalizations lang) title;
  final String Function(AppLocalizations lang) desc;

  bool get isConnected => type == ConnectionStatus.CONNECTED;
  bool get isDisconnected => type != ConnectionStatus.CONNECTED;
  bool get isPoweredOn => isConnected || type == ConnectionStatus.DISCONNECTED 
       || type == ConnectionStatus.OFFLINE || type == ConnectionStatus.UNAUTHORIZED;
}

enum ConnectionStatus {
  UNSUPPORTED, MISSING, UNKNOWN, ARRESTED, ARRESTING, STARTING, OFFLINE, DISCONNECTED, CONNECTED, UNAUTHORIZED
}

extension on ConnectionStatus {
  static final Map<ConnectionStatus, WSAStatusAlert> _statusAlerts = {
    ConnectionStatus.UNSUPPORTED: WSAStatusAlert(ConnectionStatus.UNSUPPORTED, InfoBarSeverity.error, (l)=>l.status_unsupported, 
          (l)=>l.status_unsupported_desc(WinVer.isWindows10OrGreater ? l.status_subtext_winver_10 : l.status_subtext_winver_older)),
    ConnectionStatus.MISSING: WSAStatusAlert(ConnectionStatus.MISSING, InfoBarSeverity.error, (l)=>l.status_missing, (l)=>l.status_missing_desc),
    ConnectionStatus.UNKNOWN: WSAStatusAlert(ConnectionStatus.UNKNOWN, InfoBarSeverity.info, (l)=>l.status_unknown, (l)=>l.status_unknown_desc),
    ConnectionStatus.STARTING: WSAStatusAlert(ConnectionStatus.STARTING, InfoBarSeverity.info, (l)=>l.status_starting, (l)=>l.status_starting_desc),
    ConnectionStatus.ARRESTED: WSAStatusAlert(ConnectionStatus.ARRESTED, InfoBarSeverity.warning, (l)=>l.status_arrested, (l)=>l.status_arrested_desc),
    ConnectionStatus.ARRESTING: WSAStatusAlert(ConnectionStatus.ARRESTING, InfoBarSeverity.info, (l)=>l.status_arresting, (l)=>l.status_arresting_desc),
    ConnectionStatus.OFFLINE: WSAStatusAlert(ConnectionStatus.OFFLINE, InfoBarSeverity.warning, (l)=>l.status_offline, (l)=>l.status_offline_desc),
    ConnectionStatus.DISCONNECTED: WSAStatusAlert(ConnectionStatus.DISCONNECTED, InfoBarSeverity.error, (l)=>l.status_disconnected, (l)=>l.status_disconnected_desc),
    ConnectionStatus.CONNECTED: WSAStatusAlert(ConnectionStatus.CONNECTED, InfoBarSeverity.success, (l)=>l.status_connected, (l)=>l.status_connected_desc),
    ConnectionStatus.UNAUTHORIZED: WSAStatusAlert(ConnectionStatus.UNAUTHORIZED, InfoBarSeverity.warning, (l)=>l.status_unauthorized, (l)=>'${l.status_unauthorized_desc}\n'),
  };
  WSAStatusAlert get statusAlert => _statusAlerts[this] ?? WSAStatusAlert(this, InfoBarSeverity.error, (l)=>"Unmapped status", (l)=>"Missing alert");
}

class Env {
  static final String SYSTEM_ROOT = Platform.environment["SystemRoot"] ?? "";
  static final String USER_PROFILE = Platform.environment["UserProfile"] ?? "";
  static final String EXEC_DIR = Platform.resolvedExecutable.replaceFirst(RegExp(r'[/\\][^/\\]*$'), r'\');
  static final String TOOLS_DIR = "${EXEC_DIR}embedded-tools\\";
  static late final String POWERSHELL = WinReg.getString(RegHKey.HKEY_LOCAL_MACHINE, r'SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell', 'Path')?.value ?? '$SYSTEM_ROOT\\System32\\WindowsPowerShell\v1.0\\powershell.exe';
  
  static late final String WSA_SYSTEM_PATH = RegExp(r'^(.*)[\\/]+[^\\/]*[\\/]+[^\\/]*$').firstMatch(
      WinReg.getString(RegHKey.HKEY_LOCAL_MACHINE, r'SYSTEM\CurrentControlSet\Services\WsaService', 'ImagePath')?.value.unquoted ?? 
      WinReg.getString(RegHKey.HKEY_CURRENT_USER, r'Software\Microsoft\Windows\CurrentVersion\App Paths\WsaClient.exe', null)?.value ?? ''
    )?.group(1) ?? '';
    
  static late final String WSA_EXECUTABLE = '$WSA_SYSTEM_PATH\\WsaClient\\WsaClient.exe';
  static late final bool WSA_INSTALLED = File('$WSA_SYSTEM_PATH\\AppxManifest.xml').existsSync();
  static late final WSA_INFO = WSAPkgInfo.fromSystemPath(WSA_SYSTEM_PATH);
}

class WSAPeriodicConnector {
  static const PERIODIC_CHECK_BOOT_DURATION = Duration(milliseconds: 500);
  static const PERIODIC_CHECK_SLEEPING_DURATION = Duration(milliseconds: 750);
  static const PERIODIC_CHECK_CONNECT_DURATION = Duration(seconds: 2); // check every 2 seconds
  static int lastStart = 0;
  static bool get shouldWaitStart => DateTime.now().millisecondsSinceEpoch - lastStart < 30000; // wait 30s
  static final DynamicTimer timer = DynamicTimer((Timer t) => WSAPeriodicConnector._checkConnectionStatus());
  
  static ConnectionStatus status = ConnectionStatus.UNKNOWN;
  static WSAStatusAlert alertStatus = ConnectionStatus.UNKNOWN.statusAlert;
  static bool _statusInitialized = false;

  static bool _isChecking = false; 
  static int _lastProcessCheck = 0; // throttling timer

  // Boot WSA and immediately transition to STARTING state
  static void bootWSA() {
    lastStart = DateTime.now().millisecondsSinceEpoch;
    status = ConnectionStatus.STARTING;
    GState.connectionStatus.update((_) => status.statusAlert);
    WSAUtils.launch();
  }

  static void arrestWSA() async {
    lastStart = DateTime.now().millisecondsSinceEpoch;
    status = ConnectionStatus.ARRESTING;
    GState.connectionStatus.update((_) => status.statusAlert);
    await ADBUtils.disconnectWSA();
    WSAUtils.shutdown();
  }

  static void _checkConnectionStatus() async {
    if (_isChecking) return;
    _isChecking = true;
    try {
      final now = DateTime.now().millisecondsSinceEpoch;
      bool doProcessCheck = (now - _lastProcessCheck >= 2000); // polling period is 2s

      // Immediately assess WSA status (ADB-independent, non-blocking)
      bool isWsaBooted = WSAStatus.isBooted;
      bool isWsaRunning = isWsaBooted ? WSAStatus.isRunning : false;

      if (!isWsaBooted) {
        timer.setDuration(PERIODIC_CHECK_BOOT_DURATION);
        ConnectionStatus newStatus = Env.WSA_INSTALLED ? ConnectionStatus.ARRESTED : WinVer.isWindows11OrGreater ? ConnectionStatus.MISSING : ConnectionStatus.UNSUPPORTED;
        if (status == ConnectionStatus.STARTING && shouldWaitStart && Env.WSA_INSTALLED) {
          newStatus = ConnectionStatus.STARTING;
        }
        if (status != newStatus) GState.connectionStatus.$ = (status = newStatus).statusAlert;
        _statusInitialized = true;
      } else if (!isWsaRunning) {
        timer.setDuration(PERIODIC_CHECK_SLEEPING_DURATION);
        ConnectionStatus newStatus = ConnectionStatus.ARRESTED;
        if (status == ConnectionStatus.STARTING && shouldWaitStart) {
          newStatus = ConnectionStatus.STARTING;
        }
        if (status == ConnectionStatus.ARRESTING && shouldWaitStart) {
          newStatus = ConnectionStatus.ARRESTING;
        }
        if (status != newStatus) GState.connectionStatus.$ = (status = newStatus).statusAlert;
        _statusInitialized = true;
      } else {
        timer.setDuration(PERIODIC_CHECK_CONNECT_DURATION);
        if (status == ConnectionStatus.ARRESTED || status == ConnectionStatus.MISSING || status == ConnectionStatus.UNSUPPORTED)
          lastStart = DateTime.now().millisecondsSinceEpoch;

        // If the system is still in the "ARRESTING" state, block any subsequent ADB checks that might force the state back to "CONNECTED"
        if (status == ConnectionStatus.ARRESTING && shouldWaitStart) {
          _statusInitialized = true;
          return;
        }
      }

      // Perform a tasklist check on the connected state to determine if adb.exe is alive
      if (doProcessCheck && isWsaRunning && _statusInitialized && (status == ConnectionStatus.CONNECTED || status == ConnectionStatus.OFFLINE || status == ConnectionStatus.UNAUTHORIZED)) {
        if (!WinIO.isProcessRunning('adb.exe')) {
          status = ConnectionStatus.UNKNOWN;
          GState.connectionStatus.$ = status.statusAlert;
        }
      }

      // Perform an ADB device read (will be blocked if a cold start occurs and update adbIsStarting status during this process)
      String output = "";
      if (doProcessCheck) {
        _lastProcessCheck = now;
        try {
          bool adbWasStarting = false;
          // Debounce!
          Timer? adbTimer = Timer(const Duration(milliseconds: 250), () {
            adbWasStarting = true;
            GState.adbIsStarting.$ = true;
          });
          final process = await ADBUtils.devicesLong();
          adbTimer.cancel();
          if (adbWasStarting) GState.adbIsStarting.$ = false;
          output = process.stdout.toString();
          
          List<AdbDevice> currentDevices = [];
          for (var line in output.split('\n')) {
            if (line.trim().isEmpty || line.startsWith('List of') || line.startsWith('*')) continue;
            var parts = line.split(RegExp(r'\s+'));
            if (parts.length >= 2 && parts[1] == 'device') {
              String id = parts[0];
              bool isWSA = id == '127.0.0.1:${GState.androidPort.$}' || id == 'localhost:${GState.androidPort.$}';
              bool isWired = line.contains('usb:') || (!isWSA && !id.contains(':'));
              String model = id;
              var modelMatch = RegExp(r'model:([^\s]+)').firstMatch(line);
              if (modelMatch != null) {
                model = modelMatch.group(1)!.replaceAll('_', ' ');
              }
              currentDevices.add(AdbDevice(id, model, isWired, isWSA));
            }
          }
          
          bool _isSameDeviceList(List<AdbDevice> list1, List<AdbDevice> list2) {
            if (list1.length != list2.length) return false;
            for (int i = 0; i < list1.length; i++) {
              if (list1[i].id != list2[i].id || list1[i].name != list2[i].name || list1[i].isWired != list2[i].isWired || list1[i].isWSA != list2[i].isWSA) {
                return false;
              }
            }
            return true;
          }
          
          if (!_isSameDeviceList(GState.connectedDevices.$, currentDevices)) {
            GState.connectedDevices.$ = currentDevices;
          }
        } catch (e) {
          GState.adbIsStarting.$ = false;
        }
      }

      // WSA-specific ADB output determination is only performed if WSA is running
      if (isWsaRunning) {
        if (!doProcessCheck) return;
        final prevStatus = status;
        if (output.contains(RegExp('(^|\\n)(localhost|127.0.0.1):${GState.androidPort.$}\\s+'))) {
          if (output.contains(RegExp('(^|\\n)(localhost|127.0.0.1):${GState.androidPort.$}\\s+offline(\$|\\n|\\s)')))
            status = (status == ConnectionStatus.ARRESTED || status == ConnectionStatus.STARTING) && shouldWaitStart ?
                ConnectionStatus.STARTING : ConnectionStatus.OFFLINE;
          else if (output.contains(RegExp('(^|\\n)(localhost|127.0.0.1):${GState.androidPort.$}\\s+host(\$|\\n|\\s)'))) {
            await reconnect();
          }
          else if (output.contains(RegExp('(^|\\n)(localhost|127.0.0.1):${GState.androidPort.$}\\s+unauthorized(\$|\\n|\\s)'))) {
            status = ConnectionStatus.UNAUTHORIZED;
            if (prevStatus == ConnectionStatus.UNKNOWN) await reconnect();
          }
          else {
            // Wait for package service to be ready before declaring connected
            var propResult = await ADBUtils.shellToAddress(GState.ipAddress.$, GState.androidPort.$, 'getprop sys.boot_completed');
            if (propResult.stdout.toString().trim() != '1') {
              status = (prevStatus == ConnectionStatus.ARRESTED || prevStatus == ConnectionStatus.STARTING) && shouldWaitStart ?
                  ConnectionStatus.STARTING : ConnectionStatus.OFFLINE;
            } else {
              status = ConnectionStatus.CONNECTED;
              if (output.contains(RegExp('(^|\\n)127.0.0.1:${GState.androidPort.$}\\s+'))) {
                if (GState.ipAddress.$ != "127.0.0.1") GState.ipAddress.update((old) => "127.0.0.1");
              }
              else if (GState.ipAddress.$ != "localhost") GState.ipAddress.update((old) => "localhost");
            }
          }
        }
        else await _tryConnect();
        if (status != prevStatus) GState.connectionStatus.$ = status.statusAlert;
      }
      _statusInitialized = true;
    } finally {
      _isChecking = false;
    }
  }

  static Future<void> reconnect() async {
    await ADBUtils.disconnectWSA();
    await _tryConnect();
  }

  static Future<void> _tryConnect() async {
    ProcessResult? process = await ADBUtils.connectWSA().processTimeout(const Duration(milliseconds: 200));
    String output = (process.stdout?.toString() ?? '') + '\n' + (process.stderr?.toString() ?? '');
    bool isError = process.exitCode != 0 || process.isTimeout;
    
    if (isError || output.contains(RegExp(r'(^|\n)(cannot|failed to) connect\s.*', caseSensitive: false)) 
      || output.contains(RegExp(r'actively refused', caseSensitive: false))) {
      status = Env.WSA_INSTALLED ? (status == ConnectionStatus.ARRESTED || status == ConnectionStatus.STARTING) && shouldWaitStart ?
          ConnectionStatus.STARTING : ConnectionStatus.OFFLINE : ConnectionStatus.DISCONNECTED;
    }
    else if (output.contains(RegExp(r'(^|\n)(cannot|failed to) authenticate\s.*', caseSensitive: false))) {
      status = ConnectionStatus.UNAUTHORIZED;
    }
    else {
      status = ConnectionStatus.CONNECTED;
    }
  }
}

bool get isDesktop {
  if (kIsWeb) return false;
  return [TargetPlatform.windows, TargetPlatform.linux, TargetPlatform.macOS].contains(defaultTargetPlatform);
}

class Constants {
  static late final String packageFile;
  static late final AppPackage packageType;
  static late final bool installMode;
  static late final IsolateRef<dynamic, APK_READER_FLAGS>? isolate;
}

class _GlobalWindowListener extends WindowListener {
  @override
  void onWindowClose() {
    GState.cancelCallback.$?.call();
    WinPath.cleanTempDirs();
  }
}

final _globalWindowListener = _GlobalWindowListener();

void main(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (isDesktop) {
    await windowManager.ensureInitialized();
  }
  
  const app = MyApp();
  final wrappedApp = SharedValue.wrapApp(app);
  darkMode = PlatformDispatcher.instance.platformBrightness == Brightness.dark;
  
  runApp(wrappedApp);
  AppOptions.init();

  Constants.installMode = arguments.isNotEmpty;
  Constants.packageFile = Constants.installMode ? arguments.first : '';
  Constants.packageType = AppPackageType.fromArguments(arguments);
  Constants.isolate = Constants.installMode ? Constants.packageType.read(arguments.first) : null;
  
  await flutter_acrylic.Window.initialize();
  WSAPeriodicConnector._checkConnectionStatus();
  
  flutter_acrylic.Window.hideWindowControls();
  
  if (isDesktop) {
    windowManager.addListener(_globalWindowListener);
    windowManager.waitUntilReadyToShow(WindowOptions(
      title: appTitle,
      size: Constants.installMode ? const Size(500, 335) : const Size(740, 540),
      minimumSize: Constants.installMode ? const Size(500, 335) : const Size(640, 500),
      maximumSize: Constants.installMode ? const Size(500, 335) : null,
      center: true,
      backgroundColor: Colors.transparent,
      titleBarStyle: TitleBarStyle.hidden,
    ), () async {
      await windowManager.show();
      await windowManager.focus();
      
      final iconSend = Constants.isolate;
      if (iconSend != null) {
        iconSend.sendFlag(APK_READER_FLAGS.UI_LOADED, true);
      }
      
      // Crucial: Re-inject DWM Acrylic/Mica effects into the OS after the window has stabilized.
      // Delay by 50ms to ensure `window_manager` has fully completed its style reset operations
      // Otherwise, the ApkInstaller page background would turn pitch black and obscure the text.
      if (WinVer.isWindows11OrGreater) {
        Future.delayed(const Duration(milliseconds: 50), () {
          final themeMode = GState.theme.$.mode;
          final isDark = themeMode == ThemeMode.system ? darkMode : themeMode == ThemeMode.dark;
          final isMicaEnabled = GState.mica.$.enabled;
          
          flutter_acrylic.Window.setEffect(
            effect: isMicaEnabled ? flutter_acrylic.WindowEffect.mica : flutter_acrylic.WindowEffect.disabled, 
            dark: isDark
          );
        });
      }
    });
  }
}

class FallbackFluentLocalizationsDelegate extends LocalizationsDelegate<FluentLocalizations> {
  const FallbackFluentLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Tillad alle sprog, så Flutter ikke kaster en fejl
    return true; 
  }

  @override
  Future<FluentLocalizations> load(Locale locale) async {
    // Hvis FluentUI understøtter sproget (f.eks. 'es', 'de', 'en'), bruges det
    if (FluentLocalizations.delegate.isSupported(locale)) {
      return await FluentLocalizations.delegate.load(locale);
    }
    // Hvis sproget ikke understøttes af FluentUI (som 'da'), faldes der tilbage på engelsk
    return await FluentLocalizations.delegate.load(const Locale('en'));
  }

  @override
  bool shouldReload(FallbackFluentLocalizationsDelegate old) => false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  void setMicaEffect(bool micaEnabled, [bool dark = true]) {
    if (WinVer.isWindows11OrGreater)
      flutter_acrylic.Window.setEffect(effect: micaEnabled ? flutter_acrylic.WindowEffect.mica : flutter_acrylic.WindowEffect.disabled, dark: dark);
  }

  @override
  Widget build(BuildContext context) {
    darkMode = PlatformDispatcher.instance.platformBrightness == Brightness.dark;
    final theme = GState.theme.of(context).mode;
    final mica = GState.mica.of(context);
    
    final bool isDark = theme == ThemeMode.system ? darkMode : theme == ThemeMode.dark;
    setMicaEffect(mica.enabled, isDark);
    
    final bool isMicaInstall = Constants.installMode && mica.enabled;
    final bool IsFullMicaOrInstall = mica.full || isMicaInstall;
    
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) {
        final appTheme = context.watch<AppTheme>();
        return FluentApp(
          title: appTitle,
          themeMode: theme,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          locale: GState.locale.of(context),
          localizationsDelegates: const [
            FallbackFluentLocalizationsDelegate(), // i tilfælde af, at fluent_ui ikke understøtter internationalisering for visse sprog (f.eks. dansk)
            AppLocalizations.delegate,
            locale.GlobalMaterialLocalizations.delegate,
            WidgetLocalizationOverrides.delegate,
            FluentLocalizations.delegate,
          ],
          supportedLocales: LocaleUtils.supportedLocales,
          localeResolutionCallback: LocaleUtils.localeResolutionCallback,
          routes: {'/': (_) => Constants.installMode ? const ApkInstaller() : const MyHomePage()},
          theme: FluentThemeData(
            buttonTheme: ButtonThemeData(
              defaultButtonStyle: ButtonStyle(
                shadowColor: WidgetStateProperty.all(Colors.transparent),
                shape: WidgetStateProperty.resolveWith((states) {
                  final BorderSide side;
                  if (isDark) {
                    if (states.contains(WidgetState.disabled)) side = const BorderSide(width: 0.5, color: Color.fromRGBO(240, 240, 240, 0.05));
                    else if (states.contains(WidgetState.hovered) && !states.contains(WidgetState.pressed)) side = const BorderSide(width: 0.5, color: Color.fromRGBO(240, 240, 240, 0.035));
                    else side = const BorderSide(width: 0.5, color: Color.fromRGBO(240, 240, 240, 0.07));
                  } else {
                    if (states.contains(WidgetState.disabled)) side = const BorderSide(width: 0.5, color: Color.fromRGBO(33, 33, 33, 0.12));
                    else if (states.contains(WidgetState.hovered) && !states.contains(WidgetState.disabled) && !states.contains(WidgetState.pressed)) side = const BorderSide(width: 0.5, color: Color.fromRGBO(33, 33, 33, 0.22));
                    else side = const BorderSide(width: 0.5, color: Color.fromRGBO(33, 33, 33, 0.07));
                  }
                  return RoundedRectangleBorder(borderRadius: BorderRadius.circular(4), side: side);
                }),
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (isDark) {
                    if (states.contains(WidgetState.disabled)) return const Color.fromRGBO(255, 255, 255, 0.045);
                    if (states.contains(WidgetState.pressed)) return const Color.fromRGBO(255, 255, 255, 0.03);
                    if (states.contains(WidgetState.hovered)) return const Color.fromRGBO(255, 255, 255, 0.08);
                    return const Color.fromRGBO(255, 255, 255, 0.055);
                  } else {
                    if (states.contains(WidgetState.disabled)) return const Color.fromRGBO(249, 249, 249, 0.045);
                    if (states.contains(WidgetState.pressed)) return const Color.fromRGBO(240, 240, 240, 0.4);
                    if (states.contains(WidgetState.hovered)) return const Color.fromRGBO(249, 249, 249, 0.65);
                    return const Color.fromRGBO(255, 255, 255, 0.8);
                  }
                })
              ) ,
            ),
            tooltipTheme: TooltipThemeData(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF2B2B2B) : const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: isDark ? const Color(0xFF454545) : const Color(0xFFE5E5E5), width: 1.0),
              ),
              textStyle: TextStyle(
                color: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
                fontSize: 12.0,
              ),
            ),
            scaffoldBackgroundColor: IsFullMicaOrInstall ? Colors.transparent : isDark ? const Color(0xFF272727) : const Color(0xFFf9f9f9),
            micaBackgroundColor: mica.enabled ? Colors.transparent : isDark ? const Color(0xFF202020) : const Color(0xFFf3f3f3),
            
            // Crucial: In newer versions of fluent_ui, NavigationView draws the pane's background independently. 
            // Even if the first two elements are set to transparent, NavigationView will still fill the entire viewport
            // with its own preset solid color. Therefore, it is necessary to override the three layer of background settings
            // of FluentThemeData simultaneously.
            navigationPaneTheme: NavigationPaneThemeData(
              backgroundColor: mica.enabled ? Colors.transparent : (isDark ? const Color(0xFF202020) : const Color(0xFFf3f3f3)),
            ),
            
            accentColor: appTheme.getColor(isDark),
            brightness: isDark ? Brightness.dark : Brightness.light,
            visualDensity: VisualDensity.standard,
            focusTheme: FocusThemeData(
              glowFactor: is10footScreen(context) ? 2.0 : 0.0,
            ),
          ),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;
  int index = 0;
  final colorsController = ScrollController();
  final settingsController = ScrollController();

  @override
  void dispose() {
    colorsController.dispose();
    settingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final appTheme = context.watch<AppTheme>();
    final theme = FluentTheme.of(context);
    
    return Mica(
      child: NavigationView(
      contentShape: RoundedRectangleBorder(
        side: BorderSide(width: 0.3, color: theme.micaBackgroundColor.lerpWith(Colors.black, 0.25)),
        borderRadius: BorderRadius.zero,
      ),
      titleBar: SizedBox(
        height: 40.0,
        child: Row(
          children: [
            Expanded(
              child: moveWindow(
                Padding(
                  padding: const EdgeInsets.only(top: 9, left: 13, right: 13), 
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      Text(lang.screen_title, style: theme.typography.caption),
                      const SizedBox(width: 10),
                      Text('v$appVersion', style: theme.typography.caption?.copyWith(
                        color: theme.inactiveColor.withAlpha(theme.brightness == Brightness.light ? 0x3F : 0x1B))),
                    ]
                  )
                )
              )
            ),
            if (!kIsWeb) const WindowButtons(),
          ]
        ),
      ),
      pane: NavigationPane(
        selected: index,
        onChanged: (i) => setState(() => index = i),
        header: Container(
          height: kOneLineTileHeight,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: material.Row(children: [AnimatedContainer(
            width: 28,
            height: 28,
            duration: const Duration(milliseconds: 750),
            curve: Curves.fastOutSlowIn,
            decoration: const BoxDecoration (
              image: DecorationImage(image: AssetImage("assets/images/logo.png"))
            ),
          ), const SizedBox(width: 10), Text("PacMan-APK", style: theme.typography.bodyLarge)]),
        ),
        displayMode: appTheme.displayMode,
        indicator: () {
          switch (appTheme.indicator) {
            case NavigationIndicators.end:
              return const EndNavigationIndicator();
            // case NavigationIndicators.sticky:
            default:
              return const StickyNavigationIndicator();
          }
        }(),
        items: [
          PaneItem(
            icon: const Icon(material.Icons.adb),
            title: const Text('WSA'),
            body: const ScreenWSA(),
          ),
          PaneItem(
            icon: const Icon(material.Icons.cable),
            title: const Text('Wired'),
            body: const ScreenWired(),
          )
        ],
        footerItems: [
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: Text(lang.screen_settings),
            body: ScreenSettings(controller: settingsController),
          ),
        ],
      ),
    ));
  }
}

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  bool _isMaximized = false;

  @override
  void initState() {
    super.initState();
    _updateMaximizedState();
  }

  void _updateMaximizedState() async {
    bool max = await windowManager.isMaximized();
    if (mounted) setState(() => _isMaximized = max);
  }

  static Color windowButtonAlphaColor(FluentThemeData style, Set<WidgetState> states) {
    if (style.brightness == Brightness.light) {
      if (states.contains(WidgetState.pressed)) return Colors.black.withOpacity(0.075);
      if (states.contains(WidgetState.hovered)) return Colors.black.withOpacity(0.11);
      return Colors.transparent;
    } else {
      if (states.contains(WidgetState.pressed)) return Colors.white.withOpacity(0.03);
      if (states.contains(WidgetState.hovered)) return Colors.white.withOpacity(0.06);
      return Colors.transparent;
    }
  }

  Widget _buildWindowButton({
    required VoidCallback onPressed,
    required IconData icon,
    required Color Function(Set<WidgetState> states) getBgColor,
    required Color Function(Set<WidgetState> states) getIconColor,
  }) {
    return HoverButton(
      onPressed: onPressed,
      builder: (context, states) {
        return Container(
          width: 45,
          height: 40,
          color: getBgColor(states),
          child: Center(
            child: Icon(
              icon,
              size: 12,
              color: getIconColor(states),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasFluentTheme(context));
    assert(debugCheckHasFluentLocalizations(context));
    final FluentThemeData theme = FluentTheme.of(context);
    final mica = GState.mica.of(context);

    Color getNormalButtonBg(Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return mica.enabled 
             ? windowButtonAlphaColor(theme, {WidgetState.pressed})
             : ButtonThemeData.buttonColor(context, {WidgetState.pressed}).lerpWith(theme.shadowColor, 0.12).withAlpha(150);
      }
      if (states.contains(WidgetState.hovered)) {
        return mica.enabled 
             ? windowButtonAlphaColor(theme, {WidgetState.hovered})
             : ButtonThemeData.buttonColor(context, {WidgetState.hovered}).lerpWith(Colors.black, 0.12);
      }
      return Colors.transparent;
    }

    Color getCloseButtonBg(Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) return Colors.red.dark;
      if (states.contains(WidgetState.hovered)) return Colors.red;
      return Colors.transparent;
    }

    Color getCloseButtonIconColor(Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) return Colors.red.dark.basedOnLuminance();
      if (states.contains(WidgetState.hovered)) return Colors.red.basedOnLuminance();
      return theme.iconTheme.color ?? theme.inactiveColor;
    }

    return Row(
      children: [
        Tooltip(
          message: FluentLocalizations.of(context).minimizeWindowTooltip,
          child: _buildWindowButton(
            onPressed: () => windowManager.minimize(),
            icon: FluentIcons.chrome_minimize,
            getBgColor: getNormalButtonBg,
            getIconColor: (states) => theme.iconTheme.color ?? theme.inactiveColor,
          ),
        ),
        Tooltip(
          message: FluentLocalizations.of(context).restoreWindowTooltip,
          child: _buildWindowButton(
            onPressed: () async {
              if (await windowManager.isMaximized()) {
                await windowManager.unmaximize();
              } else {
                await windowManager.maximize();
              }
              _updateMaximizedState();
            },
            icon: _isMaximized ? FluentIcons.back_to_window : FluentIcons.full_screen,
            getBgColor: getNormalButtonBg,
            getIconColor: (states) => theme.iconTheme.color ?? theme.inactiveColor,
          ),
        ),
        Tooltip(
          message: FluentLocalizations.of(context).closeWindowTooltip,
          child: _buildWindowButton(
            onPressed: () {
              GState.cancelCallback.$?.call();
              WinPath.cleanTempDirs();
              windowManager.close();
            },
            icon: FluentIcons.cancel,
            getBgColor: getCloseButtonBg,
            getIconColor: getCloseButtonIconColor,
          ),
        ),
      ],
    );
  }
}