// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:collection';
import 'dart:io';
import 'package:archive/archive_io.dart';
import 'package:collection/collection.dart';
import 'package:pacman_apk/l10n/app_localizations.dart';

import 'package:pacman_apk/parser/android_utils.dart';
import 'package:pacman_apk/parser/permissions.dart';
import 'package:pacman_apk/parser/reader_apk.dart';
import 'package:pacman_apk/global_state.dart';
import 'package:pacman_apk/parser/isolate_runner.dart';
import 'package:pacman_apk/proto/manifest_xapk.pb.dart';
import 'package:pacman_apk/utils/adbwsa_utils.dart';
import 'package:pacman_apk/windows/win_io.dart';
import 'package:pacman_apk/windows/win_path.dart';
import 'package:pacman_apk/main.dart';
import 'package:pacman_apk/utils/string_utils.dart';
import 'package:pacman_apk/utils/misc_utils.dart';

import 'package:path/path.dart' as path;

enum Architecture {
  amd64, i386, aarch64, arm, ppc64, ppc
}

extension Architectures on Architecture {
  static late final fullRegex = '(${[for (final arch in Architecture.values) for (final label in arch.labels) label].join('|')})';
  get regex => '(${[for (final label in labels) label].join('|')})';
  List<String> get labels => (){switch (this) {
    case Architecture.i386: return ["i386", "i686", "i586", "i486", "x86"];
    case Architecture.amd64: return ["x86_64", "amd64"];
    case Architecture.arm: return ["aarch32", "arm"];
    case Architecture.aarch64: return ["arm64", "aarch64"];
    case Architecture.ppc: return ["powerpc", "ppc"];
    case Architecture.ppc64: return ["powerpc64", "ppc64"];
  }}();
}

class XapkReader extends IsolateRunner<String, APK_READER_FLAGS> with IconParserMixin {
  static late Future<Archive> _xapkArchive;
  static late final Directory _xapkTempDir = Directory(WinPath.tempSubdir).createTempSync("XAPK-Extracted@$pid@");

  static ManifestXapk _decodeManifest(List<int> bytes) {
    String jsonStr = utf8.decode(bytes, allowMalformed: true);
    // Strip BOM if present to prevent json.decoder from throwing
    if (jsonStr.startsWith('\uFEFF')) {
      jsonStr = jsonStr.substring(1);
    }
    return ManifestXapk.create()
      // ignoreUnknownFields is strictly required for 3rd party XAPKs
      ..mergeFromProto3Json(jsonDecode(jsonStr), ignoreUnknownFields: true);
  }

  static Future<List<ProcessResult>> copyApkResources(List<ManifestXapk_ApkExpansion> expansions, String workingDir, String ipAddress, int port, int timeout) => Future.wait(() sync* {
    int index = 0;
    for (ManifestXapk_ApkExpansion exp in expansions) {
      if (exp.installPath.isEmpty) exp.installPath = exp.file;
      final tempName = '${path.basename(workingDir)}@${index++}';
      final resourceName = path.basename(exp.installPath);
      final resourceDir = '${exp.installPath.startsWith('/') ? '' : '/sdcard/'}${path.dirname(exp.installPath)}';
      
      var pushTask = ADBUtils.pushToAddress(ipAddress, port, exp.file, '/sdcard/$tempName', workDir: workingDir);
      // Apply timeout only if it is greater than 0
      if (timeout > 0) {
        pushTask = pushTask.processTimeout(Duration(seconds: timeout));
      }

      yield pushTask.then((_) {
        var shellTask = ADBUtils.shellToAddress(ipAddress, port, 'mkdir -p "$resourceDir"; cd "$resourceDir"; mv /sdcard/$tempName ./$resourceName');
        // Apply timeout only if it is greater than 0
        if (timeout > 0) {
          shellTask = shellTask.processTimeout(Duration(seconds: timeout));
        }
        return shellTask;
      });
    }
  }());

