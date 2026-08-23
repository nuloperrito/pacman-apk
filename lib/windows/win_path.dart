// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Demonstrates usage of various shell APIs to retrieve known folder locations

import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

class WinPath {
  static void cleanTempDirs() {
    try {
      final tempDir = Directory.systemTemp;
      for (var entity in tempDir.listSync()) {
        if (entity is Directory) {
          final name = entity.path.split(Platform.pathSeparator).last;
          if (name.startsWith("pacman-apk") || name.startsWith("XAPK-Extracted@") || name.startsWith("APKM-Extracted@")) {
            try {
              entity.deleteSync(recursive: true);
            } catch (_) {}
          }
        }
      }
    } catch (_) {}
  }

  /// Get the path of the temporary directory (typically %TEMP%)
  static late String temp = Directory.systemTemp.absolute.path;
  
  static late String tempSubdir = () {
    cleanTempDirs();
    return Directory.systemTemp.createTempSync("pacman-apk").absolute.path;
  }();

  /// Get the desktop path
  static late String desktop = (){
    final appsFolder = GUIDFromString(FOLDERID_Desktop);
    final ppszPath = calloc<PWSTR>();

    try {
      final hr =
          SHGetKnownFolderPath(appsFolder, KF_FLAG_DEFAULT, NULL, ppszPath);

      if (FAILED(hr)) {
        throw WindowsException(hr);
      }

      final path = ppszPath.value.toDartString();
      return path;
    } finally {
      free(appsFolder);
      free(ppszPath);
    }
  }();
}