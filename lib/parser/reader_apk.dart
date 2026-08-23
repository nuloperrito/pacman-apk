// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures, constant_identifier_names

import 'dart:async';
import 'dart:collection';
import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive_io.dart';
import 'package:shared_value/shared_value.dart';
import 'package:pacman_apk/parser/isolate_runner.dart';
import 'package:pacman_apk/utils/future_utils.dart';
import 'package:pacman_apk/windows/nt_io.dart';
import 'package:pacman_apk/windows/win_io.dart';
import 'package:pacman_apk/windows/win_path.dart';
import 'package:xml/xml.dart';

import 'android_utils.dart';
import 'permissions.dart';
import 'axml_parser.dart';
import 'package:pacman_apk/global_state.dart';
import 'package:pacman_apk/main.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:archive/archive.dart';
import 'package:flutter/services.dart';

import 'dart:developer';
import 'dart:convert';
import 'package:jovial_svg/jovial_svg.dart';
import '../utils/regexp_utils.dart';
import '../utils/string_utils.dart';
import '../utils/misc_utils.dart';

extension on int {
  String get asResId => "0x"+toRadixString(16).padLeft(8, '0');
}

/// Abstraction: Design a mixin to handle generic icon file extraction and parsing logic
mixin IconParserMixin on IsolateRunner<String, APK_READER_FLAGS> {
  Future<void> processAdaptiveIconFiles({
    required String? backgroundId,
    required String foregroundId,
    required Map<String, Resource> resourceDump,
    required Map<int, String> stringDump,
    required List<ArchiveFile> Function(Iterable<String>? paths) getFiles,
  }) async {
    Future<Resource?>? futureBackground = backgroundId != null ? ApkReader.getResources(backgroundId, resourceDump, stringDump) : null;
    Future<Resource?> futureForeground = ApkReader.getResources(foregroundId, resourceDump, stringDump);
    Resource? background = futureBackground != null ? await futureBackground : null;
    Resource foreground = (await futureForeground)!;

    bool isBackColor = background?.type == ResType.COLOR;
    bool isBackXml = !isBackColor && (background?.values.isNotEmpty ?? false) && background!.values.first.endsWith(".xml");
    bool isForeXml = foreground.values.isNotEmpty && foreground.values.first.endsWith(".xml");
    
    List<ArchiveFile> backFiles = isBackColor ? [] : getFiles(background?.values);
    List<ArchiveFile> foreFiles = getFiles(foreground.values);
    
    if (foreFiles.isEmpty) {
        executeInUi(() async { ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady()); });
        return;
    }

    List<int> foreRaw = isForeXml ? foreFiles.first.content as List<int> : foreFiles.last.content as List<int>;
    List<int>? backRaw = (backFiles.isEmpty) ? null : isBackXml ? backFiles.first.content as List<int> : backFiles.last.content as List<int>;
    
    Uint8List foreImg = foreRaw is Uint8List ? foreRaw : Uint8List.fromList(foreRaw);
    Uint8List? backImg = backRaw == null ? null : (backRaw is Uint8List ? backRaw : Uint8List.fromList(backRaw));
    
    var foreXml = isForeXml ? ApkReader.decodeXml(foreImg) : null;
    var backXml = isBackXml && backImg != null ? ApkReader.decodeXml(backImg) : null;

    String backXmlData = isBackXml && backXml != null ? await backXml : "";
    String foreXmlData = isForeXml ? await foreXml! : "";
    
    final int? parsedBackColor = isBackColor ? int.parse(background!.values.first, radix: 16) : null;

    executeInUi(() async {
      try {
        if (isBackColor && parsedBackColor != null) {
          GState.apkBackgroundColor.$ = Color(parsedBackColor);
        }
        else if (!isBackColor && backImg != null) {
          GState.apkBackgroundIcon.$ = isBackXml ? ScalableImageWidget(si: ScalableImage.fromAvdString(backXmlData)) : Image.memory(backImg);
        }
        GState.apkForegroundIcon.$ = isForeXml ? ScalableImageWidget(si: ScalableImage.fromAvdString(foreXmlData)) : Image.memory(foreImg);
      } catch (e) {
        log("Adaptive XML Icon rendering failed: $e");
        ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady());
      }
    });
  }
  
  Future<void> processIconFile({
    required String fileName,
    required ArchiveFile? Function(String name) getFile,
    required Future<void> Function(String? backgroundId, String foregroundId) onAdaptiveIcon,
  }) async {
    bool isXml = fileName.endsWith(".xml");
    ArchiveFile? iconFile = getFile(fileName);
    
    if (iconFile == null) {
      executeInUi(() async { ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady()); });
      return;
    }
    
    Uint8List imageBytes = iconFile.content;
    String xmlData = isXml ? await ApkReader.decodeXml(imageBytes) : "";

    if (isXml && xmlData.contains("<adaptive-icon")) {
      // Helper to parse obfuscated resource ID (e.g. type1/2131951616 -> 0x7f130000)
      String? extractResId(String tagContent) {
        Match? m = RegExp(r'android:(?:drawable|color)="type1/(\d+)"').firstMatch(tagContent);
        if (m != null) {
          return '0x${int.parse(m.group(1)!).toRadixString(16).padLeft(8, '0')}';
        }
        return null;
      }

      String? background, foreground;

      Match? bgMatch = RegExp(r'<background[^>]*>([\s\S]*?)</background>').firstMatch(xmlData) ?? RegExp(r'<background[^>]*/>').firstMatch(xmlData);
      if (bgMatch != null) background = extractResId(bgMatch.group(0)!);

      Match? fgMatch = RegExp(r'<foreground[^>]*>([\s\S]*?)</foreground>').firstMatch(xmlData) ?? RegExp(r'<foreground[^>]*/>').firstMatch(xmlData);
      if (fgMatch != null) foreground = extractResId(fgMatch.group(0)!);

      if (foreground != null) {
        // Hand off to Adaptive Icon parser with the resolved IDs
        await onAdaptiveIcon(background, foreground);
        return; 
      } else {
        // Attempt inline vector extraction
        Match? vectorMatch;
        if (fgMatch != null) {
          vectorMatch = RegExp(r'<vector[\s\S]*?</vector>').firstMatch(fgMatch.group(0)!);
        }
        vectorMatch ??= RegExp(r'<vector[\s\S]*?</vector>').firstMatch(xmlData);
        
        if (vectorMatch != null) {
          xmlData = vectorMatch.group(0)!;
        } else {
           log("Cannot render adaptive-icon directly and no inline vector found.");
           executeInUi(() async { ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady()); });
           return;
        }
      }
    }
    
    executeInUi(() async {
      if (isXml) {
        try {
          GState.apkIcon.$ = ScalableImageWidget(si: ScalableImage.fromAvdString(xmlData));
        } catch (e) {
          log("XML Icon rendering failed: $e");
          ApkReader.setDefaultIcon(await GState.legacyIcons.whenReady());
        }
      } else {
        GState.apkIcon.$ = Image.memory(imageBytes);
      }
    });
  }
}