  static void installXApk(String workingDir, List<String> apkFiles, List<ManifestXapk_ApkExpansion> expansions, String ipAddress, int port, AppLocalizations lang, int timeout, FileDisposeQueue disposeLock, [bool downgrade = false]) async {
    if (apkFiles.isNotEmpty) log("INSTALLING \"${apkFiles.first}\" on $ipAddress:$port...");
    disposeLock.clear();
    var installation = ADBUtils.installMultipleToAddress(ipAddress, port, apkFiles, downgrade: downgrade, workDir: workingDir);
    if (timeout > 0) installation = installation.processTimeout(Duration(seconds: timeout));
    final resources = copyApkResources(expansions, workingDir, ipAddress, port, timeout);
    GState.apkInstallState.update((_) => InstallState.INSTALLING);

    final result = await installation;
    await resources;

    if (!result.isTimeout) {
      try {
        if (Directory(workingDir).existsSync()) {
          Directory(workingDir).deleteSync(recursive: true);
        }
        final parent = Directory(workingDir).parent;
        if (parent.existsSync() && parent.path.contains("pacman-apk")) {
          parent.deleteSync(recursive: true);
        }
      } catch (e) {
        log("Failed to delete temp dirs: $e");
      }
    }
    
    String error = result.stderr.toString();
    log("EXIT CODE: ${result.exitCode}, OUTPUT: ${result.stdout}, ERROR: $error");
    if (result.exitCode == 0) GState.apkInstallState.update((_) => InstallState.SUCCESS);
    else if (result.isTimeout) {
      GState.apkInstallState.update((_) => InstallState.TIMEOUT);
      GState.errorCode.update((_) => "TIMEOUT");
      GState.errorDesc.update((_) => '${lang.installer_error_timeout}\n\n${lang.installer_warning_dirty(workingDir)}');
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

  static List<String> _getApkList(ManifestXapk manifest) {
    final archRegex = RegExp('^config\\.${Architectures.fullRegex}.*');
    final String defaultBaseName = '${manifest.packageName}.apk';
    Iterable<String> apkList;
    if (manifest.splitApks.isNotEmpty) {
      bool isBaseApk(ManifestXapk_ApkFile fileInfo) => fileInfo.id == 'base' || fileInfo.file == defaultBaseName;
      ManifestXapk_ApkFile? baseApk = manifest.splitApks.firstWhereOrNull(isBaseApk);
      if (manifest.splitApks.first == baseApk || baseApk == null) apkList = manifest.splitApks.map((e) => e.file);
      else apkList = [baseApk.file].followedBy(manifest.splitApks.whereNot(isBaseApk).map((e) => e.file));
    }
    else if (manifest.splitConfigs.isNotEmpty) {
      Iterable<String> configFiles = manifest.splitConfigs.map((e) => '$e.apk');
      apkList = manifest.splitConfigs.contains(manifest.packageName) ? configFiles : [defaultBaseName].followedBy(configFiles);
    }
    else apkList = [defaultBaseName];

    final List<String> archApkList = apkList.where((file) => archRegex.hasMatch(file)).toList();
    if (archApkList.isEmpty || archApkList.length == 1) return apkList.toList();
    apkList = apkList.whereNot((file) => archRegex.hasMatch(file));
    for (final arch in Architecture.values) {
      final regex = RegExp('^config\\.${arch.regex}.*');
      for (final file in archApkList) if (regex.hasMatch(file)) return apkList.followedBy([file]).toList();
    }
    return apkList.followedBy([apkList.first]).toList();
  }
  
  void updateManifest(ManifestXapk manifest, Set<AndroidPermission> permissions, String launcherActivity) {
    final versionCode = manifest.versionCode;
    final name = manifest.name;
    final versionName = manifest.versionName;
    final packageName = manifest.packageName;
    final minSdkVersion = manifest.minSdkVersion;

    executeInUi(() {
      GState.apkTitle.$ = name;
      GState.version.$ = versionName;
      GState.package.$ = packageName;
      GState.activity.$ = launcherActivity;
      GState.permissions.$ = permissions;
      GState.minSdkVersion.$ = minSdkVersion; 
      GState.versionCode.$ = versionCode;
    });
  }

  static late Future<Map<String, Resource>> _resourceDump;
  static late Future<Map<int, String>> _stringDump;
  static late Future<Archive> _baseApkArchive;

  Future _getAdaptiveIconFiles(String? backgroundId, String foregroundId) async {
    Archive apkFile = await _baseApkArchive;
    await processAdaptiveIconFiles(
      backgroundId: backgroundId,
      foregroundId: foregroundId,
      resourceDump: await _resourceDump,
      stringDump: await _stringDump,
      getFiles: (paths) => apkFile.getFiles(paths),
    );
  }
  
  Future _getIconFile(String fileName) async {
    Archive apkFile = await _baseApkArchive;
    await processIconFile(
      fileName: fileName,
      getFile: (name) => apkFile.findFile(name),
      onAdaptiveIcon: _getAdaptiveIconFiles,
    );
  }

  void updateInstallInfo(ManifestXapk manifest, String installDir, List<String> apkList, FileDisposeQueue disposeLock) {
    final expansionsJson = manifest.expansions.map((e) => e.writeToJson()).toList();
    
    executeInUi(() {
      GState.installCallback.$ = (ipAddress, port, lang, timeout, [downgrade = false]) {
        final expansions = expansionsJson.map((e) => ManifestXapk_ApkExpansion.create()..mergeFromJson(e)).toList();
        installXApk(installDir, apkList, expansions, ipAddress, port, lang, timeout, disposeLock, downgrade);
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
  }

  @override
  void run() async { 
    final disposeLock = FileDisposeQueue();
    try {
      File file = File(data)..open();
      _xapkArchive = ApkReader.initArchiveFile(file);
      final archive = (await _xapkArchive);
      final manifestFile = archive.findFile('manifest.json');
      
      late ManifestXapk manifest;
      bool isFallback = false;
      ArchiveFile? baseApkFile;
      String installDir = _xapkTempDir.absolute.path;

      if (manifestFile != null) { // Apkpure's XAPK format
        manifest = _decodeManifest(manifestFile.content as List<int>);
        
        String iconFileName = manifest.icon.isNotEmpty ? manifest.icon : "icon.png";
        if (archive.findFile(iconFileName) == null) {
          log("ICON NOT FOUND IN XAPK, FALLING BACK TO BASE APK");
          isFallback = true;
        }
      } else { // usually uptodown's XAPK format, should fall back when handling
        log("MANIFEST NOT FOUND, USING FALLBACK MODE");
        isFallback = true;
      }

      if (isFallback) {
        final apkFiles = archive.files.where((f) => f.isFile && f.name.toLowerCase().endsWith('.apk')).toList();
        if (apkFiles.isEmpty) throw Exception("No APK files found in XAPK");
        // Locate Base APK automatically
        for (var f in apkFiles) {
          final name = path.basename(f.name).toLowerCase();
          if (!name.startsWith('config.') && !name.startsWith('split_')) {
            baseApkFile = f;
            break;
          }
        }
        baseApkFile ??= apkFiles.first;
        final baseApkPath = path.join(installDir, baseApkFile.name);
        final outFile = File(baseApkPath);
        if (!outFile.existsSync()) {
          outFile.createSync(recursive: true);
          outFile.writeAsBytesSync(baseApkFile.content as List<int>);
        }
        // Invoke aapt to parse the Base APK
        var result = await Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'badging', baseApkFile.name], stdoutEncoding: utf8, workingDirectory: installDir);
        String dump = result.stdout.toString();

        if (result.exitCode != 0 && !dump.contains("package: name=")) {
          throw Exception("Failed to parse base APK using aapt. Retval = ${result.exitCode}\nOutput: ${dump}\nError: ${result.stderr}");
        }
        
        if (manifestFile == null) {
          final pkgMatch = RegExp(r"package: name='([^']+)'").firstMatch(dump);
          String packageName = pkgMatch?.group(1) ?? "";
          final vcMatch = RegExp(r"versionCode='([^']+)'").firstMatch(dump);
          int versionCode = int.tryParse(vcMatch?.group(1) ?? "0") ?? 0;
          final vnMatch = RegExp(r"versionName='([^']+)'").firstMatch(dump);
          String versionName = vnMatch?.group(1) ?? "";
          final appMatch = RegExp(r"application: label='([^']*)' icon='([^']*)'").firstMatch(dump);
          String title = appMatch?.group(1) ?? packageName;
          String iconPath = appMatch?.group(2) ?? "";
          
          if (title.isEmpty || title == packageName) {
            final labelMatch = RegExp(r"application-label:'([^']+)'").firstMatch(dump);
            title = labelMatch?.group(1) ?? title;
          }
          final sdkMatch = RegExp(r"sdkVersion:'([^']+)'").firstMatch(dump);
          int minSdk = int.tryParse(sdkMatch?.group(1) ?? "0") ?? 0;
          Iterable<RegExpMatch> permMatches = RegExp(r"uses-permission.*: name='([^']+)'").allMatches(dump);
          List<String> permissions = permMatches.map((m) => m.group(1)!).toList();
          // Construct a virtual Manifest entity
          manifest = ManifestXapk.create()
            ..packageName = packageName
            ..name = title
            ..versionCode = versionCode
            ..versionName = versionName
            ..minSdkVersion = minSdk
            ..icon = iconPath
            ..permissions.addAll(permissions);
          // Add all child APKs to the split list and mark the Base APK as 'base' to ensure that the _getApkList logic works correctly
          for (var f in apkFiles) {
            manifest.splitApks.add(ManifestXapk_ApkFile.create()..file = f.name..id = (f == baseApkFile ? 'base' : f.name));
          }
        } else {
          // Update the icon path from base apk badging
          final appMatch = RegExp(r"application: label='([^']*)' icon='([^']*)'").firstMatch(dump);
          manifest.icon = appMatch?.group(2) ?? "";
        }
      }

      final permissions = AndroidPermissionList.fromNames(manifest.permissions);
      
      ArchiveFile? baseApkForActivity = baseApkFile;
      if (baseApkForActivity == null) {
        final apkListForBase = _getApkList(manifest);
        for (var apkName in apkListForBase) {
          final lowerName = path.basename(apkName).toLowerCase();
          if (!lowerName.startsWith('config.') && !lowerName.startsWith('split_')) {
            baseApkForActivity = archive.findFile(apkName);
            break;
          }
        }
        if (baseApkForActivity == null && apkListForBase.isNotEmpty) {
          baseApkForActivity = archive.findFile(apkListForBase.first);
        }
      }

      String launcherActivity = "";
      if (baseApkForActivity != null) {
        launcherActivity = await ApkReader.parseLauncherActivityFromApkBytes(
          baseApkForActivity.content as List<int>,
          manifest.packageName,
        );
      }

      updateManifest(manifest, permissions, launcherActivity);
      
      if (isFallback && baseApkFile != null) {
        Archive baseArchive = ZipDecoder().decodeBytes(baseApkFile.content as List<int>);
        _baseApkArchive = Future.value(baseArchive);
        String iconFileName = manifest.icon;

        if (iconFileName.isNotEmpty) {
          final baseApkPath = path.join(installDir, baseApkFile.name);
          
          // Create a resource mapping table to resolve @color/ or @drawable/ references in adaptive icons
          _resourceDump = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'resources', baseApkFile.name], workingDirectory: installDir).then((p) => 
            p.stdout.toString().foldToMap(r'(^|\n)\s*resource\s+(0x[0-9a-zA-Z]*)[\s]+.*\st=0x0*([^\s\n]*).*\sd=0x0*([^\s\n]*)[\s|\n]', (m) => m.group(2)!, 
            (m,old) => Resource((old != null) ? ((old.values as ListQueue<String>)..addAll([m.group(4)!])) : ListQueue<String>.from([m.group(4)!]), old?.type ?? getResType(m.group(3)!)) )
          );
          _stringDump = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'strings', baseApkFile.name], workingDirectory: installDir).then((p) => 
            p.stdout.toString().toMap(r'(^|\n)\s*String\s+#([0-9]*)\s*:\s*([^\s\n]*)', (m) => int.parse(m.group(2)!), (m) => m.group(3)!)
          );

          if (iconFileName.toLowerCase().endsWith('.xml')) {
            var xmlTreeResult = await Process.run('${Env.TOOLS_DIR}\\aapt2.exe', ['dump', 'xmltree', '--file', iconFileName, baseApkPath]);
            if (xmlTreeResult.exitCode == 0) {
              String iconData = xmlTreeResult.stdout.toString();
              String? background, foreground;
              
              int currentIndent = -1;
              String? currentBlock;
              
              // State machine to properly associate attributes nested deeper (like <inset>)
              for (String line in iconData.split('\n')) {
                if (line.trim().isEmpty) continue;
                
                Match? eMatch = RegExp(r'^(\s*)E:\s*([^\s]+)').firstMatch(line);
                if (eMatch != null) {
                  int indent = eMatch.group(1)!.length;
                  String tag = eMatch.group(2)!;
                  if (tag == 'background' || tag == 'foreground') {
                    currentBlock = tag;
                    currentIndent = indent;
                  } else if (indent <= currentIndent) {
                    currentBlock = null;
                  }
                } else if (currentBlock != null) {
                  Match? attrMatch = RegExp(r'A:\s*android:(?:drawable|color)[^=]*=@(0x[0-9a-fA-F]+)').firstMatch(line);
                  if (attrMatch != null) {
                    if (currentBlock == 'background') background ??= attrMatch.group(1);
                    else if (currentBlock == 'foreground') foreground ??= attrMatch.group(1);
                  }
                }
              }
              
              if (foreground != null) {
                // Adaptive Icon: It features fg and bg elements and should be extracted separately.
                await _getAdaptiveIconFiles(background, foreground);
              } else {
                // Normal XML vector graph
                await _getIconFile(iconFileName);
              }
            } else {
              await _getIconFile(iconFileName);
            }
          } else {
            // PNG normal icon
            await _getIconFile(iconFileName);
          }
        } else {
           executeInUi(() async { ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady()); });
        }
      } else {
        // Standard Apkpure XAPK
        _baseApkArchive = Future.value(archive);
        String iconFileName = manifest.icon.isNotEmpty ? manifest.icon : "icon.png";
        await _getIconFile(iconFileName);
      }

