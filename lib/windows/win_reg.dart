// ignore_for_file: constant_identifier_names, non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'dart:developer';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

const _MAX_ITEMLENGTH = 1024;
const ERROR_FILE_NOT_FOUND = 2;

extension WinRegStringExtension on String {
  static final RegExp _KEY_PATH_NORMALIZER = RegExp(r'[\\]*(.*)');
  String? get normalizedRegKey => _KEY_PATH_NORMALIZER.firstMatch(this)?.group(1);
}

enum RegHKey {
  HKEY_CLASSES_ROOT, HKEY_CURRENT_USER, HKEY_LOCAL_MACHINE, HKEY_USERS, HKEY_PERFORMANCE_DATA, HKEY_PERFORMANCE_TEXT,
  HKEY_PERFORMANCE_NLSTEXT, HKEY_CURRENT_CONFIG, HKEY_DYN_DATA, HKEY_CURRENT_USER_LOCAL_SETTINGS
}

extension on RegHKey {
  int get value {switch(this) {
    case RegHKey.HKEY_CLASSES_ROOT: return HKEY_CLASSES_ROOT;
    case RegHKey.HKEY_CURRENT_USER: return HKEY_CURRENT_USER;
    case RegHKey.HKEY_LOCAL_MACHINE: return HKEY_LOCAL_MACHINE;
    case RegHKey.HKEY_USERS: return HKEY_USERS;
    case RegHKey.HKEY_PERFORMANCE_DATA: return HKEY_PERFORMANCE_DATA;
    case RegHKey.HKEY_PERFORMANCE_TEXT: return HKEY_PERFORMANCE_TEXT;
    case RegHKey.HKEY_PERFORMANCE_NLSTEXT: return HKEY_PERFORMANCE_NLSTEXT;
    case RegHKey.HKEY_CURRENT_CONFIG: return HKEY_CURRENT_CONFIG;
    case RegHKey.HKEY_DYN_DATA: return HKEY_DYN_DATA;
    case RegHKey.HKEY_CURRENT_USER_LOCAL_SETTINGS: return HKEY_CURRENT_USER_LOCAL_SETTINGS;
  }}
}

class RegistryKeyValuePair {
  final String key;
  final String value;
  const RegistryKeyValuePair(this.key, this.value);
}

class RegValue {
  RegValue._create(this.type, this.value);
  String value;
  int type;
}

class WinReg {
  static RegValue? getString(RegHKey hKey, String keyPath, String? valName, {bool noExpand = false}) {
    String? keyPathN = keyPath.normalizedRegKey;
    if (keyPathN == null) return null;

    final lpKey = keyPathN.toNativeUtf16();
    final lpValue = (valName != null && valName.isNotEmpty) ? valName.toNativeUtf16() : nullptr;
    final lpType = calloc<DWORD>();
    final lpData = calloc<BYTE>(_MAX_ITEMLENGTH);
    final lpcbData = calloc<DWORD>()..value = _MAX_ITEMLENGTH;

    int flags = RRF_RT_ANY;
    if (noExpand) flags |= RRF_NOEXPAND;

    try {
      final status = RegGetValue(hKey.value, lpKey, lpValue, flags, lpType, lpData.cast(), lpcbData);

      switch (status) {
        case ERROR_SUCCESS:
          int type = lpType.value;
          if (type != REG_SZ && type != REG_EXPAND_SZ && type != REG_MULTI_SZ) {
            log('win_reg: Non-string content; type: $type');
            return null;
          }
          return RegValue._create(type, lpData.cast<Utf16>().toDartString());

        case ERROR_MORE_DATA:
          log('win_reg: An item required more than $_MAX_ITEMLENGTH bytes');
          return null;

        case ERROR_NO_MORE_ITEMS:
          return null;
        case ERROR_FILE_NOT_FOUND:
          log("Reg path not found: ${hKey.name}\\$keyPath, Value Name: $valName");
          return null;

        default:
          log('win_reg: Unknown error $status');
          return null;
      }
    } finally {
      calloc.free(lpKey);
      if (lpValue != nullptr) calloc.free(lpValue);
      calloc.free(lpType);
      calloc.free(lpData);
      calloc.free(lpcbData);
    }
  }

  static int? openKeyLp(RegHKey hKey, Pointer<Utf16> lpKeyPath) {
    Pointer<HKEY> lpKey = calloc<HKEY>();
    try {
      int result = RegOpenKeyEx(hKey.value, lpKeyPath, 0, KEY_READ, lpKey);
      return result == ERROR_SUCCESS ? lpKey.value : null;
    } finally {
      calloc.free(lpKey);
    }
  }

  static int? openKey(RegHKey hKey, String keyPath) {
    String? keyPathN = keyPath.normalizedRegKey;
    if (keyPathN == null) return null;
    final lpKeyPath = keyPathN.toNativeUtf16();

    try {
      return openKeyLp(hKey, lpKeyPath);
    } finally {
      calloc.free(lpKeyPath);
    }
  }

  static List<String> listSubkeys(int key, [int? knownSize]) {
    int actualSize = knownSize != null ? knownSize + 1 : MAX_PATH;
    LPWSTR subkeyName = calloc<WCHAR>(actualSize).cast<Utf16>();
    Pointer<Uint32> subkeyNameSize = calloc<Uint32>()..value = actualSize;

    try {
      return [...() sync* {for (int i = 0;;i++) {
        int result = RegEnumKeyEx(key, i, subkeyName, subkeyNameSize, nullptr, nullptr, nullptr, nullptr);
        if (result == ERROR_NO_MORE_ITEMS) break;  
        else if (result != ERROR_SUCCESS) {
          log("Failed to enumerate subkey. Error code: $result");
          continue;
        }
        subkeyNameSize.value = actualSize;
        yield subkeyName.toDartString();
      }}()];
    }
    finally {
      calloc.free(subkeyNameSize);
      calloc.free(subkeyName);
    }
  }
}
