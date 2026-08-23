// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:collection';

import 'package:archive/archive_io.dart';
import 'package:flutter/widgets.dart';
import 'package:pacman_apk/parser/android_utils.dart';
import 'package:pacman_apk/parser/permissions.dart';
import 'package:pacman_apk/parser/reader_apk.dart';
import 'package:pacman_apk/parser/reader_xapk.dart';
import 'package:pacman_apk/global_state.dart';
import 'package:pacman_apk/parser/isolate_runner.dart';
import 'package:pacman_apk/windows/win_io.dart';
import 'package:pacman_apk/windows/win_path.dart';
import 'package:pacman_apk/main.dart';
import 'package:pacman_apk/utils/string_utils.dart';
import 'package:pacman_apk/utils/misc_utils.dart';
import 'package:path/path.dart' as path;

class ApkmReader extends IsolateRunner<String, APK_READER_FLAGS> with IconParserMixin {
  static Future<Map<String, Resource>>? _resourceDump;
  static Future<Map<int, String>>? _stringDump;
  static Archive? _baseApkArchive;

  Future _getAdaptiveIconFiles(String? backgroundId, String foregroundId) async {
    await processAdaptiveIconFiles(
      backgroundId: backgroundId,
      foregroundId: foregroundId,
      resourceDump: await _resourceDump!,
      stringDump: await _stringDump!,
      getFiles: (paths) => _baseApkArchive!.getFiles(paths),
    );
  }

  Future _getIconFile(String fileName) async {
    await processIconFile(
      fileName: fileName,
      getFile: (name) => _baseApkArchive!.findFile(name),
      onAdaptiveIcon: _getAdaptiveIconFiles,
    );
  }

  @override
  void run() async {
    final disposeLock = FileDisposeQueue();
    try {
      File file = File(data)..open();
      Archive archive = await ApkReader.initArchiveFile(file);

      final infoFile = archive.findFile('info.json');
      if (infoFile == null) throw Exception("info.json not found in APKM container");

      String jsonStr = utf8.decode(infoFile.content as List<int>, allowMalformed: true);
      if (jsonStr.startsWith('\uFEFF')) {
        jsonStr = jsonStr.substring(1);
      }
      
      Map<String, dynamic> info = jsonDecode(jsonStr);

      String packageName = info['pname']?.toString() ?? "";
      String title = info['app_name']?.toString() ?? packageName;
      int versionCode = int.tryParse(info['versioncode']?.toString() ?? "0") ?? 0;
      String versionName = info['release_version']?.toString() ?? "";
      int minSdk = int.tryParse(info['min_api']?.toString() ?? "0") ?? 0;

      // Locate base APK and split APKs
      List<String> apkList = archive.files
          .where((f) => f.isFile && f.name.toLowerCase().endsWith('.apk'))
          .map((f) => f.name)
          .toList();

      if (apkList.isEmpty) throw Exception("No APK files found in APKM container");

      ArchiveFile? baseApkFile;
      for (var f in archive.files.where((f) => f.isFile && f.name.toLowerCase().endsWith('.apk'))) {
        final name = path.basename(f.name).toLowerCase();
        if (name == 'base.apk') {
          baseApkFile = f;
          break;
        }
      }
      baseApkFile ??= archive.files.firstWhere((f) => f.isFile && f.name.toLowerCase().endsWith('.apk'));

      String installDir = Directory(WinPath.tempSubdir).createTempSync("APKM-Extracted@$pid@").absolute.path;
      final baseApkPath = path.join(installDir, baseApkFile.name);
      
      final outFile = File(baseApkPath);
      if (!outFile.existsSync()) {
        outFile.createSync(recursive: true);
        outFile.writeAsBytesSync(baseApkFile.content as List<int>);
        disposeLock.add(outFile);
      }

      // Invoke aapt to parse the Base APK to fetch permissions (info.json lacks this)
      var result = await Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'badging', baseApkFile.name], stdoutEncoding: utf8, workingDirectory: installDir);
      
      Set<AndroidPermission> permissions = {AndroidPermission.NONE};
      String? iconPath;