/// Reads apk file data on a different process and updates global state
/// Must call [ApkReader.start] to start the process
class ApkReader extends IsolateRunner<String, APK_READER_FLAGS> with IconParserMixin {
  static String APK_FILE = '';
  static late Future<Map<String, Resource>> _resourceDump;
  static late Future<Map<int, String>> _stringDump;
  static late Future<Archive> _apkArchive;

  static const String REGEX_QUOTED_TYPE = r'["'']type[0-9]+/([0-9]*)["'']';

  /// Run operation on UI thread
  /// Local variables should never be called
  void setInUIThread<T>(T value, Function(T val) setter) => executeInUi(() {
    setter(value);
  });

  /// Changes shared value on UI thread
  /// Local variables should never be called
  void updateState<T>(SharedValue<T> Function() valGetter, T dataIn) => executeInUi(() {
    valGetter().$ = dataIn;
  });

  /// Changes shared value on UI thread via a callback
  /// Local variables should never be called
  void updateStateWith<T, E>(SharedValue<T> Function() valGetter, E dataIn, [T Function(E data)? provider]) => executeInUi(() {
    final sharedValue = valGetter();
    provider != null ? sharedValue.$ = provider(dataIn) : sharedValue.$ = dataIn as T;
  });

  static void patchZipBytes(Uint8List bytes) {
    ByteData bd = ByteData.view(bytes.buffer, bytes.offsetInBytes, bytes.length);
    
    int eocdOffset = -1;
    int minOffset = bytes.length - 65535 - 22;
    if (minOffset < 0) minOffset = 0;
    
    // Find EOCD (End of Central Directory)
    for (int i = bytes.length - 22; i >= minOffset; i--) {
      if (bd.getUint32(i, Endian.little) == 0x06054B50) {
        eocdOffset = i;
        break;
      }
    }
    if (eocdOffset == -1) return;
    
    int cdOffset = bd.getUint32(eocdOffset + 16, Endian.little);
    int cdRecords = bd.getUint16(eocdOffset + 10, Endian.little);
    
    // Adjust CD offset if the APK has prepended data
    if (cdOffset >= eocdOffset || bd.getUint32(cdOffset, Endian.little) != 0x02014B50) {
      int actualCdOffset = eocdOffset - bd.getUint32(eocdOffset + 12, Endian.little);
      if (actualCdOffset >= 0 && bd.getUint32(actualCdOffset, Endian.little) == 0x02014B50) {
        cdOffset = actualCdOffset;
      } else return;
    }
    
    int currentCd = cdOffset;
    for (int i = 0; i < cdRecords; i++) {
      if (currentCd + 46 > bytes.length) break;
      if (bd.getUint32(currentCd, Endian.little) != 0x02014B50) break;
      
      int nameLen = bd.getUint16(currentCd + 28, Endian.little);
      int extraLen = bd.getUint16(currentCd + 30, Endian.little);
      int commentLen = bd.getUint16(currentCd + 32, Endian.little);
      
      // Patch Central Directory Header Extra Field
      if (extraLen > 0) {
        int offset = currentCd + 46 + nameLen;
        if (offset + extraLen <= bytes.length) {
          int pos = 0;
          int lastSizeOffset = -1;
          while (pos + 4 <= extraLen) {
            int size = bd.getUint16(offset + pos + 2, Endian.little);
            if (pos + 4 + size > extraLen) {
              bd.setUint16(offset + pos + 2, extraLen - (pos + 4), Endian.little);
              pos = extraLen;
              break;
            }
            lastSizeOffset = offset + pos + 2;
            pos += 4 + size;
          }
          if (pos < extraLen) {
            if (lastSizeOffset != -1) {
              int lastSize = bd.getUint16(lastSizeOffset, Endian.little);
              bd.setUint16(lastSizeOffset, lastSize + (extraLen - pos), Endian.little);
            } else {
              // Shift padding to commentLen if no valid extra field exists
              bd.setUint16(currentCd + 30, 0, Endian.little);
              bd.setUint16(currentCd + 32, commentLen + extraLen, Endian.little);
            }
          }
        }
      }
      
      // let the archive safely and automatically skips Local File Header's padding
      currentCd += 46 + nameLen + extraLen + commentLen;
    }
  }

