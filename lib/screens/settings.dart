// ignore_for_file: non_constant_identifier_names, constant_identifier_names
import 'dart:async';
import 'dart:developer';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:protobuf/protobuf.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:pacman_apk/global_state.dart';
import 'package:pacman_apk/proto/options.pb.dart';
import 'package:pacman_apk/utils/locale_utils.dart';
import 'package:pacman_apk/widget/adaptive_icon.dart';
import 'package:pacman_apk/widget/smooth_list_view.dart';
import 'package:pacman_apk/widget/fluent_card.dart';
import 'package:pacman_apk/windows/win_info.dart';
import '/utils/string_utils.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/services.dart';

const List<String> accentColorNames = [
  'System', 'Yellow', 'Orange', 'Red', 'Magenta', 'Purple', 'Blue', 'Teal', 'Green',
];

class LateUpdater<E> {
  static const SETTINGS_UPDATE_TIMER = Duration(seconds:3);
  E initialValue;
  Timer? timer;
  Function(E value) callback;
  LateUpdater(this.initialValue, this.callback);
  update(E newValue) {
    initialValue = newValue;
    timer?.cancel();
    timer = Timer(SETTINGS_UPDATE_TIMER, (){if (initialValue == newValue) callback(initialValue);});
  }
  cancel() => timer?.cancel();
  instant(E newValue) {
    timer?.cancel();
    callback(newValue);
  }
}

