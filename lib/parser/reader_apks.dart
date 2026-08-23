// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:collection';

import 'package:archive/archive_io.dart';
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

import '../proto/manifest_apks.pb.dart';

class ApksReader extends IsolateRunner<String, APK_READER_FLAGS> with IconParserMixin {
  static Future<Map<String, Resource>>? _resourceDump;
  static Future<Map<int, String>>? _stringDump;
  final Map<String, Archive> _splitArchiveCache = {};

  Archive? _getSplitArchive(Archive apksArchive, String apkName) {
    if (_splitArchiveCache.containsKey(apkName)) return _splitArchiveCache[apkName];
    ArchiveFile? splitFile = apksArchive.findFile(apkName);
    if (splitFile != null) {
        Archive splitArchive = ZipDecoder().decodeBytes(splitFile.content as List<int>);
        _splitArchiveCache[apkName] = splitArchive;
        return splitArchive;
    }
    return null;
  }

  Future _getAdaptiveIconFiles(String? backgroundId, String foregroundId, Archive apksArchive, List<String> searchOrder) async {
    await processAdaptiveIconFiles(
      backgroundId: backgroundId,
      foregroundId: foregroundId,
      resourceDump: await _resourceDump!,
      stringDump: await _stringDump!,
      getFiles: (paths) {
        List<ArchiveFile> files = [];
        if (paths == null || paths.isEmpty) return files;
        for (String apkName in searchOrder) {
          Archive? splitArchive = _getSplitArchive(apksArchive, apkName);
          if (splitArchive != null) {
            List<ArchiveFile> found = splitArchive.getFiles(paths);
            if (found.isNotEmpty) {
              files.addAll(found);
              break;
            }
          }
        }
        return files;
      },
    );
  }

  Future _getIconFile(String fileName, Archive apksArchive, List<String> searchOrder) async {
    await processIconFile(
      fileName: fileName,
      getFile: (name) {
        for (String apkName in searchOrder) {
          Archive? splitArchive = _getSplitArchive(apksArchive, apkName);
          if (splitArchive != null) {
            ArchiveFile? file = splitArchive.findFile(name);
            if (file != null) return file;
          }
        }
        return null;
      },
      onAdaptiveIcon: (bg, fg) => _getAdaptiveIconFiles(bg, fg, apksArchive, searchOrder),
    );
  }

  BuildApksResult? getToc(Archive archive) {
    ArchiveFile? tocFile = archive.findFile('toc.pb');
    if(tocFile == null) return null;
    final tocBytes = tocFile.content as List<int>;
    return BuildApksResult.fromBuffer(tocBytes);
  }

  @override
  void run() async {
    final disposeLock = FileDisposeQueue();
    try {
      File file = File(data)..open();
      Archive archive = await ApkReader.initArchiveFile(file);
      BuildApksResult? toc;
      try {
        // Try parsing toc.pb directly
        toc = getToc(archive);
      } catch (e) {
        // Fallback: manually correct the ZIP structure 
        log("Initial toc.pb parsing failed due to archive ZIP alignment bug. Retrying with patched bytes...");
        Uint8List bytes = file.readAsBytesSync();
        ApkReader.patchZipBytes(bytes);
        archive = ZipDecoder().decodeBytes(bytes);
        toc = getToc(archive);
      }
      if(toc == null) throw Exception("toc.pb cannot be found!");

      String packageName = toc.packageName; // toc already contains package name
      // but toc does not contain version code or version name
      int versionCode = 0;
      String versionName = "";

      List<String> apkList = [];
      
      // Filter out the best Variants based on architecture to prevent duplicate resource bundle definition conflicts during ADB installation
      if (toc.variant.isNotEmpty) {
        Variant? bestVariant;
        int bestScore = -1;
        for (var variant in toc.variant) {
          int score = 0;
          if (variant.hasTargeting() && variant.targeting.hasAbiTargeting() && variant.targeting.abiTargeting.value.isNotEmpty) {
            var abis = variant.targeting.abiTargeting.value.map((a) => a.alias.value).toList();
            // Protobuf Enum: X86_64 = 5, ARM64_V8A = 3, X86 = 4, ARMEABI_V7A = 2
            // Prioritize the best ABI for WSA performance
            if (abis.contains(5)) score = 5;
            else if (abis.contains(3)) score = 4;
            else if (abis.contains(4)) score = 3;
            else if (abis.contains(2)) score = 2;
          } else {
            score = 1; // No hard CPU ABI restrictions
          }

          if (score > bestScore) {
            bestScore = score;
            bestVariant = variant;
          }
        }

        if (bestVariant != null) {
          for (var apkSet in bestVariant.apkSet) {
            for (var apkDesc in apkSet.apkDescription) {
              apkList.add(apkDesc.path);
            }
          }
        }
      }

      // If Variant is completely empty, perform undifferentiated decompression as fallback strategy
      if (apkList.isEmpty) {
        apkList = archive.files
            .where((f) => f.isFile && f.name.toLowerCase().endsWith('.apk'))
            .map((f) => f.name)
            .toList();
      }

      if (apkList.isEmpty) throw Exception("No APK files found in APKS container");

      ArchiveFile? baseApkFile;
      for (var apkPath in apkList) {
        final name = path.basename(apkPath).toLowerCase();
        if (name == 'base-master.apk' || name == 'base.apk') {
          baseApkFile = archive.findFile(apkPath);
          break;
        }
      }

      baseApkFile ??= archive.findFile(apkList.first);
      if (baseApkFile == null) throw Exception("Base APK file not found in the archive.");

      String installDir = Directory(WinPath.tempSubdir).createTempSync("APKS-Extracted@$pid@").absolute.path;
      final baseApkPath = path.join(installDir, path.basename(baseApkFile.name));
      
      final outFile = File(baseApkPath);
      if (!outFile.existsSync()) {
        outFile.createSync(recursive: true);
        outFile.writeAsBytesSync(baseApkFile.content as List<int>);
      }

      // Invoke aapt to parse the Base APK to fetch missing attributes and permissions
      var result = await Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'badging', baseApkPath], stdoutEncoding: utf8, workingDirectory: installDir);
      