  static Future<Archive> initArchiveFile(File file) async {
    try {
      if (file.isInSSD() && file.lengthSync() <= 0x14000000) {
        Uint8List bytes = file.readAsBytesSync();
        patchZipBytes(bytes);
        return ZipDecoder().decodeBytes(bytes);
      } else {
        return ZipDecoder().decodeStream(InputFileStream(file.absolute.path));
      }
    } catch (e) {
      // Fallback: If decodeStream fails due to archive package bugs with zipalign padding,
      // load the file into memory, patch the bytes in-place, and decode again.
      Uint8List bytes = file.readAsBytesSync();
      patchZipBytes(bytes);
      return ZipDecoder().decodeBytes(bytes);
    }
  }

  /// Decodes a binary xml natively
  static Future<Uint8List> _decodeXml(List<int> encoded) async {
    if (encoded.isEmpty) return Uint8List(0);
    
    XmlDocument parsedDoc;
    if (encoded[0] == 0x03) {
      final parser = AxmlParser(Uint8List.fromList(encoded));
      parsedDoc = parser.parse();
    } else {
      final rawString = String.fromCharCodes(encoded);
      parsedDoc = XmlDocument.parse(rawString);
    }

    // Check if the DOM tree already contains an XmlDeclaration node.
    // If absent, insert a native XmlDeclaration node at index 0.
    if (!parsedDoc.children.any((node) => node is XmlDeclaration)) {
      parsedDoc.children.insert(
        0,
        XmlDeclaration([
          XmlAttribute(XmlName('version'), '1.0'),
          XmlAttribute(XmlName('encoding'), 'utf-8'),
        ]),
      );
    }
    
    final outXmlStr = parsedDoc.toXmlString(pretty: true, indent: '  ') + '\n';
    return Uint8List.fromList(utf8.encode(outXmlStr));
  }