class ScreenSettings extends StatefulWidget {
  ScreenSettings({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;
  @override
  State<StatefulWidget> createState() => ScreenSettingsState(controller: this.controller);
}

late final androidPortUpdater = LateUpdater<int>(GState.androidPort.$, (value){
  GState.androidPort..update((p0) => value)..persist();
  log("UPDATED: ${GState.androidPort.$}");
});

class ScreenSettingsState extends State<ScreenSettings> {
  static const SETTINGS_UPDATE_TIMER = Duration(seconds:3);
  ScreenSettingsState({this.controller});
  final ScrollController? controller;
  
  static late final _exBackground = _loadIcon("assets/icons/missing_icon_background.si");
  static late final _exForeground = _loadIcon("assets/icons/missing_icon_foreground.si");
  static late final _exLegacyIcon = _loadIcon("assets/icons/missing_icon_legacy.si");

  static Future<ScalableImageWidget> _loadIcon(String asset) async {
    var scalable = ScalableImage.fromSIAsset(rootBundle, asset);
    return ScalableImageWidget(si: await scalable);
  }

  static Widget optionsListDeferred<E extends ProtobufEnum, V>(
    List<E> values, 
    String Function(E)? title, 
    V Function(E e) getter, 
    V currentValue, 
    Function(E e, V v) updater
  ) {
    return RadioGroup<V>(
      groupValue: currentValue,
      onChanged: (V? v) {
        if (v != null) {
          final selectedE = values.firstWhere((e) => getter(e) == v);
          updater(selectedE, v);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(values.length, (index) {
          final modeOpt = values[index];
          final mode = getter(modeOpt);
          return Padding(
            padding: index != values.length - 1 ? const EdgeInsets.only(bottom: 8.0) : EdgeInsets.zero,
            child: RadioButton<V>(
              value: mode,
              content: Text(title != null ? title(modeOpt) : modeOpt.toString().normalized),
            ),
          );
        }),
      ),
    );
  }

  static Widget optionsList<E extends ProtobufEnum>(
    List<E> values, 
    String Function(E)? title, 
    E currentValue, 
    Function(E e) updater
  ) => optionsListDeferred<E, E>(values, title, (e) => e, currentValue, (e, v) => updater(e));

  static late final _localeItems = <NamedLocale>[LocaleUtils.SYSTEM_LOCALE].followedBy(LocaleUtils.supportedLocales).map((l)=>ComboBoxItem(child: Text(l.name), value: l)).toList();

  @override
  Widget build(BuildContext context) {
    final theme = FluentTheme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locale_lang = GState.locale.of(context);
    final lang = AppLocalizations.of(context)!;
    
    const empty = SizedBox.shrink();
    const smallSpacer = SizedBox(height: 5.0);
    const spacer = SizedBox(height: 10.0);
    
    final themeMode = GState.theme.of(context).mode;
    final iconShape = GState.iconShape.of(context);
    final mica = GState.mica.of(context);
    final legacyIcons = GState.legacyIcons.of(context);
    final autostartWSA = GState.autostartWSA.of(context);
    final installTimeout = GState.installTimeout.of(context);
    
    final OFF = lang.btn_switch_off;
    final ON = lang.btn_switch_on;
    
    final exampleIcon = FutureBuilder(
      future: legacyIcons ? _exLegacyIcon : (() async =>AdaptiveIcon(background: await _exBackground, foreground: await _exForeground, radius: iconShape.radius))(), 
      builder: (context, AsyncSnapshot<Widget> snapshot) => snapshot.data ?? empty
    );

    Widget page = ScaffoldPage(
      header: PageHeader(title: Text(lang.screen_settings)),
      content: SmoothListView(
        padding: EdgeInsets.only(
          bottom: kPageDefaultVerticalPadding,
          left: PageHeader.horizontalPadding(context),
          right: PageHeader.horizontalPadding(context),
        ),
        children: [
          spacer,
          FluentCard(
            leading: const Icon(MdiIcons.networkOutline , size: 23),
            content: Text(lang.settings_port),
            trailing: SizedBox(width: 300, height: 32, child: TextBox(
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  var androidPortVal = (newValue.text.isNumeric()) ? (newValue.text.length > 5 || (newValue.text.isEmpty ? 58526 : int.parse(newValue.text)) <= 65535 ? newValue : TextEditingValue(text: "65535", selection: newValue.selection)) : 
                   (oldValue.text.isNumeric() ? oldValue : TextEditingValue.empty);
                  GState.androidPortPending.$ = androidPortVal.text.isEmpty ? 58526.toString() : androidPortVal.text;
                  return androidPortVal;
                })
              ],
              maxLength: 5,
              maxLines: 1,
              controller: TextEditingController.fromValue(TextEditingValue(text: GState.androidPortPending.$)),
              autofocus: false,
              onChanged: (value)=>androidPortUpdater.update(value.isEmpty ? 58526 : int.parse(value)),
              keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
              prefix: const Padding(padding: EdgeInsetsDirectional.only(start: 10), child: Text("127.0.0.1 :")),
              suffix: IconButton (
                iconButtonMode: IconButtonMode.small,
                icon: const Icon(FluentIcons.reset),
                onPressed: () {GState.androidPortPending.update((_) => 58526.toString()); androidPortUpdater.instant(58526); setState((){});},
              )
            )),
          ),
          smallSpacer,
          FluentCard(
            leading: const Icon(MdiIcons.powerStandby , size: 23),
            content: Text(lang.settings_autostart),
            trailing: Row(children: [ConstrainedBox(constraints: const BoxConstraints(minWidth: 28.5), child: Text(autostartWSA ? ON : OFF)), ToggleSwitch(
              checked: autostartWSA,
              onChanged: (v) => GState.autostartWSA..$ = v..persist()
            )]),
          ),
          smallSpacer,
          FluentCard(
            leading: const Icon(MdiIcons.timerOutline, size: 23),
            content: Text(lang.settings_timeout(installTimeout == 0 ? ' ' : '$installTimeout')),
            trailing: SizedBox(width: 300, height: 32, child: FluentCard(isInner: true, content: Slider(
              min: 0,
              max: 105, 
              value: (installTimeout == 0 ? 105 : installTimeout < 15 ? 15 : installTimeout > 105 ? 105 : installTimeout).toDouble(),
              divisions: 7,
              label: installTimeout == 0 ? ' ' : '$installTimeout',
              onChanged: (l){l = (l == 0) ? 15 : (l == 105) ? 0 : l; GState.installTimeout..$=l.toInt()..persist();},
            ))),
          ),
          smallSpacer,
          FluentCard(
            leading: const Icon(MdiIcons.translate , size: 23),
            content: Text(lang.settings_language),
            trailing: SizedBox(width: 300, child: ComboBox<NamedLocale>(
              placeholder: Text(locale_lang.name), 
              isExpanded: true,
              value: locale_lang,
              onChanged: (l){if (l != null) GState.locale..$=l..persist();},
              items: _localeItems,
            )),
          ),
          smallSpacer,
          Expander(
            leading: const Icon(MdiIcons.themeLightDark, size: 23),
            header: Text(lang.theme_mode),
            content: optionsListDeferred<Options_Theme, ThemeMode>(Options_Theme.values, (e)=>e.description(lang), (e) => e.mode, themeMode, (e, v) => GState.theme..update((p0) => e)..persist()),
            direction: ExpanderDirection.down,
            initiallyExpanded: false,
          ),
          smallSpacer,
          if (WinVer.isWindows11OrGreater) Expander(
            leading: const Icon(MdiIcons.blur, size: 23),
            header: Text(lang.theme_mica),
            content: optionsList<Options_Mica>(Options_Mica.values, (e)=>e.description(lang), mica, (e) => GState.mica..update((_) => e)..persist()),
            direction: ExpanderDirection.down,
            initiallyExpanded: false,
          ),
          if (WinVer.isWindows11OrGreater) smallSpacer,
          Expander(
            leading: SizedBox(width: 23.00, height: 23.00, child: exampleIcon),
            header: Text(lang.theme_icon_adaptive),
            content: optionsList<Options_IconShape>(Options_IconShape.values, (e)=>e.description(lang), iconShape, (e) => GState.iconShape..update((_) => e)..persist()),
            trailing: Row(children: [ConstrainedBox(constraints: const BoxConstraints(minWidth: 28.5), child: Text(legacyIcons ? OFF : ON)), ToggleSwitch(
              checked: !legacyIcons,
              onChanged: (v) => GState.legacyIcons..$ = !v..persist()
            )]),
            direction: ExpanderDirection.down,
            initiallyExpanded: false,
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