      Set<AndroidPermission> permissions = {AndroidPermission.NONE};
      String title = packageName;
      int minSdk = 0;
      String? iconPath;

      if (result.exitCode == 0) {
        String dump = result.stdout.toString();
        
        if (packageName.isEmpty) {
          packageName = RegExp(r"name='([^']+)'").firstMatch(dump)?.group(1) ?? "";
        }
        if (versionCode == 0) {
          versionCode = int.tryParse(RegExp(r"versionCode='([^']+)'").firstMatch(dump)?.group(1) ?? "0") ?? 0;
        }
        if (versionName.isEmpty) {
          versionName = RegExp(r"versionName='([^']+)'").firstMatch(dump)?.group(1) ?? "";
        }

        title = RegExp(r"application-label(?:-[a-zA-Z\-]+)?:'([^']+)'").firstMatch(dump)?.group(1) ?? 
                RegExp(r"application: label='([^']+)'").firstMatch(dump)?.group(1) ?? packageName;

        minSdk = int.tryParse(RegExp(r"sdkVersion:'([^']+)'").firstMatch(dump)?.group(1) ?? "0") ?? 0;
        iconPath = RegExp(r"application: label='[^']*' icon='([^']+)'").firstMatch(dump)?.group(1) ?? 
                   RegExp(r"application-icon-[0-9]+:'([^']+)'").firstMatch(dump)?.group(1);

        Iterable<RegExpMatch> permMatches = RegExp(r"uses-permission.*: name='([^']+)'").allMatches(dump);
        List<String> permsList = permMatches.map((m) => m.group(1)!).toList();
        if (permsList.isNotEmpty) {
          permissions = AndroidPermissionList.fromNames(permsList);
        }
      } else {
        log("Failed to parse base APK using aapt. Retval: ${result.exitCode}, Error: ${result.stderr}");
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

      // Handle icon extraction considering split density resources
      if (iconPath != null && iconPath.isNotEmpty) {
        try {
          // Prioritize base-master, then search through dpi splits
          List<String> searchOrder = [baseApkFile.name];
          searchOrder.addAll(apkList.where((name) => name.contains('hdpi') || name.contains('dpi') || name.contains('icon')).toList());

          _resourceDump = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'resources', baseApkPath], workingDirectory: installDir).then((p) =>
             p.stdout.toString().foldToMap(r'(^|\n)\s*resource\s+(0x[0-9a-zA-Z]*)[\s]+.*\st=0x0*([^\s\n]*).*\sd=0x0*([^\s\n]*)[\s|\n]', (m) => m.group(2)!,
             (m,old) => Resource((old != null) ? ((old.values as ListQueue<String>)..addAll([m.group(4)!])) : ListQueue<String>.from([m.group(4)!]), old?.type ?? getResType(m.group(3)!)) )
          );
          _stringDump = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'strings', baseApkPath], workingDirectory: installDir).then((p) =>
             p.stdout.toString().toMap(r'(^|\n)\s*String\s+#([0-9]*)\s*:\s*([^\s\n]*)', (m) => int.parse(m.group(2)!), (m) => m.group(3)!)
          );
          
          await _getIconFile(iconPath, archive, searchOrder);
        } catch (e) {
          log("Failed to extract XML/vector icon from APKS: $e");
          executeInUi(() async { ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady()); });
        }
      } else {
        executeInUi(() async { ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady()); });
      }

      await waitFlag(APK_READER_FLAGS.UI_LOADED);

      // Extract all APK files and securely add them to disposeLock post-parsing
      for (String fileName in apkList) {
        ArchiveFile? f = archive.findFile(fileName);
        if (f != null && f.isFile) {
          final outPath = path.join(installDir, path.basename(fileName));
          final splitOutFile = File(outPath);
          bool newlyCreated = false;
 
          if (!splitOutFile.existsSync()) {
            splitOutFile.createSync(recursive: true);
            splitOutFile.writeAsBytesSync(f.content as List<int>);
            newlyCreated = true;
          }
          
          // In the final stage, add the newly extracted splits and the previously extracted base APK to the cleanup queue
          if (newlyCreated || fileName == baseApkFile.name) {
            disposeLock.add(splitOutFile);
          }
        }
      }

      // Route to XapkReader's multiple APK side-loading logic
      executeInUi(() {
        GState.installCallback.$ = (ipAddress, port, lang, timeout, [downgrade = false]) {
          XapkReader.installXApk(installDir, apkList.map((e) => path.basename(e)).toList(), [], ipAddress, port, lang, timeout, disposeLock, downgrade);
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
      log("APKS PARSE ERROR: $e\n$stackTrace");
      disposeLock.dispose();
      executeInUi(() {
        GState.apkInstallState.update((_) => InstallState.ERROR);
        GState.errorCode.update((_) => "PARSE_ERROR");
        GState.errorDesc.update((_) => "Failed to parse APKS: $e");
      });
    }
  }
}