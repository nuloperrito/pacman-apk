// ignore_for_file: avoid_print
import 'package:fluent_ui/fluent_ui.dart';
import 'package:pacman_apk/l10n/app_localizations.dart';
import 'package:pacman_apk/utils/adbwsa_utils.dart';
import 'package:pacman_apk/widget/fluent_card.dart';
import 'package:pacman_apk/widget/fluent_info_bar.dart';
import 'package:pacman_apk/widget/smooth_list_view.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

import '../main.dart';
import '../global_state.dart';

class ScreenWSA extends StatefulWidget {
  const ScreenWSA({Key? key}) : super(key: key);

  @override
  _ScreenWSAState createState() => _ScreenWSAState();
}

class EmptyElement extends Element {
  EmptyElement(Empty widget) : super(widget);
  @override
  void performRebuild() {
    super.performRebuild();
  }
  @override
  bool get debugDoingBuild => false;
  @override
  Empty get widget => super.widget as Empty;
}

class Empty extends Widget {
  const Empty();
  @override
  Element createElement() => EmptyElement(this);
}

Expanded EMPTY = Expanded(child: Column());

class _ScreenWSAState extends State<ScreenWSA> {
  final autoSuggestBox = TextEditingController();
  final values = ['Blue', 'Green', 'Yellow', 'Red'];
  String? comboBoxValue;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var connectionStatus = GState.connectionStatus.of(context);
    final lang = AppLocalizations.of(context)!;
    const smallSpacer = SizedBox(height: 5.0);
    final mica = GState.mica.of(context);
    final isDark = FluentTheme.of(context).brightness == Brightness.dark;

    // Determine exact disable conditions
    final bool disableAppBtn = connectionStatus.isDisconnected;
    final bool disableSettingsBtn = connectionStatus.isDisconnected && !connectionStatus.isPoweredOn;

    Widget page = ScaffoldPage(
      header: PageHeader(title: Text(lang.screen_title)),
      content: SmoothListView(
        padding: EdgeInsets.only(
          bottom: kPageDefaultVerticalPadding,
          left: PageHeader.horizontalPadding(context),
          right: PageHeader.horizontalPadding(context),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FluentInfoBar(
              title: Text(connectionStatus.title(lang)),
              content: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
                Text(connectionStatus.desc(lang)),
                if (connectionStatus.type == ConnectionStatus.ARRESTED) ...[
                  const SizedBox(width: 15.0),
                  Button(child: Text(lang.btn_boot), onPressed: () => WSAPeriodicConnector.bootWSA())
                ]
                else if (connectionStatus.type == ConnectionStatus.STARTING) ...[
                  const SizedBox(width: 15.0),
                  Button(
                    onPressed: null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 14, height: 14, child: ProgressRing(strokeWidth: 2)),
                        const SizedBox(width: 8),
                        Text(lang.status_starting)
                      ]
                    )
                  )
                ]
                else if (connectionStatus.type == ConnectionStatus.ARRESTING) ...[
                  const SizedBox(width: 15.0),
                  Button(
                    onPressed: null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 14, height: 14, child: ProgressRing(strokeWidth: 2)),
                        const SizedBox(width: 8),
                        Text(lang.status_arresting)
                      ]
                    )
                  )
                ]
                else if (connectionStatus.type == ConnectionStatus.CONNECTED) ...[
                  const SizedBox(width: 15.0),
                  Button(child: Text(lang.btn_arrest), onPressed: () => WSAPeriodicConnector.arrestWSA())
                ]
                else if (connectionStatus.type == ConnectionStatus.UNAUTHORIZED) ...[
                  Button(child: Text(lang.btn_auth), onPressed: () => WSAPeriodicConnector.reconnect()),
                  const SizedBox(width: 15.0),
                  Button(child: Text(lang.btn_dev_settings), onPressed: () => WSAUtils.launchDeveloperSettings())
                ]
                else if (connectionStatus.type == ConnectionStatus.OFFLINE) ...[
                  Button(child: Text(lang.btn_dev_settings), onPressed: () => WSAUtils.launchDeveloperSettings())
                ],
              ]),
              isLong: true,
              severity: connectionStatus.severity,
              action: () {}(),
            )
          ),
          const SizedBox(height: 20),
          Text(lang.wsa_manage, style: FluentTheme.of(context).typography.bodyLarge),
          const SizedBox(height: 20),
          
          Opacity(
            opacity: disableAppBtn ? 0.5 : 1.0,
            child: IgnorePointer(
              ignoring: disableAppBtn,
              child: FluentCard(
                leading: const Icon(MdiIcons.android , size: 23),
                content: Text(lang.wsa_manage_app),
                isButton: !disableAppBtn,
                onPressed: disableAppBtn ? 
                      null : () => ADBUtils.shellToAddress(GState.ipAddress.of(context), GState.androidPort.of(context), 
                       r'am start -f 0x10008000 -n com.android.settings/.Settings\$ManageApplicationsActivity'),
              ),
            ),
          ),
          smallSpacer,
          Opacity(
            opacity: disableSettingsBtn ? 0.5 : 1.0,
            child: IgnorePointer(
              ignoring: disableSettingsBtn,
              child: FluentCard(
                leading: const Icon(MdiIcons.cogs, size: 23),
                content: Text(lang.wsa_manage_settings),
                isButton: !disableSettingsBtn,
                onPressed: disableSettingsBtn ? null : 
                    (connectionStatus.isDisconnected ? () => WSAUtils.launchSettings() : 
                      () => ADBUtils.shellToAddress(GState.ipAddress.of(context), GState.androidPort.of(context), 
                       r'am start com.android.settings/.Settings')),
              ),
            ),
          )
        ],
      ),
    );
    return mica.partial
        ? ColoredBox(
            color: isDark ? const Color(0xFF272727) : const Color(0xFFf9f9f9),
            child: page,
          )
        : page;
  }
}