  /// Returns the gradient as an aapt xml element
  static Future<String> getGradient(String gradientId) async {
    Resource? gradientRes = await getResources(gradientId, await _resourceDump, await _stringDump);
    if (gradientRes == null) return "";
    String resValue = gradientRes.values.first;
    // TODO this is a dirty hack because I did not foresee the 'type1' resource to refer to plain color resources and not just gradients
    if (!resValue.endsWith(".xml")) return gradientRes.type == ResType.COLOR ?
      '<aapt:attr name="android:fillColor"><gradient android:type="linear" android:startX="0" android:startY="0" android:endX="1" android:endY="1"><item android:color="#$resValue" android:offset="0"/></gradient></aapt:attr>' : '';
    Archive apkFile = await _apkArchive;
    ArchiveFile? gradientFile = apkFile.findFile(gradientRes.values.first);
    if (gradientFile == null) return "";
    String gradient = RegExp("<gradient.*", multiLine: true, dotAll: true).firstMatch(await decodeXml(gradientFile.content, true))?.group(0) ?? "";
    return '<aapt:attr name="android:fillColor">$gradient</aapt:attr>';
  }

  /// Starts asyncronous task to retrieve the gradient xml, returns a placeholder string containing gradent ID
  static String _getGradientPlaceholder(Map<String, Future<String>> gradients, String gradientId) {
    String placeholder = "@@FUTURE_GRADIENT_$gradientId@@";
    if (gradients.containsKey(gradientId)) return placeholder;
    else gradients[gradientId] = getGradient(gradientId);
    return placeholder;
  }

  /// Retrieves a simple color value from resource dump
  static Future<String> getColorValue(String resId) async {
    Resource? colorRes = await getResources(resId, await _resourceDump, await _stringDump);
    if (colorRes == null) return "";
    String resValue = colorRes.values.first;
    if (!resValue.endsWith(".xml") && colorRes.type == ResType.COLOR) {
      return "#$resValue";
    }
    return "";
  }

  /// Starts asynchronous task to retrieve the color hex, returns a placeholder string
  static String _getColorPlaceholder(Map<String, Future<String>> colors, String colorId) {
    String placeholder = "@@FUTURE_COLOR_$colorId@@";
    if (!colors.containsKey(colorId)) colors[colorId] = getColorValue(colorId);
    return placeholder;
  }

