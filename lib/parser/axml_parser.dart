import 'dart:convert';
import 'dart:typed_data';
import 'package:xml/xml.dart';

// Emulate C++ std::ostream defaultfloat formatting behavior (6 significant digits)
String _formatCppFloat(double val) {
  if (val == 0.0) return val.isNegative ? "-0" : "0";
  if (val.isNaN) return "nan";
  if (val.isInfinite) return val.isNegative ? "-inf" : "inf";

  String expStr = val.abs().toStringAsExponential(5);
  int eIdx = expStr.indexOf('e');
  int exp = int.parse(expStr.substring(eIdx + 1));

  if (exp < -4 || exp >= 6) {
    String mantissa = expStr.substring(0, eIdx);
    while (mantissa.contains('.') && (mantissa.endsWith('0') || mantissa.endsWith('.'))) {
      if (mantissa.endsWith('.')) {
        mantissa = mantissa.substring(0, mantissa.length - 1);
        break;
      }
      mantissa = mantissa.substring(0, mantissa.length - 1);
    }
    String sign = val.isNegative ? "-" : "";
    String expSign = exp >= 0 ? "+" : "-";
    String expVal = exp.abs().toString().padLeft(2, '0');
    return "$sign${mantissa}e$expSign$expVal";
  } else {
    int fractionDigits = 5 - exp;
    if (fractionDigits < 0) fractionDigits = 0;
    String s = val.toStringAsFixed(fractionDigits);
    while (s.contains('.') && (s.endsWith('0') || s.endsWith('.'))) {
      if (s.endsWith('.')) {
        s = s.substring(0, s.length - 1);
        break;
      }
      s = s.substring(0, s.length - 1);
    }
    return s;
  }
}


class StreamReader {
  final ByteData _data;
  int _offset = 0;

  StreamReader(Uint8List bytes) : _data = ByteData.sublistView(bytes);

  int get offset => _offset;

  int get length => _data.lengthInBytes;

  void moveHead(int pos) {
    if (pos < 0 || pos > _data.lengthInBytes) {
      throw Exception("invalid offset");
    }
    _offset = pos;
  }

  void moveHeadForward(int off) {
    moveHead(_offset + off);
  }

  int getUint8() {
    _validateHead(1);
    final val = _data.getUint8(_offset);
    _offset += 1;
    return val;
  }

  int getUint16() {
    _validateHead(2);
    final val = _data.getUint16(_offset, Endian.little);
    _offset += 2;
    return val;
  }

  int getUint32() {
    _validateHead(4);
    final val = _data.getUint32(_offset, Endian.little);
    _offset += 4;
    return val;
  }

  int peekUint16() {
    _validateHead(2);
    return _data.getUint16(_offset, Endian.little);
  }
  
  double getFloat32() {
    _validateHead(4);
    final val = _data.getFloat32(_offset, Endian.little);
    _offset += 4;
    return val;
  }

  String getCStr() {
    List<int> bytes = [];
    while (_offset < _data.lengthInBytes) {
      int b = getUint8();
      if (b == 0) break;
      bytes.add(b);
    }
    return utf8.decode(bytes, allowMalformed: true);
  }

  String getUtf16String(int charCount) {
    List<int> codeUnits = [];
    for (int i = 0; i < charCount; i++) {
      codeUnits.add(getUint16());
    }
    return String.fromCharCodes(codeUnits);
  }

  void _validateHead(int typeSize) {
    if (_offset < 0 || _offset + typeSize > _data.lengthInBytes) {
      throw Exception("invalid offset");
    }
  }
}

class ResChunkHeader {
  final int type;
  final int headerSize;
  final int size;

  ResChunkHeader(this.type, this.headerSize, this.size);
}

class ResourceValue {
  final int size;
  final int res0;
  final int dataType;
  final int data;
  final double? floatData; // To preserve raw float bits

  ResourceValue(this.size, this.res0, this.dataType, this.data, [this.floatData]);

  static const int typeNull = 0x00;
  static const int typeReference = 0x01;
  static const int typeAttribute = 0x02;
  static const int typeString = 0x03;
  static const int typeFloat = 0x04;
  static const int typeDimension = 0x05;
  static const int typeFraction = 0x06;
  static const int typeDynamicReference = 0x07;
  static const int typeIntDec = 0x10;
  static const int typeIntHex = 0x11;
  static const int typeIntBoolean = 0x12;
  
  static const int complexUnitPx = 0;
  static const int complexUnitDip = 1;
  static const int complexUnitSp = 2;
  static const int complexUnitPt = 3;
  static const int complexUnitIn = 4;
  static const int complexUnitMm = 5;
  static const int complexUnitFraction = 0;
  static const int complexUnitFractionParent = 1;

  String get formattedValue {
    if (dataType == typeNull) {
      return "null";
    } else if (dataType == typeFloat) {
      return floatData != null ? _formatCppFloat(floatData!) : "0";
    } else if (dataType == typeDimension) {
      return _printComplex(false);
    } else if (dataType == typeFraction) {
      return _printComplex(true);
    } else if (dataType == typeIntDec) {
      return data.toSigned(32).toString();
    } else if (dataType == typeIntHex) {
      return "0x${data.toRadixString(16)}";
    } else if (dataType == typeIntBoolean) {
      return data != 0 ? "true" : "false";
    } else {
      return "type$dataType/$data";
    }
  }

  String _printComplex(bool frac) {
    double mantissaMult = 1.0 / 256.0;
    List<double> radixMults = [
      mantissaMult * 1.0,
      mantissaMult * 1.0 / 128.0,
      mantissaMult * 1.0 / 32768.0,
      mantissaMult * 1.0 / 8388608.0
    ];

    int mantissa = (data & 0xffffff00).toSigned(32);
    double value = mantissa * radixMults[(data >> 4) & 0x3];

    if (frac) {
      String unit = "";
      switch (data & 0xf) {
        case complexUnitFraction:
          unit = "%";
          break;
        case complexUnitFractionParent:
          unit = "%p";
          break;
      }
      return "${_formatCppFloat(value * 100)}$unit";
    } else {
      String unit = "";
      switch (data & 0xf) {
        case complexUnitPx: unit = "px"; break;
        case complexUnitDip: unit = "dip"; break;
        case complexUnitSp: unit = "sp"; break;
        case complexUnitPt: unit = "pt"; break;
        case complexUnitIn: unit = "in"; break;
        case complexUnitMm: unit = "mm"; break;
      }
      return "${_formatCppFloat(value)}$unit";
    }
  }
}

