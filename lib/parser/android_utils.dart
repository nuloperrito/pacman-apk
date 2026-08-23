// ignore_for_file: constant_identifier_names
import 'package:pacman_apk/parser/reader_apk.dart';
import 'package:pacman_apk/parser/reader_xapk.dart';
import 'package:pacman_apk/parser/reader_apkm.dart';
import 'package:pacman_apk/parser/reader_apks.dart';
import 'package:pacman_apk/parser/isolate_runner.dart';
import 'package:pacman_apk/utils/locale_utils.dart';

class Resource {
  ResType type;
  Iterable<String> values;
  Resource(this.values, [this.type = ResType.FILE]);
}

/// Flags passed to the apk reader isolates
enum APK_READER_FLAGS {
  UI_LOADED, LEGACY_ICON
}

enum InstallState {
  PROMPT, INSTALLING, SUCCESS, ERROR, TIMEOUT
}

enum InstallType {
  UNKNOWN, INSTALL, REINSTALL, UPDATE, DOWNGRADE
}

enum ResType {
  COLOR, POINTER, FILE
}

enum AppPackage {
  NONE, APK, XAPK, APKM, APKS
}

extension AppPackageType on AppPackage {
  static AppPackage fromArguments(List<String> args) => args.isEmpty ? AppPackage.NONE : fromFilename(args.first);
  
  static AppPackage fromFilename(String? name) {
    if (name == null || name.isEmpty) return AppPackage.NONE;
    final lower = name.toLowerCase();
    if (lower.endsWith(".xapk")) return AppPackage.XAPK;
    if (lower.endsWith(".apkm")) return AppPackage.APKM;
    if (lower.endsWith(".apks")) return AppPackage.APKS;
    return AppPackage.APK;
  }

  IsolateRef<String, APK_READER_FLAGS>? Function(String) get read { switch (this) {
    case AppPackage.APK: return ApkReader().start;
    case AppPackage.XAPK: return XapkReader().start;
    case AppPackage.APKM: return ApkmReader().start;
    case AppPackage.APKS: return ApksReader().start;
    case AppPackage.NONE: return (_)=>null;
  }}

  bool get directInstall => this == AppPackage.APK;
}

extension InstallTypeExt on InstallType {
  String buttonText(AppLocalizations locale) {switch (this) {
    case InstallType.UNKNOWN: return locale.installer_btn_install;
    case InstallType.INSTALL: return locale.installer_btn_install;
    case InstallType.REINSTALL: return locale.installer_btn_reinstall;
    case InstallType.UPDATE: return locale.installer_btn_update;
    case InstallType.DOWNGRADE: return locale.installer_btn_downgrade;
  }}
}

ResType getResType(String typeId) {switch (typeId) {
  case "1d": return ResType.COLOR;
  case "1c": return ResType.COLOR;
  case "1": return ResType.POINTER;
  default: return ResType.FILE;
}}

Map<String, String> fillType = {
  "0": "winding",
  "1": "evenOdd",
  "2": "inverseWinding",
  "3": "inverseEvenOdd",
};

Map<String, String> strokeLineCap = {
  "0": "butt",
  "1": "round",
  "2": "square",
};

Map<String, String> strokeLineJoin = {
  "0": "miter",
  "1": "round",
  "2": "bevel",
};

Map<String, String> gradientType = {
  "0": "linear",
  "1": "radial",
  "2": "sweep"
};