      final apkList = _getApkList(manifest);
      
      await waitFlag(APK_READER_FLAGS.UI_LOADED);
      
      // Targeted extraction: only extract strictly necessary files and strictly avoid directories
      List<String> neededFiles = [...apkList, ...manifest.expansions.map((e) => e.file)];
      for (String fileName in neededFiles) {
        ArchiveFile? file = archive.findFile(fileName);
        if (file != null && file.isFile) {
          final outFile = File(path.join(installDir, fileName));
          bool newlyCreated = false;
          
          if (!outFile.existsSync()) {
            outFile.createSync(recursive: true);
            outFile.writeAsBytesSync(file.content as List<int>);
            newlyCreated = true;
          }
          
          // Lock the file if it was just created, or if it is the base APK created earlier in fallback mode
          if (newlyCreated || (isFallback && fileName == baseApkFile?.name)) {
            disposeLock.add(outFile);
          }
        } else if (file == null) {
          log("WARNING: Required file $fileName not found in XAPK.");
        }
      }

      updateInstallInfo(manifest, installDir, apkList, disposeLock);
      log("DIRECTORY: ${_xapkTempDir.path}");

    } catch (e, stackTrace) {
      log("XAPK PARSE ERROR: $e\n$stackTrace");
      disposeLock.dispose();
      try {
        if (_xapkTempDir.existsSync()) {
          _xapkTempDir.deleteSync(recursive: true);
        }
        final parent = _xapkTempDir.parent;
        if (parent.existsSync() && parent.path.contains("pacman-apk")) {
          parent.deleteSync(recursive: true);
        }
      } catch (_) {}
      
      // Send error state to UI to break the deadlock
      executeInUi(() {
        GState.apkInstallState.update((_) => InstallState.ERROR);
        GState.errorCode.update((_) => "PARSE_ERROR");
        GState.errorDesc.update((_) => "Failed to parse XAPK: $e");
      });
    }
  }
}