  /// Returns xml string, clears errors and normalizes fields
  static Future<String> decodeXml(Uint8List encoded, [bool isGradient = false]) async {
    Map<String, Future<String>>? futureGradients = isGradient ? null : {};
    Map<String, Future<String>>? futureColors = isGradient ? null : {};
    var xml = utf8.decode(await _decodeXml(encoded), allowMalformed: true);
    
    if (!isGradient) xml = xml.replaceAllMapped(RegExp('([\\s\\n]android:pathData=[\'"])[^M]*(M\\s*-?[0-9])'), (m) => m.group(1)!+m.group(2)! )
      .replaceAllMapped(RegExp('<(([a-zA-Z0-9]*)\\s+$REGEX_XML_NOCLOSE)(android:fillColor=[\'"])(type1/([0-9]*)[\'"])($REGEX_XML_NOCLOSE)>', multiLine: true, dotAll: true),
         (m) => '<${m.group(1)!}${m.group(7)!.endsWith("/") ? m.group(7)!.substring(0, m.group(7)!.length-1) : m.group(7)!}>\n${_getGradientPlaceholder(futureGradients!, "0x"+int.parse(m.group(6)!).toRadixString(16).padLeft(8, '0'))}${m.group(7)!.endsWith("/") ? "\n</${m.group(2)}>" : "\n"}')
      .replaceAllMapped(RegExp('([cC]olor=[\'"])type([0-9]+)/([0-9]*)([\'"])'), (m) {
        if (m.group(2) == '1') {
          return m.group(1)! + _getColorPlaceholder(futureColors!, "0x"+int.parse(m.group(3)!).toRadixString(16).padLeft(8, '0')) + m.group(4)!;
        } else {
          return m.group(1)! + '#' + int.parse(m.group(3)!).toRadixString(16).padLeft(8, '0') + m.group(4)!;
        }
      })
      .replaceAllMapped(RegExp('([\\s\\n](?:android:)?strokeLineCap=[\'"])\\s*([0-9]+|0x[0-9a-fA-F]+)'), (m) {
        final val = int.tryParse(m.group(2)!)?.toString() ?? m.group(2)!;
        return m.group(1)! + (strokeLineCap[val] ?? "butt");
      })
      .replaceAllMapped(RegExp('([\\s\\n](?:android:)?strokeLineJoin=[\'"])\\s*([0-9]+|0x[0-9a-fA-F]+)'), (m) {
        final val = int.tryParse(m.group(2)!)?.toString() ?? m.group(2)!;
        return m.group(1)! + (strokeLineJoin[val] ?? "miter");
      })
      .replaceAllMapped(RegExp('([\\s\\n]android:fillType=[\'"])([0-9]*)'), (m) => m.group(1)!+ (fillType[m.group(2)!] ?? "winding") );
    else xml = xml.replaceAllMapped(RegExp('([cC]olor=[\'"])(type([0-9])+/([0-9]*))'), (m) => m.group(1)!+'#'+(int.parse(m.group(4)!).toRadixString(16).padLeft(8, '0')) )
      .replaceAll(RegExp("(xmlns:[^=\\s]*|android:angle)\\s*=\\s*$REGEX_XML_QUOTED"), "")
      .replaceAllMapped(RegExp('(android:type\\s*=\\s*[\'"])([0-9]*)'), (m) => m.group(1)! + (gradientType[m.group(2)!] ?? "linear"));
    
    if (!isGradient) {
      var gradientList = await Future.wait(futureGradients!.values);
      Map<String, String> gradientMap = {}; int i = 0;
      for (var gradient in futureGradients.keys) gradientMap[gradient] = gradientList[i++];
      xml = xml.replaceAllMapped(RegExp("@@FUTURE_GRADIENT_([a-zA-Z0-9]*)@@"), (m) => gradientMap[m.group(1)] ?? "");

      var colorList = await Future.wait(futureColors!.values);
      Map<String, String> colorMap = {}; int j = 0;
      for (var color in futureColors.keys) colorMap[color] = colorList[j++];
      xml = xml.replaceAllMapped(RegExp("@@FUTURE_COLOR_([a-zA-Z0-9]*)@@"), (m) => colorMap[m.group(1)] ?? "");
    }
    return xml;
  }

  /// Retrieves a resource from the resource ID
  static Future<Resource?> getResources(String resId, Map<String, Resource> resources, Map<int, String> strings) async {
    log("checking RES-ID: $resId");
    var resource = resources[resId];
    if (resource != null) {
      log("found RES-VALUES: ${resource.values} of RES-TYPE: ${resource.type} for RES-ID: $resId");
      if (resource.type == ResType.COLOR) return resource;
      else if (resource.type == ResType.POINTER) return 
        resource.values.map((e)=>getResources('0x$e', resources, strings)).foldFuturesSkipNulls((e1, e2) => e1..values = [...e1.values, ...e2.values]);
      Iterable<String> files = strings.getAll(resource.values.map((e) => int.parse(e, radix: 16)));
      log("found RES-FILES: $files of RES-TYPE: ${resource.type} for RES-ID: $resId");
      return files.isNotEmpty ? Resource(files, resource.type) : null;
    }
    else return null;
  }

  /// Retrieves adaptive icon background and foreground images
  Future _getAdaptiveIconFiles(String? backgroundId, String foregroundId) async {
    Archive apkFile = await _apkArchive;
    await processAdaptiveIconFiles(
      backgroundId: backgroundId,
      foregroundId: foregroundId,
      resourceDump: await _resourceDump,
      stringDump: await _stringDump,
      getFiles: (paths) => apkFile.getFiles(paths),
    );
  }
  