class XmlNamespace {
  final int uriId;
  final int prefixId;
  XmlNamespace(this.uriId, this.prefixId);
}

class AxmlElement {
  final String name;
  final Map<String, String> namespaces = {}; // xmlns:prefix = uri
  final Map<String, String> attributes = {};
  final List<dynamic> children = []; // Can be AxmlElement or String (cdata)

  AxmlElement(this.name);

  XmlNode toXmlNode() {
    List<XmlAttribute> xmlAttrs = [];
    namespaces.forEach((prefix, uri) {
      xmlAttrs.add(XmlAttribute(XmlName(prefix, 'xmlns'), uri));
    });
    attributes.forEach((attrName, attrValue) {
      int colonIdx = attrName.indexOf(':');
      if (colonIdx != -1) {
        String prefix = attrName.substring(0, colonIdx);
        String localName = attrName.substring(colonIdx + 1);
        xmlAttrs.add(XmlAttribute(XmlName(localName, prefix), attrValue));
      } else {
        xmlAttrs.add(XmlAttribute(XmlName(attrName), attrValue));
      }
    });

    List<XmlNode> xmlChildren = [];
    for (var child in children) {
      if (child is AxmlElement) {
        xmlChildren.add(child.toXmlNode());
      } else if (child is String) {
        xmlChildren.add(XmlText(child));
      }
    }

    int colonIdx = name.indexOf(':');
    XmlName nodeName = colonIdx != -1
        ? XmlName(name.substring(colonIdx + 1), name.substring(0, colonIdx))
        : XmlName(name);

    return XmlElement(nodeName, xmlAttrs, xmlChildren);
  }
}

class XmlStackItem {
  final AxmlElement? element; // null for the root dummy stack item
  final List<XmlNamespace> namespaces = [];

  XmlStackItem([this.element]);
}

class AxmlParser {
  static const int resStringPoolType = 0x0001;
  static const int resXmlType = 0x0003;
  static const int resXmlStartNamespaceType = 0x0100;
  static const int resXmlEndNamespaceType = 0x0101;
  static const int resXmlStartElementType = 0x0102;
  static const int resXmlEndElementType = 0x0103;
  static const int resXmlCdataType = 0x0104;
  static const int resXmlResourceMapType = 0x0180;

  final StreamReader _reader;
  final List<String> _strings = [];
  final List<int> _attrNamesResIds = [];
  final List<XmlStackItem> _xmlStack = [];
  AxmlElement? rootElement;

  AxmlParser(Uint8List bytes) : _reader = StreamReader(bytes);

  XmlDocument parse() {
    _xmlStack.clear();
    _xmlStack.add(XmlStackItem()); 
    rootElement = null;

    if (_reader.length < 8) {
      throw Exception("not a binary XML file");
    }

    final header = _readChunkHeader();
    if (header.type != resXmlType) {
      throw Exception("not a binary XML file");
    }

    while (_reader.offset < header.size) {
      int savedOffset = _reader.offset;
      final chunkHeader = _readChunkHeader();

      switch (chunkHeader.type) {
        case resStringPoolType:
          _reader.moveHead(savedOffset); 
          _parseStringPool();
          break;
        case resXmlResourceMapType:
          _reader.moveHead(savedOffset);
          _parseResourceMap();
          break;
        case resXmlStartNamespaceType:
          _reader.moveHead(savedOffset);
          _parseStartNamespace();
          break;
        case resXmlEndNamespaceType:
          _reader.moveHead(savedOffset);
          _parseEndNamespace();
          break;
        case resXmlStartElementType:
          _reader.moveHead(savedOffset);
          _parseXmlStartElement();
          break;
        case resXmlEndElementType:
          _reader.moveHead(savedOffset);
          _parseXmlEndElement();
          break;
        case resXmlCdataType:
          _reader.moveHead(savedOffset);
          _parseXmlCdata();
          break;
        default:
          throw Exception("unknown chunk type 0x${chunkHeader.type.toRadixString(16)}");
      }
      _reader.moveHead(savedOffset + chunkHeader.size);
    }

    if (rootElement == null) {
      throw Exception("XML root element not found");
    }
    return XmlDocument([rootElement!.toXmlNode()]);
  }

  ResChunkHeader _readChunkHeader() {
    return ResChunkHeader(
      _reader.getUint16(),
      _reader.getUint16(),
      _reader.getUint32()
    );
  }

  void _parseStringPool() {
    _readChunkHeader();
    int stringCount = _reader.getUint32();
    int styleCount = _reader.getUint32();
    int flags = _reader.getUint32();
    bool utf8Flag = (flags & (1 << 8)) != 0;
    int stringsStart = _reader.getUint32();
    _reader.getUint32(); // styles_start

    if (styleCount != 0) {
      throw Exception("styles are not supported");
    }

    List<int> stringOffsets = [];
    for (int i = 0; i < stringCount; i++) {
      stringOffsets.add(_reader.getUint32());
    }

    _strings.clear();
    for (int off in stringOffsets) {
      _reader.moveHead(stringsStart + 8 + off); 
      String str = "";
      
      if (utf8Flag) {
        _reader.getUint8();
        int len = _reader.getUint8();
        if ((len & 0x80) != 0) {
          _reader.getUint8();
        }
        if (len != 0) {
          str = _reader.getCStr();
        }
      } else {
        int len = _reader.getUint16();
        if ((len & 0x8000) != 0) {
          len |= ((len & 0x7fff) << 16) | _reader.getUint16();
        }
        str = _reader.getUtf16String(len);
      }
      _strings.add(str);
    }
  }