class ScreenWired extends StatelessWidget {
  const ScreenWired({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final devices = GState.connectedDevices.of(context).where((d) => d.isWired).toList();
    final adbIsStarting = GState.adbIsStarting.of(context);
    final isDark = FluentTheme.of(context).brightness == Brightness.dark;
    final mica = GState.mica.of(context);
    final lang = AppLocalizations.of(context)!;

    InfoBarSeverity severity;
    String title;
    String content;
    Widget? action;

    if (adbIsStarting) {
      severity = InfoBarSeverity.info;
      title = lang.status_unknown; 
      content = lang.installer_btn_loading; 
      action = const ProgressRing();
    } else if (devices.isEmpty) {
      severity = InfoBarSeverity.error;
      title = lang.wired_device_none_title;
      content = lang.wired_device_none_content;
    } else if (devices.length == 1) {
      severity = InfoBarSeverity.success;
      title = lang.wired_device_one_title;
      content = lang.wired_device_one_content(devices[0].name, devices[0].id);
    } else {
      severity = InfoBarSeverity.info;
      title = lang.wired_device_multiple_title;
      final deviceListStr = devices.map((d) => "  ${d.name} (${d.id})").join("\n");
      content = lang.wired_device_multiple_content(deviceListStr);
    }

    Widget page = ScaffoldPage(
      header: PageHeader(title: Text(lang.screen_title)),
      content: Padding(
        padding: EdgeInsets.only(
          bottom: kPageDefaultVerticalPadding,
          left: PageHeader.horizontalPadding(context),
          right: PageHeader.horizontalPadding(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FluentInfoBar(
              title: Text(title),
              content: Text(content),
              severity: severity,
              isLong: true,
              action: action,
            ),
          ],
        ),
      ),
    );

    return mica.partial
        ? ColoredBox(
            color: isDark ? const Color(0xFF272727) : const Color(0xFFf9f9f9),
            child: page,
          )
        : page;
  }
}