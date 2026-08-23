// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures
import 'package:pacman_apk/parser/android_utils.dart';
import 'package:pacman_apk/parser/permissions.dart';
import 'package:pacman_apk/global_state.dart';
import 'package:pacman_apk/main.dart';
import 'package:pacman_apk/utils/adbwsa_utils.dart';
import 'package:pacman_apk/widget/smooth_list_view.dart';
import 'package:pacman_apk/windows/win_io.dart';
import 'package:pacman_apk/windows/win_path.dart';
import 'package:pacman_apk/widget/adaptive_icon.dart';
import 'package:pacman_apk/widget/flexible_info_bar.dart';
import 'package:pacman_apk/widget/move_window_nomax.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:pacman_apk/l10n/app_localizations.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:developer';

class ApkInstaller extends StatefulWidget {
  const ApkInstaller({Key? key}) : super(key: key);

  static void createLaunchIcon(String package, String appName) {
    if (!Env.WSA_INSTALLED) return;
    WinIO.createShortcut(
      "%LOCALAPPDATA%\\Microsoft\\WindowsApps\\${Env.WSA_INFO.familyName}\\WsaClient.exe", 
       "${WinPath.desktop}\\$appName", 
      args: "/launch wsa://$package",
      icon: '%LOCALAPPDATA%\\Packages\\${Env.WSA_INFO.familyName}\\LocalState\\$package.ico');
  }

  static void installApk(String apkFile, String ipAddress, int port, AppLocalizations lang, int timeout, [bool downgrade = false]) async {
    log("INSTALLING \"$apkFile\" on on $ipAddress:$port...");
    var installation = ADBUtils.installToAddress(ipAddress, port, apkFile, downgrade: downgrade);
    if (timeout > 0) installation = installation.processTimeout(Duration(seconds: timeout));
    installation = installation.defaultError();

    GState.apkInstallState.update((_) => InstallState.INSTALLING);
    var result = await installation;
    
    String error = result.stderr.toString();
    log("EXIT CODE: ${result.exitCode}, OUTPUT: ${result.stdout}\n ERROR: $error");

    if (result.exitCode == 0) GState.apkInstallState.update((_) => InstallState.SUCCESS);
    else if (result.isTimeout) {
      GState.apkInstallState.update((_) => InstallState.TIMEOUT);
      GState.errorCode.update((_) => "TIMEOUT");
      GState.errorDesc.update((_) => lang.installer_error_timeout);
    } else {
      GState.apkInstallState.update((_) => InstallState.ERROR);
      RegExpMatch? errorMatch = RegExp(r'(^|\n)\s*adb:\s+failed\s+to\s+install\s+.*:\s+Failure\s+\[([^:]*):\s*([^\s].*[^\s])\s*\]').firstMatch(error);
      String errorCode = errorMatch?.group(2) ?? "";
      GState.errorCode.update((_) => errorCode.isNotEmpty ? errorCode : "UNKNOWN_ERROR");
      String errorDesc = errorMatch?.group(3) ?? "";
      GState.errorDesc.update((_) => errorDesc.isNotEmpty ? errorDesc : 
         "${lang.installer_error_nomsg}\nRetval: ${result.exitCode}\nOutput: ${result.stdout}\nError: $error");
    }
  }

  @override
  _ApkInstallerState createState() => _ApkInstallerState();
}

class _ApkInstallerState extends State<ApkInstaller> {
  int index = 0;
  ToggleButtonThemeData? warningButtonTheme;
  bool createShortcut = false;
  bool startingWSA = false;
  AdbDevice? _selectedDevice;
  AdbDevice? _lastQueriedDevice;
  String _lastQueriedPackage = "";