  void _parseResourceMap() {
    final header = _readChunkHeader();
    _attrNamesResIds.clear();
    int count = (header.size - 8) ~/ 4;
    for (int i = 0; i < count; i++) {
      _attrNamesResIds.add(_reader.getUint32());
    }
  }

  void _parseStartNamespace() {
    _readChunkHeader();
    _reader.getUint32(); // line_num
    _reader.getUint32(); // comment
    int prefix = _reader.getUint32();
    int uri = _reader.getUint32();
    _xmlStack.last.namespaces.add(XmlNamespace(uri, prefix));
  }

  void _parseEndNamespace() {
    _readChunkHeader();
    _reader.getUint32(); // line_num
    _reader.getUint32(); // comment
    _reader.getUint32(); // prefix
    _reader.getUint32(); // uri
    _xmlStack.last.namespaces.removeLast();
  }

  void _parseXmlStartElement() {
    _readChunkHeader();
    _reader.getUint32(); // line_num
    _reader.getUint32(); // comment
    _reader.getUint32(); // ns
    int nameIdx = _reader.getUint32();
    _reader.getUint32(); // attribute_size
    int attributeCount = _reader.getUint16();
    _reader.getUint16(); // id_index
    _reader.getUint16(); // class_index
    _reader.getUint16(); // style_index

    String elemName = _strings[nameIdx];
    var elem = AxmlElement(elemName);

    for (var ns in _xmlStack.last.namespaces) {
      elem.namespaces[_strings[ns.prefixId]] = _strings[ns.uriId];
    }

    if (_xmlStack.last.element != null) {
      _xmlStack.last.element!.children.add(elem);
    } else {
      rootElement = elem; 
    }
    _xmlStack.add(XmlStackItem(elem));

    for (int i = 0; i < attributeCount; ++i) {
      int attrNs = _reader.getUint32();
      int attrNameIdx = _reader.getUint32();
      int attrRawVal = _reader.getUint32();
      
      int size = _reader.getUint16();
      int res0 = _reader.getUint8();
      int dataType = _reader.getUint8();
      
      double? floatVal;
      int dataVal;
      if (dataType == ResourceValue.typeFloat) {
         floatVal = _reader.getFloat32();
         _reader.moveHead(_reader.offset - 4);
         dataVal = _reader.getUint32();
      } else {
         dataVal = _reader.getUint32();
      }
      
      var value = ResourceValue(size, res0, dataType, dataVal, floatVal);

      String attrName = "";
      if (attrNs != 0xffffffff) {
        int prefixIdx = _lookupPrefix(attrNs);
        if (prefixIdx != 0xffffffff) {
          attrName += "${_strings[prefixIdx]}:";
        }
      }

      if (_strings[attrNameIdx].isEmpty) {
        if (attrNameIdx >= _attrNamesResIds.length) {
          throw Exception("undefined attr name");
        }
        attrName += _getResourceString(_attrNamesResIds[attrNameIdx]);
      } else {
        attrName += _strings[attrNameIdx];
      }

      String attrStrValue;
      if (attrRawVal != 0xffffffff) {
        attrStrValue = _strings[attrRawVal];
      } else {
        attrStrValue = value.formattedValue;
      }
      elem.attributes[attrName] = attrStrValue;
    }
  }

  void _parseXmlEndElement() {
    _readChunkHeader();
    _reader.getUint32(); // line_num
    _reader.getUint32(); // comment
    _reader.getUint32(); // ns
    _reader.getUint32(); // name
    _xmlStack.removeLast();
  }

  void _parseXmlCdata() {
    _readChunkHeader();
    _reader.getUint32(); // line_num
    _reader.getUint32(); // comment
    int textIdx = _reader.getUint32();
    _reader.getUint32(); 
    _reader.getUint32(); 
    
    if (_xmlStack.last.element != null) {
       _xmlStack.last.element!.children.add(_strings[textIdx]);
    }
  }

  int _lookupPrefix(int uriId) {
    for (int i = _xmlStack.length - 1; i >= 0; i--) {
      final namespaces = _xmlStack[i].namespaces;
      for (int j = namespaces.length - 1; j >= 0; j--) {
        if (namespaces[j].uriId == uriId) {
          return namespaces[j].prefixId;
        }
      }
    }
    return 0xffffffff;
  }

  String _getResourceString(int id) {
    id -= 0x01010000;
    if (id < 0 || id >= _attrNames.length) {
      throw Exception("invalid resource id");
    }
    return _attrNames[id];
  }

