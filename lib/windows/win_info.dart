// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

/// Represents the comprehensive version info of Windows OS.
class WinVer {
  final int major;
  final int minor;
  final int build;
  final int productType;

  WinVer._(this.major, this.minor, this.build, this.productType);

  @override 
  String toString() => '$major.$minor.$build';

  static late final WinVer version = () {
    if (!Platform.isWindows) {
      return WinVer._(0, 0, 0, 0);
    }

    // Allocate OSVERSIONINFOEX memory space
    final versionInfo = calloc<OSVERSIONINFOEX>();
    versionInfo.ref.dwOSVersionInfoSize = sizeOf<OSVERSIONINFOEX>();

    try {
      // Cast Pointer<OSVERSIONINFOEX> to Pointer<OSVERSIONINFO> to fit GetVersionEx signature
      final result = GetVersionEx(versionInfo.cast<OSVERSIONINFO>());
      
      if (result != 0) {
        return WinVer._(
          versionInfo.ref.dwMajorVersion,
          versionInfo.ref.dwMinorVersion,
          versionInfo.ref.dwBuildNumber,
          versionInfo.ref.wProductType,
        );
      }
      return WinVer._(0, 0, 0, 0);
    } finally {
      calloc.free(versionInfo);
    }
  }();

  static bool isAtLeast(int major, int minor) => 
      version.major > major || (version.major == major && version.minor >= minor);

  static late final bool isWindowsXPOrGreater = isAtLeast(5, 1);
  static late final bool isWindowsVistaOrGreater = isAtLeast(6, 0);
  static late final bool isWindows7OrGreater = isAtLeast(6, 1);
  static late final bool isWindows8OrGreater = isAtLeast(6, 2);
  static late final bool isWindows10OrGreater = isAtLeast(10, 0);
  static late final bool isWindows11OrGreater = 
      version.major == 10 && version.build >= 22000;
}