  // Helper method to map Android API level to OS version string
  String _getAndroidVersion(int apiLevel) {
    if (apiLevel == 37) return "17";
    if (apiLevel == 36) return "16";
    if (apiLevel == 35) return "15";
    if (apiLevel == 34) return "14";
    if (apiLevel == 33) return "13";
    if (apiLevel == 32) return "12L";
    if (apiLevel == 31) return "12";
    if (apiLevel == 30) return "11";
    if (apiLevel == 29) return "10";
    if (apiLevel == 28) return "9";
    if (apiLevel == 27) return "8.1";
    if (apiLevel == 26) return "8.0";
    if (apiLevel == 25) return "7.1";
    if (apiLevel == 24) return "7.0";
    if (apiLevel == 23) return "6.0";
    if (apiLevel == 22) return "5.1";
    if (apiLevel == 21) return "5.0";
    if (apiLevel == 20) return "4.4W";
    if (apiLevel == 19) return "4.4";
    if (apiLevel == 18) return "4.3";
    if (apiLevel == 17) return "4.2";
    if (apiLevel == 16) return "4.1";
    if (apiLevel == 15) return "4.0.4";
    if (apiLevel == 14) return "4.0.3";
    if (apiLevel == 13) return "3.2";
    if (apiLevel == 12) return "3.1";
    if (apiLevel == 11) return "3.0";
    if (apiLevel == 10) return "2.3.3";
    if (apiLevel == 9) return "2.3";
    if (apiLevel == 8) return "2.2";
    if (apiLevel == 7) return "2.1";
    if (apiLevel == 6) return "2.0.1";
    if (apiLevel == 5) return "2.0";
    if (apiLevel == 4) return "1.6";
    if (apiLevel == 3) return "1.5";
    if (apiLevel == 2) return "1.1";
    if (apiLevel == 1) return "1.0";
    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final isLtr = Directionality.of(context) == TextDirection.ltr;
    Widget icon;

    String appTitle = GState.apkTitle.of(context);
    Widget? aForeground = GState.apkForegroundIcon.of(context);
    bool adaptiveNoScale = GState.apkAdaptiveNoScale.of(context);
    Widget? lIcon = GState.apkIcon.of(context);
    
    WSAStatusAlert connectionStatus = GState.connectionStatus.of(context);
    bool isConnected = connectionStatus.isConnected;

    List<AdbDevice> validDevices = GState.connectedDevices.of(context).where((d) => d.isWired || d.isWSA).toList();
    AdbDevice? effectiveDevice = _selectedDevice;
    if (effectiveDevice != null && !validDevices.contains(effectiveDevice)) {
        effectiveDevice = null;
    }
    if (effectiveDevice == null && validDevices.length == 1) {
        effectiveDevice = validDevices.first;
    }

    String pkg = GState.package.of(context);
    int vCode = GState.versionCode.of(context);

    // Dynamically query the installation status for the device when the device selection or package changes
    if (effectiveDevice != null && pkg.isNotEmpty && (_lastQueriedDevice != effectiveDevice || _lastQueriedPackage != pkg)) {
      _lastQueriedDevice = effectiveDevice;
      _lastQueriedPackage = pkg;
      final String deviceId = effectiveDevice.id;
      material.WidgetsBinding.instance.addPostFrameCallback((_) {
        GState.apkInstallType.update((_) => null);
        GState.oldVersion.update((_) => "");
        ADBUtils.shell(deviceId, 'dumpsys package $pkg').then((result) {
          var verMatch = RegExp(r'(\n|\s|^)versionCode=([0-9]*)[^\n]*(\n([^\s\n]*\s)*versionName=([^\n\s_$]*))?').firstMatch(result.stdout.toString());
          int? oldVersionCode = int.tryParse(verMatch?.group(2) ?? "");
          if (result.exitCode != 0) GState.apkInstallType.update((_) => InstallType.UNKNOWN);
          else if (oldVersionCode != null) {
            GState.apkInstallType.update((_) => (oldVersionCode < vCode) ? InstallType.UPDATE :
                (oldVersionCode > vCode) ? InstallType.DOWNGRADE : InstallType.REINSTALL);
            String oldVersion = verMatch!.group(5) ?? "???";
            GState.oldVersion.update((_) => oldVersion);
          } else GState.apkInstallType.update((_) => InstallType.INSTALL);
        }).onError((_, __) {
          GState.apkInstallType.update((_) => InstallType.UNKNOWN);
        });
      });
    }
    
    InstallType? installType = GState.apkInstallType.of(context);
    bool canInstall = effectiveDevice != null && installType != null && installType != InstallType.UNKNOWN;
    int minSdkVersion = GState.minSdkVersion.of(context);

    InstallState installState = GState.apkInstallState.of(context);
    final bool adbIsStarting = GState.adbIsStarting.of(context);
    final mica = GState.mica.of(context);
    final theme = FluentTheme.of(context);
    
    if (startingWSA && isConnected) startingWSA = false;
    final autostartWSA = !startingWSA && !isConnected && GState.autostartWSA.of(context);
    if (autostartWSA) {
      startingWSA = true;
      if (!WSAUtils.launch()) setState(() {startingWSA = false;});
    }

    if (installType == InstallType.DOWNGRADE && warningButtonTheme == null) warningButtonTheme = ToggleButtonThemeData.standard(theme.copyWith(accentColor: Colors.orange));

    String package = GState.package.of(context);
    String version = GState.version.of(context);
    String activity = GState.activity.of(context);
    int installTimeout  = GState.installTimeout.of(context);
    bool isLaunchable = package.isNotEmpty && activity.isNotEmpty;
    String oldVersion = GState.oldVersion.of(context);
    
    if (aForeground != null) icon = AdaptiveIcon(noScale: adaptiveNoScale, backColor: GState.apkBackgroundColor.of(context), background: GState.apkBackgroundIcon.of(context), foreground: aForeground, radius: GState.iconShape.of(context).radius);
    else if (lIcon != null) icon = FittedBox(child: lIcon);
    else icon = const ProgressRing();

    Widget titleWidget = Row (
      crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Flexible(child: SizedBox(width: 30.00, height: 30.00, child: icon)),
          const Flexible(child: SizedBox(width: 20)),
          Text(appTitle, style: theme.typography.bodyLarge),
      ]
    );