  /// Retrieves non-adaptive icon image
  Future _getIconFile(String fileName) async {
    Archive apkFile = await _apkArchive;
    await processIconFile(
      fileName: fileName,
      getFile: (name) => apkFile.findFile(name),
      onAdaptiveIcon: _getAdaptiveIconFiles,
    );
  }

  static Future<String> parseLauncherActivityFromArchive(Archive apkArchive, [String packageName = ""]) async {
    try {
      ArchiveFile? manifestFile = apkArchive.findFile('AndroidManifest.xml');
      if (manifestFile == null) return "";

      Uint8List decodedBytes = await _decodeXml(manifestFile.content as List<int>);
      String manifestStr = utf8.decode(decodedBytes, allowMalformed: true);
      XmlDocument doc = XmlDocument.parse(manifestStr);

      String? getAttr(XmlElement elem, String localName) {
        for (var attr in elem.attributes) {
          if (attr.name.local == localName || attr.name.qualified == 'android:$localName') {
            return attr.value;
          }
        }
        return null;
      }

      if (packageName.isEmpty) {
        var manifestElement = doc.findElements('manifest').firstOrNull;
        if (manifestElement != null) {
          packageName = getAttr(manifestElement, 'package') ?? "";
        }
      }

      String normalizeName(String name) {
        if (name.isEmpty) return name;
        if (name.startsWith('.')) return '$packageName$name';
        if (!name.contains('.')) return '$packageName.$name';
        return name;
      }
      // Query both <activity> and <activity-alias> elements
      final candidates = [
        ...doc.findAllElements('activity'),
        ...doc.findAllElements('activity-alias'),
      ];

      String firstDisabledFallback = "";

      for (var element in candidates) {
        for (var intentFilter in element.findElements('intent-filter')) {
          bool hasMainAction = false;
          bool hasLauncherCategory = false;

          for (var action in intentFilter.findElements('action')) {
            var actionName = getAttr(action, 'name');
            if (actionName == 'android.intent.action.MAIN') {
              hasMainAction = true;
              break;
            }
          }

          for (var category in intentFilter.findElements('category')) {
            var catName = getAttr(category, 'name');
            if (catName == 'android.intent.category.LAUNCHER' ||
                catName == 'android.intent.category.LEANBACK_LAUNCHER' ||
                catName == 'android.intent.category.INFO') {
              hasLauncherCategory = true;
              break;
            }
          }

          if (hasMainAction && hasLauncherCategory) {
            String? rawName = getAttr(element, 'name') ?? getAttr(element, 'targetActivity');
            if (rawName != null && rawName.isNotEmpty) {
              String fullName = normalizeName(rawName);
              String enabledAttr = getAttr(element, 'enabled') ?? "true";
              
              // Prioritize explicitly or implicitly enabled launcher activities/aliases
              if (enabledAttr != "false") {
                return fullName;
              } else if (firstDisabledFallback.isEmpty) {
                firstDisabledFallback = fullName;
              }
            }
          }
        }
      }

      if (firstDisabledFallback.isNotEmpty) {
        return firstDisabledFallback;
      }
    } catch (e) {
      log("Failed to parse launcher activity from manifest: $e");
    }
    return "";
  }

  static Future<String> parseLauncherActivityFromApkBytes(List<int> bytes, [String packageName = ""]) async {
    try {
      Uint8List u8Bytes = bytes is Uint8List ? bytes : Uint8List.fromList(bytes);
      patchZipBytes(u8Bytes);
      final apkArchive = ZipDecoder().decodeBytes(u8Bytes);
      return await parseLauncherActivityFromArchive(apkArchive, packageName);
    } catch (e) {
      log("Failed to parse launcher activity from raw APK bytes: $e");
      return "";
    }
  }

  void loadInstallInfoOnUIThread(String package, int versionCode) => package.isNotEmpty ? executeInUi(() {
    GState.package.update((_) => package);
    GState.versionCode.update((_) => versionCode);
  }) : null;