  static const List<String> _attrNames = [
    "theme", "label", "icon", "name", "manageSpaceActivity", "allowClearUserData",
    "permission", "readPermission", "writePermission", "protectionLevel", "permissionGroup",
    "sharedUserId", "hasCode", "persistent", "enabled", "debuggable", "exported", "process",
    "taskAffinity", "multiprocess", "finishOnTaskLaunch", "clearTaskOnLaunch", "stateNotNeeded",
    "excludeFromRecents", "authorities", "syncable", "initOrder", "grantUriPermissions", "priority",
    "launchMode", "screenOrientation", "configChanges", "description", "targetPackage",
    "handleProfiling", "functionalTest", "value", "resource", "mimeType", "scheme", "host", "port",
    "path", "pathPrefix", "pathPattern", "action", "data", "targetClass", "colorForeground",
    "colorBackground", "backgroundDimAmount", "disabledAlpha", "textAppearance",
    "textAppearanceInverse", "textColorPrimary", "textColorPrimaryDisableOnly", "textColorSecondary",
    "textColorPrimaryInverse", "textColorSecondaryInverse", "textColorPrimaryNoDisable",
    "textColorSecondaryNoDisable", "textColorPrimaryInverseNoDisable", "textColorSecondaryInverseNoDisable",
    "textColorHintInverse", "textAppearanceLarge", "textAppearanceMedium", "textAppearanceSmall",
    "textAppearanceLargeInverse", "textAppearanceMediumInverse", "textAppearanceSmallInverse",
    "textCheckMark", "textCheckMarkInverse", "buttonStyle", "buttonStyleSmall", "buttonStyleInset",
    "buttonStyleToggle", "galleryItemBackground", "listPreferredItemHeight",
    "expandableListPreferredItemPaddingLeft", "expandableListPreferredChildPaddingLeft",
    "expandableListPreferredItemIndicatorLeft", "expandableListPreferredItemIndicatorRight",
    "expandableListPreferredChildIndicatorLeft", "expandableListPreferredChildIndicatorRight",
    "windowBackground", "windowFrame", "windowNoTitle", "windowIsFloating", "windowIsTranslucent",
    "windowContentOverlay", "windowTitleSize", "windowTitleStyle", "windowTitleBackgroundStyle",
    "alertDialogStyle", "panelBackground", "panelFullBackground", "panelColorForeground",
    "panelColorBackground", "panelTextAppearance", "scrollbarSize", "scrollbarThumbHorizontal",
    "scrollbarThumbVertical", "scrollbarTrackHorizontal", "scrollbarTrackVertical",
    "scrollbarAlwaysDrawHorizontalTrack", "scrollbarAlwaysDrawVerticalTrack", "absListViewStyle",
    "autoCompleteTextViewStyle", "checkboxStyle", "dropDownListViewStyle", "editTextStyle",
    "expandableListViewStyle", "galleryStyle", "gridViewStyle", "imageButtonStyle", "imageWellStyle",
    "listViewStyle", "listViewWhiteStyle", "popupWindowStyle", "progressBarStyle",
    "progressBarStyleHorizontal", "progressBarStyleSmall", "progressBarStyleLarge", "seekBarStyle",
    "ratingBarStyle", "ratingBarStyleSmall", "radioButtonStyle", "scrollbarStyle", "scrollViewStyle",
    "spinnerStyle", "starStyle", "tabWidgetStyle", "textViewStyle", "webViewStyle", "dropDownItemStyle",
    "spinnerDropDownItemStyle", "dropDownHintAppearance", "spinnerItemStyle", "mapViewStyle",
    "preferenceScreenStyle", "preferenceCategoryStyle", "preferenceInformationStyle", "preferenceStyle",
    "checkBoxPreferenceStyle", "yesNoPreferenceStyle", "dialogPreferenceStyle", "editTextPreferenceStyle",
    "ringtonePreferenceStyle", "preferenceLayoutChild", "textSize", "typeface", "textStyle", "textColor",
    "textColorHighlight", "textColorHint", "textColorLink", "state_focused", "state_window_focused",
    "state_enabled", "state_checkable", "state_checked", "state_selected", "state_active",
    "state_single", "state_first", "state_middle", "state_last", "state_pressed", "state_expanded",
    "state_empty", "state_above_anchor", "ellipsize", "x", "y", "windowAnimationStyle", "gravity",
    "autoLink", "linksClickable", "entries", "layout_gravity", "windowEnterAnimation",
    "windowExitAnimation", "windowShowAnimation", "windowHideAnimation", "activityOpenEnterAnimation",
    "activityOpenExitAnimation", "activityCloseEnterAnimation", "activityCloseExitAnimation",
    "taskOpenEnterAnimation", "taskOpenExitAnimation", "taskCloseEnterAnimation", "taskCloseExitAnimation",
    "taskToFrontEnterAnimation", "taskToFrontExitAnimation", "taskToBackEnterAnimation",
    "taskToBackExitAnimation", "orientation", "keycode", "fullDark", "topDark", "centerDark",
    "bottomDark", "fullBright", "topBright", "centerBright", "bottomBright", "bottomMedium",
    "centerMedium", "id", "tag", "scrollX", "scrollY", "background", "padding", "paddingLeft",
    "paddingTop", "paddingRight", "paddingBottom", "focusable", "focusableInTouchMode", "visibility",
    "fitsSystemWindows", "scrollbars", "fadingEdge", "fadingEdgeLength", "nextFocusLeft",
    "nextFocusRight", "nextFocusUp", "nextFocusDown", "clickable", "longClickable", "saveEnabled",
    "drawingCacheQuality", "duplicateParentState", "clipChildren", "clipToPadding", "layoutAnimation",
    "animationCache", "persistentDrawingCache", "alwaysDrawnWithCache", "addStatesFromChildren",
    "descendantFocusability", "layout", "inflatedId", "layout_width", "layout_height", "layout_margin",
    "layout_marginLeft", "layout_marginTop", "layout_marginRight", "layout_marginBottom",
    "listSelector", "drawSelectorOnTop", "stackFromBottom", "scrollingCache", "textFilterEnabled",
    "transcriptMode", "cacheColorHint", "dial", "hand_hour", "hand_minute", "format", "checked",
    "button", "checkMark", "foreground", "measureAllChildren", "groupIndicator", "childIndicator",
    "indicatorLeft", "indicatorRight", "childIndicatorLeft", "childIndicatorRight", "childDivider",
    "animationDuration", "spacing", "horizontalSpacing", "verticalSpacing", "stretchMode",
    "columnWidth", "numColumns", "src", "antialias", "filter", "dither", "scaleType",
    "adjustViewBounds", "maxWidth", "maxHeight", "tint", "baselineAlignBottom", "cropToPadding",
    "textOn", "textOff", "baselineAligned", "baselineAlignedChildIndex", "weightSum", "divider",
    "dividerHeight", "choiceMode", "itemTextAppearance", "horizontalDivider", "verticalDivider",
    "headerBackground", "itemBackground", "itemIconDisabledAlpha", "rowHeight", "maxRows",
    "maxItemsPerRow", "moreIcon", "max", "progress", "secondaryProgress", "indeterminate",
    "indeterminateOnly", "indeterminateDrawable", "progressDrawable", "indeterminateDuration",
    "indeterminateBehavior", "minWidth", "minHeight", "interpolator", "thumb", "thumbOffset",
    "numStars", "rating", "stepSize", "isIndicator", "checkedButton", "stretchColumns", "shrinkColumns",
    "collapseColumns", "layout_column", "layout_span", "bufferType", "text", "hint", "textScaleX",
    "cursorVisible", "maxLines", "lines", "height", "minLines", "maxEms", "ems", "width", "minEms",
    "scrollHorizontally", "password", "singleLine", "selectAllOnFocus", "includeFontPadding",
    "maxLength", "shadowColor", "shadowDx", "shadowDy", "shadowRadius", "numeric", "digits",
    "phoneNumber", "inputMethod", "capitalize", "autoText", "editable", "freezesText", "drawableTop",
    "drawableBottom", "drawableLeft", "drawableRight", "drawablePadding", "completionHint",
    "completionHintView", "completionThreshold", "dropDownSelector", "popupBackground", "inAnimation",
    "outAnimation", "flipInterval", "fillViewport", "prompt", "startYear", "endYear", "mode",
    "layout_x", "layout_y", "layout_weight", "layout_toLeftOf", "layout_toRightOf", "layout_above",
    "layout_below", "layout_alignBaseline", "layout_alignLeft", "layout_alignTop", "layout_alignRight",
    "layout_alignBottom", "layout_alignParentLeft", "layout_alignParentTop", "layout_alignParentRight",
    "layout_alignParentBottom", "layout_centerInParent", "layout_centerHorizontal",
    "layout_centerVertical", "layout_alignWithParentIfMissing", "layout_scale", "visible",
    "variablePadding", "constantSize", "oneshot", "duration", "drawable", "shape", "innerRadiusRatio",
    "thicknessRatio", "startColor", "endColor", "useLevel", "angle", "type", "centerX", "centerY",
    "gradientRadius", "color", "dashWidth", "dashGap", "radius", "topLeftRadius", "topRightRadius",
    "bottomLeftRadius", "bottomRightRadius", "left", "top", "right", "bottom", "minLevel", "maxLevel",
    "fromDegrees", "toDegrees", "pivotX", "pivotY", "insetLeft", "insetRight", "insetTop", "insetBottom",
    "shareInterpolator", "fillBefore", "fillAfter", "startOffset", "repeatCount", "repeatMode",
    "zAdjustment", "fromXScale", "toXScale", "fromYScale", "toYScale", "fromXDelta", "toXDelta",
    "fromYDelta", "toYDelta", "fromAlpha", "toAlpha", "delay", "animation", "animationOrder",
    "columnDelay", "rowDelay", "direction", "directionPriority", "factor", "cycles", "searchMode",
    "searchSuggestAuthority", "searchSuggestPath", "searchSuggestSelection", "searchSuggestIntentAction",
    "searchSuggestIntentData", "queryActionMsg", "suggestActionMsg", "suggestActionMsgColumn",
    "menuCategory", "orderInCategory", "checkableBehavior", "title", "titleCondensed",
    "alphabeticShortcut", "numericShortcut", "checkable", "selectable", "orderingFromXml", "key",
    "summary", "order", "widgetLayout", "dependency", "defaultValue", "shouldDisableView", "summaryOn",
    "summaryOff", "disableDependentsState", "dialogTitle", "dialogMessage", "dialogIcon",
    "positiveButtonText", "negativeButtonText", "dialogLayout", "entryValues", "ringtoneType",
    "showDefault", "showSilent", "scaleWidth", "scaleHeight", "scaleGravity", "ignoreGravity",
    "foregroundGravity", "tileMode", "targetActivity", "alwaysRetainTaskState", "allowTaskReparenting",
    "searchButtonText", "colorForegroundInverse", "textAppearanceButton", "listSeparatorTextViewStyle",
    "streamType", "clipOrientation", "centerColor", "minSdkVersion", "windowFullscreen",
    "unselectedAlpha", "progressBarStyleSmallTitle", "ratingBarStyleIndicator", "apiKey",
    "textColorTertiary", "textColorTertiaryInverse", "listDivider", "soundEffectsEnabled",
    "keepScreenOn", "lineSpacingExtra", "lineSpacingMultiplier", "listChoiceIndicatorSingle",
    "listChoiceIndicatorMultiple", "versionCode", "versionName", "marqueeRepeatLimit",
    "windowNoDisplay", "backgroundDimEnabled", "inputType", "isDefault", "windowDisablePreview",
    "privateImeOptions", "editorExtras", "settingsActivity", "fastScrollEnabled", "reqTouchScreen",
    "reqKeyboardType", "reqHardKeyboard", "reqNavigation", "windowSoftInputMode",
    "imeFullscreenBackground", "noHistory", "headerDividersEnabled", "footerDividersEnabled",
    "candidatesTextStyleSpans", "smoothScrollbar", "reqFiveWayNav", "keyBackground", "keyTextSize",
    "labelTextSize", "keyTextColor", "keyPreviewLayout", "keyPreviewOffset", "keyPreviewHeight",
    "verticalCorrection", "popupLayout", "state_long_pressable", "keyWidth", "keyHeight",
    "horizontalGap", "verticalGap", "rowEdgeFlags", "codes", "popupKeyboard", "popupCharacters",
    "keyEdgeFlags", "isModifier", "isSticky", "isRepeatable", "iconPreview", "keyOutputText", "keyLabel",
    "keyIcon", "keyboardMode", "isScrollContainer", "fillEnabled", "updatePeriodMillis", "initialLayout",
    "voiceSearchMode", "voiceLanguageModel", "voicePromptText", "voiceLanguage", "voiceMaxResults",
    "bottomOffset", "topOffset", "allowSingleTap", "handle", "content", "animateOnClick", "configure",
    "hapticFeedbackEnabled", "innerRadius", "thickness", "sharedUserLabel", "dropDownWidth",
    "dropDownAnchor", "imeOptions", "imeActionLabel", "imeActionId", "UNKNOWN",
    "imeExtractEnterAnimation", "imeExtractExitAnimation", "tension", "extraTension", "anyDensity",
    "searchSuggestThreshold", "includeInGlobalSearch", "onClick", "targetSdkVersion", "maxSdkVersion",
    "testOnly", "contentDescription", "gestureStrokeWidth", "gestureColor", "uncertainGestureColor",
    "fadeOffset", "fadeDuration", "gestureStrokeType", "gestureStrokeLengthThreshold",
    "gestureStrokeSquarenessThreshold", "gestureStrokeAngleThreshold", "eventsInterceptionEnabled",
    "fadeEnabled", "backupAgent", "allowBackup", "glEsVersion", "queryAfterZeroResults",
    "dropDownHeight", "smallScreens", "normalScreens", "largeScreens", "progressBarStyleInverse",
    "progressBarStyleSmallInverse", "progressBarStyleLargeInverse", "searchSettingsDescription",
    "textColorPrimaryInverseDisableOnly", "autoUrlDetect", "resizeable", "required", "accountType",
    "contentAuthority", "userVisible", "windowShowWallpaper", "wallpaperOpenEnterAnimation",
    "wallpaperOpenExitAnimation", "wallpaperCloseEnterAnimation", "wallpaperCloseExitAnimation",
    "wallpaperIntraOpenEnterAnimation", "wallpaperIntraOpenExitAnimation",
    "wallpaperIntraCloseEnterAnimation", "wallpaperIntraCloseExitAnimation", "supportsUploading",
    "killAfterRestore", "restoreNeedsApplication", "smallIcon", "accountPreferences",
    "textAppearanceSearchResultSubtitle", "textAppearanceSearchResultTitle", "summaryColumn",
    "detailColumn", "detailSocialSummary", "thumbnail", "detachWallpaper",
    "finishOnCloseSystemDialogs", "scrollbarFadeDuration", "scrollbarDefaultDelayBeforeFade",
    "fadeScrollbars", "colorBackgroundCacheHint", "dropDownHorizontalOffset",
    "dropDownVerticalOffset", "quickContactBadgeStyleWindowSmall", "quickContactBadgeStyleWindowMedium",
    "quickContactBadgeStyleWindowLarge", "quickContactBadgeStyleSmallWindowSmall",
    "quickContactBadgeStyleSmallWindowMedium", "quickContactBadgeStyleSmallWindowLarge", "author",
    "autoStart", "expandableListViewWhiteStyle", "installLocation", "vmSafeMode", "webTextViewStyle",
    "restoreAnyVersion", "tabStripLeft", "tabStripRight", "tabStripEnabled", "logo", "xlargeScreens",
    "immersive", "overScrollMode", "overScrollHeader", "overScrollFooter", "filterTouchesWhenObscured",
    "textSelectHandleLeft", "textSelectHandleRight", "textSelectHandle", "textSelectHandleWindowStyle",
    "popupAnimationStyle", "screenSize", "screenDensity", "allContactsName", "windowActionBar",
    "actionBarStyle", "navigationMode", "displayOptions", "subtitle", "customNavigationLayout",
    "hardwareAccelerated", "measureWithLargestChild", "animateFirstView", "dropDownSpinnerStyle",
    "actionDropDownStyle", "actionButtonStyle", "showAsAction", "previewImage", "actionModeBackground",
    "actionModeCloseDrawable", "windowActionModeOverlay", "valueFrom", "valueTo", "valueType",
    "propertyName", "ordering", "fragment", "windowActionBarOverlay", "fragmentOpenEnterAnimation",
    "fragmentOpenExitAnimation", "fragmentCloseEnterAnimation", "fragmentCloseExitAnimation",
    "fragmentFadeEnterAnimation", "fragmentFadeExitAnimation", "actionBarSize", "imeSubtypeLocale",
    "imeSubtypeMode", "imeSubtypeExtraValue", "splitMotionEvents", "listChoiceBackgroundIndicator",
    "spinnerMode", "animateLayoutChanges", "actionBarTabStyle", "actionBarTabBarStyle",
    "actionBarTabTextStyle", "actionOverflowButtonStyle", "actionModeCloseButtonStyle", "titleTextStyle",
    "subtitleTextStyle", "iconifiedByDefault", "actionLayout", "actionViewClass",
    "activatedBackgroundIndicator", "state_activated", "listPopupWindowStyle", "popupMenuStyle",
    "textAppearanceLargePopupMenu", "textAppearanceSmallPopupMenu", "breadCrumbTitle",
    "breadCrumbShortTitle", "listDividerAlertDialog", "textColorAlertDialogListItem", "loopViews",
    "dialogTheme", "alertDialogTheme", "dividerVertical", "homeAsUpIndicator", "enterFadeDuration",
    "exitFadeDuration", "selectableItemBackground", "autoAdvanceViewId", "useIntrinsicSizeAsMinimum",
    "actionModeCutDrawable", "actionModeCopyDrawable", "actionModePasteDrawable",
    "textEditPasteWindowLayout", "textEditNoPasteWindowLayout", "textIsSelectable",
    "windowEnableSplitTouch", "indeterminateProgressStyle", "progressBarPadding", "animationResolution",
    "state_accelerated", "baseline", "homeLayout", "opacity", "alpha", "transformPivotX",
    "transformPivotY", "translationX", "translationY", "scaleX", "scaleY", "rotation", "rotationX",
    "rotationY", "showDividers", "dividerPadding", "borderlessButtonStyle", "dividerHorizontal",
    "itemPadding", "buttonBarStyle", "buttonBarButtonStyle", "segmentedButtonStyle",
    "staticWallpaperPreview", "allowParallelSyncs", "isAlwaysSyncable", "verticalScrollbarPosition",
    "fastScrollAlwaysVisible", "fastScrollThumbDrawable", "fastScrollPreviewBackgroundLeft",
    "fastScrollPreviewBackgroundRight", "fastScrollTrackDrawable", "fastScrollOverlayPosition",
    "customTokens", "nextFocusForward", "firstDayOfWeek", "showWeekNumber", "minDate", "maxDate",
    "shownWeekCount", "selectedWeekBackgroundColor", "focusedMonthDateColor",
    "unfocusedMonthDateColor", "weekNumberColor", "weekSeparatorLineColor", "selectedDateVerticalBar",
    "weekDayTextAppearance", "dateTextAppearance", "UNKNOWN", "spinnersShown", "calendarViewShown",
    "state_multiline", "detailsElementBackground", "textColorHighlightInverse", "textColorLinkInverse",
    "editTextColor", "editTextBackground", "horizontalScrollViewStyle", "layerType", "alertDialogIcon",
    "windowMinWidthMajor", "windowMinWidthMinor", "queryHint", "fastScrollTextColor", "largeHeap",
    "windowCloseOnTouchOutside", "datePickerStyle", "calendarViewStyle", "textEditSidePasteWindowLayout",
    "textEditSideNoPasteWindowLayout", "actionMenuTextAppearance", "actionMenuTextColor",
    "textCursorDrawable", "resizeMode", "requiresSmallestWidthDp", "compatibleWidthLimitDp",
    "largestWidthLimitDp", "state_hovered", "state_drag_can_accept", "state_drag_hovered",
    "stopWithTask", "switchTextOn", "switchTextOff", "switchPreferenceStyle", "switchTextAppearance",
    "track", "switchMinWidth", "switchPadding", "thumbTextPadding", "textSuggestionsWindowStyle",
    "textEditSuggestionItemLayout", "rowCount", "rowOrderPreserved", "columnCount",
    "columnOrderPreserved", "useDefaultMargins", "alignmentMode", "layout_row", "layout_rowSpan",
    "layout_columnSpan", "actionModeSelectAllDrawable", "isAuxiliary", "accessibilityEventTypes",
    "packageNames", "accessibilityFeedbackType", "notificationTimeout", "accessibilityFlags",
    "canRetrieveWindowContent", "listPreferredItemHeightLarge", "listPreferredItemHeightSmall",
    "actionBarSplitStyle", "actionProviderClass", "backgroundStacked", "backgroundSplit", "textAllCaps",
    "colorPressedHighlight", "colorLongPressedHighlight", "colorFocusedHighlight",
    "colorActivatedHighlight", "colorMultiSelectHighlight", "drawableStart", "drawableEnd",
    "actionModeStyle", "minResizeWidth", "minResizeHeight", "actionBarWidgetTheme", "uiOptions",
    "subtypeLocale", "subtypeExtraValue", "actionBarDivider", "actionBarItemBackground",
    "actionModeSplitBackground", "textAppearanceListItem", "textAppearanceListItemSmall",
    "targetDescriptions", "directionDescriptions", "overridesImplicitlyEnabledSubtype",
    "listPreferredItemPaddingLeft", "listPreferredItemPaddingRight", "requiresFadingEdge", "publicKey",
    "parentActivityName", "UNKNOWN", "isolatedProcess", "importantForAccessibility", "keyboardLayout",
    "fontFamily", "mediaRouteButtonStyle", "mediaRouteTypes", "supportsRtl", "textDirection",
    "textAlignment", "layoutDirection", "paddingStart", "paddingEnd", "layout_marginStart",
    "layout_marginEnd", "layout_toStartOf", "layout_toEndOf", "layout_alignStart", "layout_alignEnd",
    "layout_alignParentStart", "layout_alignParentEnd", "listPreferredItemPaddingStart",
    "listPreferredItemPaddingEnd", "singleUser", "presentationTheme", "subtypeId",
    "initialKeyguardLayout", "UNKNOWN", "widgetCategory", "permissionGroupFlags", "labelFor",
    "permissionFlags", "checkedTextViewStyle", "showOnLockScreen", "format12Hour", "format24Hour",
    "timeZone", "mipMap", "mirrorForRtl", "windowOverscan", "requiredForAllUsers", "indicatorStart",
    "indicatorEnd", "childIndicatorStart", "childIndicatorEnd", "restrictedAccountType",
    "requiredAccountType", "canRequestTouchExplorationMode", "canRequestEnhancedWebAccessibility",
    "canRequestFilterKeyEvents", "layoutMode", "keySet", "targetId", "fromScene", "toScene", "transition",
    "transitionOrdering", "fadingMode", "startDelay", "ssp", "sspPrefix", "sspPattern",
    "addPrintersActivity", "vendor", "category", "isAsciiCapable", "autoMirrored",
    "supportsSwitchingToNextInputMethod", "requireDeviceUnlock", "apduServiceBanner",
    "accessibilityLiveRegion", "windowTranslucentStatus", "windowTranslucentNavigation",
    "advancedPrintOptionsActivity", "banner", "windowSwipeToDismiss", "isGame", "allowEmbedded",
    "setupActivity", "fastScrollStyle", "windowContentTransitions", "windowContentTransitionManager",
    "translationZ", "tintMode", "controlX1", "controlY1", "controlX2", "controlY2", "transitionName",
    "transitionGroup", "viewportWidth", "viewportHeight", "fillColor", "pathData", "strokeColor",
    "strokeWidth", "trimPathStart", "trimPathEnd", "trimPathOffset", "strokeLineCap", "strokeLineJoin",
    "strokeMiterLimit", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN",
    "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN",
    "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN", "UNKNOWN",
    "UNKNOWN", "UNKNOWN", "colorControlNormal", "colorControlActivated", "colorButtonNormal",
    "colorControlHighlight", "persistableMode", "titleTextAppearance", "subtitleTextAppearance",
    "slideEdge", "actionBarTheme", "textAppearanceListItemSecondary", "colorPrimary", "colorPrimaryDark",
    "colorAccent", "nestedScrollingEnabled", "windowEnterTransition", "windowExitTransition",
    "windowSharedElementEnterTransition", "windowSharedElementExitTransition",
    "windowAllowReturnTransitionOverlap", "windowAllowEnterTransitionOverlap", "sessionService",
    "stackViewStyle", "switchStyle", "elevation", "excludeId", "excludeClass", "hideOnContentScroll",
    "actionOverflowMenuStyle", "documentLaunchMode", "maxRecents", "autoRemoveFromRecents",
    "stateListAnimator", "toId", "fromId", "reversible", "splitTrack", "targetName", "excludeName",
    "matchOrder", "windowDrawsSystemBarBackgrounds", "statusBarColor", "navigationBarColor",
    "contentInsetStart", "contentInsetEnd", "contentInsetLeft", "contentInsetRight", "paddingMode",
    "layout_rowWeight", "layout_columnWeight", "translateX", "translateY",
    "selectableItemBackgroundBorderless", "elegantTextHeight", "UNKNOWN", "UNKNOWN", "UNKNOWN",
    "windowTransitionBackgroundFadeDuration", "overlapAnchor", "progressTint", "progressTintMode",
    "progressBackgroundTint", "progressBackgroundTintMode", "secondaryProgressTint",
    "secondaryProgressTintMode", "indeterminateTint", "indeterminateTintMode", "backgroundTint",
    "backgroundTintMode", "foregroundTint", "foregroundTintMode", "buttonTint", "buttonTintMode",
    "thumbTint", "thumbTintMode", "fullBackupOnly", "propertyXName", "propertyYName",
    "relinquishTaskIdentity", "tileModeX", "tileModeY", "actionModeShareDrawable",
    "actionModeFindDrawable", "actionModeWebSearchDrawable", "transitionVisibilityMode",
    "minimumHorizontalAngle", "minimumVerticalAngle", "maximumAngle", "searchViewStyle", "closeIcon",
    "goIcon", "searchIcon", "voiceIcon", "commitIcon", "suggestionRowLayout", "queryBackground",
    "submitBackground", "buttonBarPositiveButtonStyle", "buttonBarNeutralButtonStyle",
    "buttonBarNegativeButtonStyle", "popupElevation", "actionBarPopupTheme", "multiArch",
    "touchscreenBlocksFocus", "windowElevation", "launchTaskBehindTargetAnimation",
    "launchTaskBehindSourceAnimation", "restrictionType", "dayOfWeekBackground", "dayOfWeekTextAppearance",
    "headerMonthTextAppearance", "headerDayOfMonthTextAppearance", "headerYearTextAppearance",
    "yearListItemTextAppearance", "yearListSelectorColor", "calendarTextColor", "recognitionService",
    "timePickerStyle", "timePickerDialogTheme", "headerTimeTextAppearance", "headerAmPmTextAppearance",
    "numbersTextColor", "numbersBackgroundColor", "numbersSelectorColor", "amPmTextColor",
    "amPmBackgroundColor", "UNKNOWN", "checkMarkTint", "checkMarkTintMode", "popupTheme", "toolbarStyle",
    "windowClipToOutline", "datePickerDialogTheme", "showText", "windowReturnTransition",
    "windowReenterTransition", "windowSharedElementReturnTransition",
    "windowSharedElementReenterTransition", "resumeWhilePausing", "datePickerMode", "timePickerMode",
    "inset", "letterSpacing", "fontFeatureSettings", "outlineProvider", "contentAgeHint", "country",
    "windowSharedElementsUseOverlay", "reparent", "reparentWithOverlay", "ambientShadowAlpha",
    "spotShadowAlpha", "navigationIcon", "navigationContentDescription", "fragmentExitTransition",
    "fragmentEnterTransition", "fragmentSharedElementEnterTransition", "fragmentReturnTransition",
    "fragmentSharedElementReturnTransition", "fragmentReenterTransition",
    "fragmentAllowEnterTransitionOverlap", "fragmentAllowReturnTransitionOverlap", "patternPathData",
    "strokeAlpha", "fillAlpha", "windowActivityTransitions", "colorEdgeEffect", "resizeClip",
    "collapseContentDescription", "accessibilityTraversalBefore", "accessibilityTraversalAfter",
    "dialogPreferredPadding", "searchHintIcon", "revisionCode", "drawableTint", "drawableTintMode",
    "fraction", "trackTint", "trackTintMode", "start", "end", "breakStrategy", "hyphenationFrequency",
    "allowUndo", "windowLightStatusBar", "numbersInnerTextColor", "colorBackgroundFloating",
    "titleTextColor", "subtitleTextColor", "thumbPosition", "scrollIndicators", "contextClickable",
    "fingerprintAuthDrawable", "logoDescription", "extractNativeLibs", "fullBackupContent",
    "usesCleartextTraffic", "lockTaskMode", "autoVerify", "showForAllUsers", "supportsAssist",
    "supportsLaunchVoiceAssistFromKeyguard", "listMenuViewStyle", "subMenuArrow", "defaultWidth",
    "defaultHeight", "resizeableActivity", "supportsPictureInPicture", "titleMargin", "titleMarginStart",
    "titleMarginEnd", "titleMarginTop", "titleMarginBottom", "maxButtonHeight", "buttonGravity",
    "collapseIcon", "level", "contextPopupMenuStyle", "textAppearancePopupMenuHeader",
    "windowBackgroundFallback", "defaultToDeviceProtectedStorage", "directBootAware",
    "preferenceFragmentStyle", "canControlMagnification", "languageTag", "pointerIcon", "tickMark",
    "tickMarkTint", "tickMarkTintMode", "canPerformGestures", "externalService",
    "supportsLocalInteraction", "startX", "startY", "endX", "endY", "offset", "use32bitAbi", "bitmap",
    "hotSpotX", "hotSpotY", "version", "backupInForeground", "countDown", "canRecord", "tunerCount",
    "fillType", "popupEnterTransition", "popupExitTransition", "forceHasOverlappingRendering",
    "contentInsetStartWithNavigation", "contentInsetEndWithActions", "numberPickerStyle", "enableVrMode",
    "UNKNOWN", "networkSecurityConfig", "shortcutId", "shortcutShortLabel", "shortcutLongLabel",
    "shortcutDisabledMessage", "roundIcon", "contextUri", "contextDescription", "showMetadataInPreview",
    "colorSecondary"
  ];
}