    return Mica(child: moveWindow(Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ((){switch(installState) {
          case InstallState.PROMPT: return [
            titleWidget,
            Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(lang.installer_message),
                const SizedBox(height: 10),
                Text((oldVersion.isNotEmpty ? lang.installer_info_version_change(oldVersion, version) : lang.installer_info_version(version)).replaceAll(' ', '\u00A0'), style: TextStyle(color: theme.resources.textFillColorDisabled), overflow: TextOverflow.ellipsis, maxLines: 1),
                Text(lang.installer_info_package(package).replaceAll(' ', '\u00A0'), style: TextStyle(color: theme.resources.textFillColorDisabled), overflow: TextOverflow.ellipsis, maxLines: 1),
                if (minSdkVersion > 0)
                  Text(lang.installer_info_minosver(_getAndroidVersion(minSdkVersion), minSdkVersion).replaceAll(' ', '\u00A0'), style: TextStyle(color: theme.resources.textFillColorDisabled), overflow: TextOverflow.ellipsis, maxLines: 1),
                if (validDevices.length > 1)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ComboBox<AdbDevice>(
                      isExpanded: true,
                      placeholder: Text(lang.installer_select_hints),
                      value: effectiveDevice,
                      items: validDevices.map((d) => ComboBoxItem<AdbDevice>(
                        value: d,
                        child: Text('${d.name} (${d.id})'),
                      )).toList(),
                      onChanged: (val) => setState(() => _selectedDevice = val),
                    ),
                  ),
              ]
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: theme.brightness == Brightness.dark
                      ? theme.inactiveBackgroundColor
                      : (mica.disabled ? theme.scaffoldBackgroundColor : Colors.white.withOpacity(0.6)),
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: SmoothListView(
                    children: [
                      for (var permission in GState.permissions.of(context)) Container(
                        padding: EdgeInsets.only(right: isLtr ? 10 : 0, left: isLtr ? 0 : 10),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          child: Row(
                            children: [
                              IconTheme.merge(
                                data: const IconThemeData(size: 20.0),
                                child: permission.icon,
                              ),
                              const SizedBox(width: 12),
                              Expanded(child: Text(permission.description(lang), style: theme.typography.body)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                noMoveWindow(Button(
                  child: Text(lang.installer_btn_cancel),
                  onPressed: () {
                    GState.cancelCallback.$?.call();
                    WinPath.cleanTempDirs();
                    windowManager.close();
                  },
                )),
                const SizedBox(width: 15),
                  noMoveWindow(ToggleButton(
                    child: Text(startingWSA ? lang.installer_btn_starting : 
                      (adbIsStarting ? lang.installer_btn_loading : 
                      (installType?.buttonText(lang) ?? (pkg.isNotEmpty && effectiveDevice == null ? lang.installer_btn_install : lang.installer_btn_loading)))),
                    checked: true,
                    onChanged: !canInstall ? null : (_) async {
                      if (Constants.packageType.directInstall) {
                        ApkInstaller.installApk(Constants.packageFile, effectiveDevice!.id, -1, lang, installTimeout, installType == InstallType.DOWNGRADE);
                      } else {
                        await GState.installCallback.$?.call(effectiveDevice!.id, -1, lang, installTimeout, installType == InstallType.DOWNGRADE);
                      }
                    },
                  )),
              ]
            )
          ];
        
        case InstallState.INSTALLING: return [
          titleWidget,
          const SizedBox(height: 10),
          Text(lang.installer_installing(appTitle)),
          const Spacer(),
          Row(children: const [Expanded(child: ProgressBar(strokeWidth: 6))]),
        ];
        
        case InstallState.SUCCESS: 
          bool isWSA = effectiveDevice?.isWSA ?? false;
          return [
            titleWidget,
            const SizedBox(height: 10),
            Text(lang.installer_installed(appTitle)),
            if (installType == InstallType.INSTALL && isWSA) const SizedBox(height: 10),
            if (installType == InstallType.INSTALL && isWSA) Checkbox(
              checked: createShortcut,
              content: Text(lang.installer_btn_checkbox_shortcut),
              onChanged: (value) => setState(() => createShortcut = value!),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                noMoveWindow(Button(
                  child: Text(lang.installer_btn_dismiss),
                  onPressed: () {
                    if (isWSA && createShortcut) ApkInstaller.createLaunchIcon(package, appTitle);
                    GState.cancelCallback.$?.call();
                    WinPath.cleanTempDirs();
                    windowManager.close();
                  },
                )),
                (){return isLaunchable ? const SizedBox(width: 15) : const SizedBox.shrink();}(),
                (){return isLaunchable ? noMoveWindow(ToggleButton(
                  child: Text(lang.installer_btn_open),
                  checked: true,
                  onChanged: (_) {
                    if (isWSA) {
                      if (createShortcut) ApkInstaller.createLaunchIcon(package, appTitle);
                      WSAUtils.launchApp(package);
                    } else if (effectiveDevice != null) {
                      // Launch the app cleanly via standard Activity Manager intent on a physical device or a device connected via wired ADB
                      final String target = activity.contains('/') ? activity : '$package/$activity';
                      final String launchCmd = activity.isNotEmpty
                          ? 'am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -f 0x10200000 -n $target'
                          : 'am start -a android.intent.action.MAIN -c android.intent.category.LAUNCHER -f 0x10200000 -p $package';
                      ADBUtils.shell(effectiveDevice.id, launchCmd);
                    }
                    GState.cancelCallback.$?.call();
                    WinPath.cleanTempDirs();
                    windowManager.close();
                  },
                )) : const SizedBox.shrink();}()
              ]
            )
          ];
        case InstallState.ERROR: case InstallState.TIMEOUT: return [
          titleWidget,
          const SizedBox(height: 10),
          Text(lang.installer_fail(appTitle)),
          const SizedBox(height: 10),
          FlexibleInfoBar(
            title: noMoveWindow(material.SelectableText(GState.errorCode.of(context))),
            content: noMoveWindow(material.SelectableText(GState.errorDesc.of(context))),
            severity: installState == InstallState.ERROR ? InfoBarSeverity.error : InfoBarSeverity.warning
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              noMoveWindow(Button(
                child: Text(lang.installer_btn_dismiss),
                onPressed: () {
                  GState.cancelCallback.$?.call();
                  WinPath.cleanTempDirs();
                  windowManager.close();
                },
              ))
            ]
          )
        ];
        }})(),
      ),
    )));
  }
}