      if (result.exitCode == 0) {
        String dump = result.stdout.toString();
        Iterable<RegExpMatch> permMatches = RegExp(r"uses-permission.*: name='([^']+)'").allMatches(dump);
        List<String> permsList = permMatches.map((m) => m.group(1)!).toList();
        if (permsList.isNotEmpty) {
          permissions = AndroidPermissionList.fromNames(permsList);
        }

        iconPath = RegExp(r"application: label='[^']*' icon='([^']+)'").firstMatch(dump)?.group(1) ?? 
                   RegExp(r"application-icon-[0-9]+:'([^']+)'").firstMatch(dump)?.group(1);
      } else {
        log("Failed to parse base APK using aapt, defaulting to NONE permissions.");
      }

      String launcherActivity = "";
      launcherActivity = await ApkReader.parseLauncherActivityFromApkBytes(
        baseApkFile.content as List<int>,
        packageName,
      );

      executeInUi(() {
        GState.apkTitle.$ = title;
        GState.version.$ = versionName;
        GState.package.$ = packageName;
        GState.activity.$ = launcherActivity;
        GState.permissions.$ = permissions;
        GState.minSdkVersion.$ = minSdk;
        GState.versionCode.$ = versionCode;
      });

      // Handle icon extraction (XML/Adaptive aware processing)
      bool iconSuccessfullyExtracted = false;

      if (iconPath != null && iconPath.isNotEmpty) {
        try {
          _baseApkArchive = ZipDecoder().decodeBytes(baseApkFile.content as List<int>);

          _resourceDump = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'resources', baseApkFile.name], workingDirectory: installDir).then((p) => 
            p.stdout.toString().foldToMap(r'(^|\n)\s*resource\s+(0x[0-9a-zA-Z]*)[\s]+.*\st=0x0*([^\s\n]*).*\sd=0x0*([^\s\n]*)[\s|\n]', (m) => m.group(2)!, 
            (m,old) => Resource((old != null) ? ((old.values as ListQueue<String>)..addAll([m.group(4)!])) : ListQueue<String>.from([m.group(4)!]), old?.type ?? getResType(m.group(3)!)) )
          );
          _stringDump = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'strings', baseApkFile.name], workingDirectory: installDir).then((p) => 
            p.stdout.toString().toMap(r'(^|\n)\s*String\s+#([0-9]*)\s*:\s*([^\s\n]*)', (m) => int.parse(m.group(2)!), (m) => m.group(3)!)
          );

          await _getIconFile(iconPath);
          iconSuccessfullyExtracted = true;
        } catch (e) {
          log("Failed to extract XML/vector icon from base.apk: $e");
          iconSuccessfullyExtracted = false;
        }
      }

      if (!iconSuccessfullyExtracted) {
        // Fallback to static root info icon if XML parse fails or doesn't exist
        ArchiveFile? iconFile = archive.findFile('icon.png');
        if (iconFile != null) {
          Uint8List imageBytes = iconFile.content;
          executeInUi(() {
            GState.apkIcon.$ = Image.memory(imageBytes);
          });
        } else {
          executeInUi(() async { ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady()); });
        }
      }

      await waitFlag(APK_READER_FLAGS.UI_LOADED);

      // Extract all remaining APK files required for standard split installation
      for (String fileName in apkList) {
        if (fileName == baseApkFile.name) continue; // Already extracted
        
        ArchiveFile? f = archive.findFile(fileName);
        if (f != null && f.isFile) {
          final outFile = File(path.join(installDir, fileName));
          outFile.createSync(recursive: true);
          outFile.writeAsBytesSync(f.content as List<int>);
          disposeLock.add(outFile);
        }
      }

      // Route to XapkReader's multiple APK side-loading logic
      executeInUi(() {
        GState.installCallback.$ = (ipAddress, port, lang, timeout, [downgrade = false]) {
          XapkReader.installXApk(installDir, apkList, [], ipAddress, port, lang, timeout, disposeLock, downgrade);
        };
        
        GState.cancelCallback.$ = () {
          disposeLock.dispose();
          try {
            if (Directory(installDir).existsSync()) {
              Directory(installDir).deleteSync(recursive: true);
            }
            final parent = Directory(installDir).parent;
            if (parent.existsSync() && parent.path.contains("pacman-apk")) {
              parent.deleteSync(recursive: true);
            }
          } catch (_) {}
        };
      });

    } catch (e, stackTrace) {
      log("APKM PARSE ERROR: $e\n$stackTrace");
      disposeLock.dispose();
      executeInUi(() {
        GState.apkInstallState.update((_) => InstallState.ERROR);
        GState.errorCode.update((_) => "PARSE_ERROR");
        GState.errorDesc.update((_) => "Failed to parse APKM: $e");
      });
    }
  }
}