  /// Retrieves APK information
  @override
  void run() async {
    File _APK_FILE_F = File(APK_FILE = data);
    bool ntSymlinkCreated = false;
    String APK_DIRECORY = _APK_FILE_F.parent.path;
    String APK_NAME = _APK_FILE_F.basename;
    
    if (!APK_NAME.isASCII) {
      String? shortName =  _APK_FILE_F.shortBaseName;
      if (shortName != null && shortName.isASCII) APK_NAME = shortName;
      else {
        String? ntSymlink = NtIO.createTempShortcut(_APK_FILE_F.absolute.path, "install-symlink@$pid.apk");
        if (ntSymlink != null) {
          ntSymlinkCreated = true;
          APK_NAME = ntSymlink;
          APK_DIRECORY = WinPath.tempSubdir;
        }
      }
    }

    _resourceDump = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'resources', APK_NAME], workingDirectory: APK_DIRECORY).then((p) => 
      p.stdout.toString().foldToMap(r'(^|\n)\s*resource\s+(0x[0-9a-zA-Z]*)[\s]+.*\st=0x0*([^\s\n]*).*\sd=0x0*([^\s\n]*)[\s|\n]', (m) => m.group(2)!, 
      (m,old) => Resource((old != null) ? ((old.values as ListQueue<String>)..addAll([m.group(4)!])) : ListQueue<String>.from([m.group(4)!]), old?.type ?? getResType(m.group(3)!)) )
    );
    //strings.findAll('(^|\\n|\\s)*String\\s+#(${resCodes.join("|")})\\s*:\\s*([^\\s\\n]*)', 3);
    _stringDump = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'strings', APK_NAME], workingDirectory: APK_DIRECORY).then((p) => 
      p.stdout.toString().toMap(r'(^|\n)\s*String\s+#([0-9]*)\s*:\s*([^\s\n]*)', (m) => int.parse(m.group(2)!), (m) => m.group(3)!)
    );
    File file = File(APK_FILE)..open();
    _apkArchive = initArchiveFile(file);

    bool legacyIcon = await waitFlag(APK_READER_FLAGS.LEGACY_ICON);
    Future<bool> legacyIconFound = (legacyIcon) ? () async {
      try {
        Archive apkFile = await _apkArchive;
        ArchiveFile? manifestFile = apkFile.findFile('AndroidManifest.xml');
        if (manifestFile == null) return false;

        // Parse AndroidManifest.xml from the archive directly
        String manifest = utf8.decode(await _decodeXml(manifestFile.content as List<int>), allowMalformed: true);
        String? icon = RegExp('<application\\s+${REGEX_XML_NOCLOSE}android:icon\\s*=\\s*$REGEX_QUOTED_TYPE', multiLine: true, dotAll: true).firstMatch(manifest)?.group(2);

        Resource? resource = icon != null ? await getResources(int.parse(icon).asResId, await _resourceDump, await _stringDump) : null;
        // first: smaller - last: bigger ? (taking the second one)
        Iterator<String>? legacyIconFiles = resource?.values.where((e) => !e.endsWith('.xml')).iterator;
        String? iconFile = (legacyIconFiles?.moveNext() ?? false) ? legacyIconFiles!.current : null;
        if (legacyIconFiles?.moveNext() ?? false) iconFile = legacyIconFiles!.current;
        if (iconFile != null) await _getIconFile(iconFile);
        return iconFile != null;
      } catch (e) {
        return false;
      }
    }() : Future.value(false);

    Future? iconUpdThread;
    Future<ProcessResult>? inner;
    var process = Process.run('${Env.TOOLS_DIR}\\aapt.exe', ['dump', 'badging', APK_NAME], stdoutEncoding: utf8, workingDirectory: APK_DIRECORY).then((value) async {
      if (ntSymlinkCreated) NtIO.deleteNtTempDirJunction();
      if (value.exitCode == 0) {
        String dump = value.stdout;
        String? info = dump.find(r'(^|\n)package:.*');

        int versionCode = int.parse(info?.find(r"(^|\n|\s)versionCode=\s*'([^'\n\s$]*)", 2) ?? "0");
        String package = info?.find(r"(^|\n|\s)name=\s*'([^'\n\s$]*)", 2) ?? "";
        loadInstallInfoOnUIThread(package, versionCode);

        updateStateWith(()=>GState.version, info, (String? v)=>v?.find(r"(^|\n|\s)versionName=\s*'([^'\n\s_$]*)", 2) ?? "");

        String activity = dump.find(r"(^|\n)(leanback-)?launchable-activity:.*name='([^'\n\s$]*)", 3) ?? "";
        if (activity.isEmpty) { // fallback
          Archive apkFile = await _apkArchive;
          activity = await parseLauncherActivityFromArchive(apkFile);
        }
        updateState(()=>GState.activity, activity);

        String? application = dump.find(r'(^|\n)application:\s*(.*)');
        String? title = application?.find(r"(^|\n|\s)label='([^']*)'", 2);
        String? icon = application?.find(r"(^|\n|\s)icon='([^']*)'", 2);
        updateState(()=>GState.apkTitle, title ?? "UNKNOWN_TITLE");

        Set<AndroidPermission> permissions = dump.toSet("(^|\\n)\\s*uses-permission(-[^:]*)?:\\s+name=[\"']([^\"'\\n]*)", 
          (m) => AndroidPermissionList.get(m.group(3)!), (a,b)=> a.index - b.index);
        if (permissions.isEmpty) permissions.add(AndroidPermission.NONE);
        updateState(()=>GState.permissions, permissions);

        String? sdkVersionStr = dump.find(r"(^|\n)sdkVersion:'([0-9]+)'", 2);
        int parsedMinSdk = int.tryParse(sdkVersionStr ?? "0") ?? 0;
        updateState(() => GState.minSdkVersion, parsedMinSdk);
        
        if (legacyIcon && await legacyIconFound) return;
        else if (icon?.endsWith(".xml") ?? false) inner = Process.run('${Env.TOOLS_DIR}\\aapt2.exe', ['dump', 'xmltree', '--file', icon!, APK_FILE])..then((value) {
          if (value.exitCode != 0) {log("XML ICON ERROR"); return;}
          String iconData = value.stdout.toString();
          String? background = iconData.find(r'(^|\n|\s)*E:[\s]?background\s[^\n]*\n\s*A:.*=@([^\s\n]*)', 2);
          String? foreground = iconData.find(r'(^|\n|\s)*E:[\s]?foreground\s[^\n]*\n\s*A:.*=@([^\s\n]*)', 2);
          
          log("APK-ICON-IDS: background_id=$background, foreground_id=$foreground");

          // then is apparently not called immediately
          if (foreground != null) iconUpdThread = _getAdaptiveIconFiles(background, foreground);
          else iconUpdThread= _getIconFile(icon);
        }); else if (icon != null && icon.isNotEmpty) {
          //Probably a png
          iconUpdThread = _getIconFile(icon);
        }
        log("APK-INFO:  title='$title', icon='$icon'");
      }
      else {
        log("aapt parse ERROR");
      }
    }).onError((error, stackTrace) {
      log("WEEEERROR: $stackTrace");
    });
    await process;
    if (inner != null) await inner;
    if (iconUpdThread != null) await iconUpdThread;
    setInUIThread(legacyIcon, (bool v) => setDefaultIcon(v));
  }

  /// Uses the default application icon if no icon has been found
  /// Has to be called in the UI thread
  static void setDefaultIcon(bool legacyIcon) async {
    if (GState.apkForegroundIcon.$ == null && GState.apkIcon.$ == null) {
      if (legacyIcon) {
        final legacy = await ScalableImage.fromSIAsset(rootBundle, "assets/icons/missing_icon_legacy.si");
        GState.apkIcon.update((p0) => (ScalableImageWidget(si: legacy)));
      }
      else {
        final fBackground = ScalableImage.fromSIAsset(rootBundle, "assets/icons/missing_icon_background.si");
        final fForeground = ScalableImage.fromSIAsset(rootBundle, "assets/icons/missing_icon_foreground.si");
        final background = await fBackground, foreground = await fForeground;
        GState.apkBackgroundIcon.update((p0) => (ScalableImageWidget(si: background)));
        GState.apkForegroundIcon.update((p0) => (ScalableImageWidget(si: foreground)));
      }
    }
  }

  @override
  FutureOr<void> postStartCallback(IsolateRef<String, APK_READER_FLAGS> isolate) {
    GState.legacyIcons.doWhenReady((value) {
      isolate.sendFlag(APK_READER_FLAGS.LEGACY_ICON, value);
    });
  }
}