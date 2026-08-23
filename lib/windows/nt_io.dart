// ignore_for_file: camel_case_types, constant_identifier_names, non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import '../utils/misc_utils.dart';
import 'package:pacman_apk/windows/win_path.dart';

import 'win_io.dart';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

final ntdll = DynamicLibrary.open('ntdll.dll');
final advapi32 = DynamicLibrary.open('advapi32.dll');
const _ANYSYZE_ARRAY = 1;

base class UNICODE_STRING extends Struct {
  @Uint16() external int length;
  @Uint16() external int maximumLength;
  external Pointer<Utf16> buffer;
  void free() => calloc.free(buffer);
}

base class OBJECT_ATTRIBUTES extends Struct {
  @Uint32() external int length;
  @IntPtr() external int rootDirectory;
  external Pointer<UNICODE_STRING> objectName;
  @Uint32() external int attributes;
  external Pointer<Void> securityDescriptor;
  external Pointer<Void> securityQualityOfService;
}

base class REPARSE_MOUNTPOINT_DATA_BUFFER extends Struct {
  @Uint32() external int reparseTag;
  @Uint16() external int reparseDataLength;
  @Uint16() external int reserved;
  @Uint16() external int substituteNameOffset;
  @Uint16() external int substituteNameLength;
  @Uint16() external int printNameOffset;
  @Uint16() external int printNameLength;
  @Array(_ANYSYZE_ARRAY) external Array<Uint16> pathBuffer;
}

base class _TOKEN_PRIVILEGES extends Struct {
  @Uint32() external int privilegeCount;
  @Array(_ANYSYZE_ARRAY) external Array<_LUID_AND_ATTRIBUTES> privileges;
}

base class _LUID_AND_ATTRIBUTES extends Struct {
  external LUID luid;
  @Uint32() external int attributes;
}

final _NtCreateSymbolicLinkObject = ntdll.lookupFunction<
      Uint32 Function(Pointer<IntPtr> linkHandle, Uint32 desiredAccess, Pointer<OBJECT_ATTRIBUTES> objectAttributes, Pointer<UNICODE_STRING> linkTarget),
      int Function(Pointer<IntPtr> linkHandle, int desiredAccess, Pointer<OBJECT_ATTRIBUTES> objectAttributes, Pointer<UNICODE_STRING> linkTarget)>('NtCreateSymbolicLinkObject');
final _NtStatusToDosError = ntdll.lookupFunction<Uint32 Function(Int32 status), int Function(int status)>('RtlNtStatusToDosError');
final _CreateDirectoryObject = ntdll.lookupFunction<
    Uint32 Function(Pointer<IntPtr> lpHandle, Uint32 desiredAccess, Pointer<OBJECT_ATTRIBUTES> obj_attr, HANDLE shadowDirectoryHandle, Uint32 flags), 
    int Function(Pointer<IntPtr> lpHandle, int desiredAccess, Pointer<OBJECT_ATTRIBUTES> obj_attr, int shadowDirectoryHandle, int flags)>('NtCreateDirectoryObjectEx');
final _NtOpenSection = ntdll.lookupFunction<
    Uint32 Function(Pointer<IntPtr> lpHandle, Uint32 desiredAccess, Pointer<OBJECT_ATTRIBUTES> obj_attr), 
    int Function(Pointer<IntPtr> lpHandle, int desiredAccess, Pointer<OBJECT_ATTRIBUTES> obj_attr)>('NtOpenSection');

final _ProcessIdToSessionId = kernel32.lookupFunction<
    Uint32 Function(Uint32 pid, Pointer<Uint32> lpSessionId),
    int Function(int pid, Pointer<Uint32> lpSessionId)>('ProcessIdToSessionId');

final _LookupPrivilegeValue = advapi32.lookupFunction<
    Uint32 Function(LPWSTR lpSystemName, LPWSTR lpName, Pointer<LUID> lpLuid),
    int Function(LPWSTR lpSystemName, LPWSTR lpName, Pointer<LUID> lpLuid)>('LookupPrivilegeValueW');
final _AdjustTokenPrivileges = advapi32.lookupFunction<
    Uint32 Function(HANDLE tokenHandle, BOOL disableAllPrivileges, Pointer<_TOKEN_PRIVILEGES> newState, DWORD bufferLength, Pointer<_TOKEN_PRIVILEGES> previousState, Pointer<DWORD> returnLength),
    int Function(int tokenHandle, int disableAllPrivileges, Pointer<_TOKEN_PRIVILEGES> newState, int bufferLength, Pointer<_TOKEN_PRIVILEGES> previousState, Pointer<DWORD> returnLength)>('AdjustTokenPrivileges');

extension on LPWSTR {
  Pointer<UNICODE_STRING> toUnicodeString([int? knownLength]) {
    final lpUnicodeString = calloc<UNICODE_STRING>();
    final unicodeString = lpUnicodeString.ref;
    unicodeString.buffer = this;
    unicodeString.length = (knownLength ?? length) * 2; 
    unicodeString.maximumLength = unicodeString.length + 2;
    return lpUnicodeString;
  }
}

extension WinDir on Directory {
  int? toNativeDir() {
    final lpPath = absolute.path.toNativeUtf16();
    try {
      final handle = CreateFile(lpPath, GENERIC_READ, FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE, 
          nullptr, OPEN_EXISTING, FILE_FLAG_BACKUP_SEMANTICS, NULL);
      return handle != INVALID_HANDLE_VALUE ? handle : null;
    }
    finally {
      calloc.free(lpPath);
    }
  }
}

extension on String {
  static const _IO_REPARSE_TAG_MOUNT_POINT = 0xA0000003;
  
  Pointer<UNICODE_STRING> toUnicodeString({Allocator allocator = calloc}) {
    final units = codeUnits;
    final Pointer<Uint16> result = allocator<Uint16>(units.length + 1);
    final Uint16List nativeString = result.asTypedList(units.length + 1);
    nativeString.setRange(0, units.length, units);
    nativeString[units.length] = 0;
    return result.cast<Utf16>().toUnicodeString(units.length);
  }
  
  Pointer<REPARSE_MOUNTPOINT_DATA_BUFFER> toReparseMountpoint() {
    final rTargetUnits = codeUnits;
    final lpReparseBuffer = calloc.allocate<REPARSE_MOUNTPOINT_DATA_BUFFER>(sizeOf<REPARSE_MOUNTPOINT_DATA_BUFFER>() + (rTargetUnits.length + 1) * sizeOf<Uint16>());
    final reparseBuffer = lpReparseBuffer.ref;

    final Pointer<Uint16> lpTarget = lpReparseBuffer.cast<BYTE>().elementAt(16).cast<Uint16>();
    final Uint16List nativeString = lpTarget.asTypedList(rTargetUnits.length + 1);
    nativeString.setRange(0, rTargetUnits.length, rTargetUnits);
    nativeString[rTargetUnits.length] = 0;
    
    reparseBuffer.reparseTag = _IO_REPARSE_TAG_MOUNT_POINT;
    reparseBuffer.substituteNameOffset = 0;
    reparseBuffer.substituteNameLength = rTargetUnits.length * sizeOf<Uint16>();
    reparseBuffer.printNameOffset = reparseBuffer.substituteNameLength + 2;
    reparseBuffer.printNameLength = 0;
    reparseBuffer.reparseDataLength = reparseBuffer.substituteNameLength + 12; 
    
    return lpReparseBuffer;
  }
}

extension DOSUnicodeStringPtrUtils on Pointer<UNICODE_STRING> {
  void free() {
    ref.free();
    calloc.free(this);
  }
}

class NtIO {
  static const _REPARSE_MOUNTPOINT_HEADER_SIZE = 8;

  static const DDD_NO_BROADCAST_SYSTEM = 0x00000008;
  static const DDD_RAW_TARGET_PATH = 0x00000001;
  static const DDD_REMOVE_DEFINITION = 0x00000002;
  static const DIRECTORY_ALL_ACCESS = STANDARD_RIGHTS_REQUIRED | 0xF;
  static const OBJ_CASE_INSENSITIVE = 0x00000040;
  static const SYMBOLIC_LINK_ALL_ACCESS = STANDARD_RIGHTS_REQUIRED | 0x1;

  static late final NT_TEMP_DIR_NAME = Directory(WinPath.tempSubdir).createTempSync("pacman-apk-DOS@$pid@").basename;
  static late final String? _DOS_DIRECTORY = (){
    String dirName = "\\BaseNamedObjects\\$NT_TEMP_DIR_NAME";
    return createNativeDirectory(dirName) != null ? dirName : null;
  }();
  
  static const _SE_PRIVILEGE_ENABLED = 0x00000002;
  static late final _SE_RESTORE_NAME = TEXT("SeRestorePrivilege");
  static late final _SE_BACKUP_NAME = TEXT("SeBackupPrivilege");

  static late final int? _NT_JUNCTION_HANDLE = (_DOS_DIRECTORY != null) ? createJunction(_DOS_DIRECTORY!, "${WinPath.tempSubdir}\\$NT_TEMP_DIR_NAME", true) : null;

  static int? _SESSION_ID;
  static late final int? SESSION_ID = () {
    if (_SESSION_ID == null) {
      Pointer<Uint32> lpSID  = calloc<Uint32>();
      try {
        int result = _ProcessIdToSessionId(pid, lpSID);
        return result != 0 ? (_SESSION_ID = lpSID.value) : null;
      } finally {
        calloc.free(lpSID);
      }
    } else return _SESSION_ID;
  }();

  static String? createTempShortcut(String target, String shortcutName) {
    String? directory = _DOS_DIRECTORY;
    if (directory != null) {
      NtIO.createNativeSymlink(0, "\\??\\$target", "$_DOS_DIRECTORY\\$shortcutName");
      _NT_JUNCTION_HANDLE;
      return "$NT_TEMP_DIR_NAME\\$shortcutName";
    }
    return null;
  }

  static void deleteNtTempDirJunction() => (_NT_JUNCTION_HANDLE != null) ? CloseHandle(_NT_JUNCTION_HANDLE!) != 0 : false;
  
  static int? openDirectory(String path, bool bReadWrite, [bool deleteOnClose = false]) {
    final lpToken = calloc<HANDLE>();
    final pszPath = path.toNativeUtf16();
    final lpTp = calloc<_TOKEN_PRIVILEGES>();
    final tp = lpTp.ref;
    
    try {
      OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES, lpToken);
      _LookupPrivilegeValue(nullptr, bReadWrite ? _SE_RESTORE_NAME : _SE_BACKUP_NAME, lpTp.cast<DWORD>().elementAt(1).cast<LUID>());
      tp.privilegeCount = 1;
      tp.privileges[0].attributes = _SE_PRIVILEGE_ENABLED;
      final hToken = lpToken.value;
      _AdjustTokenPrivileges(hToken, FALSE, lpTp, sizeOf<_TOKEN_PRIVILEGES>(), nullptr, nullptr);
      CloseHandle(hToken);

      int dwAccess = bReadWrite ? (GENERIC_READ | GENERIC_WRITE) : GENERIC_READ;
      int hDir = CreateFile(pszPath, dwAccess, 0, nullptr, OPEN_EXISTING, FILE_FLAG_OPEN_REPARSE_POINT | FILE_FLAG_BACKUP_SEMANTICS | (deleteOnClose ? FILE_FLAG_DELETE_ON_CLOSE : 0), 0);
      return hDir != INVALID_HANDLE_VALUE ? hDir : null;
    }
    finally {
      calloc.free(lpToken);
      calloc.free(pszPath);
      calloc.free(lpTp);
    }
  }

  static int? createJunction(String targetDir, String symlinkDir, [bool deleteOnClose = true]) {
    final lpReparseBuffer = targetDir.toReparseMountpoint();
    int? dirHandle = openDirectory(symlinkDir, true, deleteOnClose);
    final lpBytesReturned = calloc<Uint32>();
    try {
      int result = dirHandle != null ? DeviceIoControl(dirHandle, FSCTL_SET_REPARSE_POINT, lpReparseBuffer.cast(),
            lpReparseBuffer.ref.reparseDataLength + _REPARSE_MOUNTPOINT_HEADER_SIZE, nullptr, 0, lpBytesReturned, nullptr) : 0;
      if (result == 0) log("\x1B[91mJunction point creation failed: ${getMessageDOS(GetLastError())}");
      if (result == 0 && dirHandle != null && deleteOnClose) CloseHandle(dirHandle);
      return result != 0 ? dirHandle : null;
    }
    finally {
      calloc.free(lpReparseBuffer);
      calloc.free(lpBytesReturned);
    }
  }

  static bool createJunctionPerm(String targetDir, String symlinkDir) {
    int? handle = createJunction(targetDir, symlinkDir, false);
    if (handle != null) CloseHandle(handle);
    return handle != null;
  }

  static Pointer<OBJECT_ATTRIBUTES> _InitializeObjectAttributes(Pointer<UNICODE_STRING> name, int flags, int rootDirHandle, Pointer<Void> securityDescriptor) {
    final lpAttributes = calloc<OBJECT_ATTRIBUTES>();
    final attributes = lpAttributes.ref;
    attributes.length = sizeOf<OBJECT_ATTRIBUTES>();
    attributes.objectName = name;
    attributes.attributes = flags;
    attributes.rootDirectory = rootDirHandle;
    attributes.securityDescriptor = securityDescriptor;
    attributes.securityQualityOfService = nullptr;
    return lpAttributes;
  }

  static String getMessageNt(int code) => getMessageDOS(_NtStatusToDosError(code));

  static String getMessageDOS(int code) {
    const _FORMAT_MESSAGE_ALLOCATE_BUFFER = 0x00000100;
    const LANGID_EN = 0x0409;
    final lpLpBuffer = calloc<Pointer<Utf16>>();
    try {
      int result = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM | FORMAT_MESSAGE_IGNORE_INSERTS | FORMAT_MESSAGE_ARGUMENT_ARRAY | _FORMAT_MESSAGE_ALLOCATE_BUFFER, nullptr, code, LANGID_EN, lpLpBuffer.cast(), 1024, nullptr);
      return result != ERROR_MORE_DATA ? result != 0 ? lpLpBuffer.value.toDartString().replaceFirst(RegExp(r'\.?[\n\s]*$'), '') : "Unknown error" : "Error message too long";
    }
    finally {
      if (lpLpBuffer.value != nullptr) {
        LocalFree(lpLpBuffer.value.cast());
      }
      calloc.free(lpLpBuffer);
    }
  }

  static int? createNativeDirectory(String nativePath) {
    final objectName = nativePath.toUnicodeString();
    final objAttrs = _InitializeObjectAttributes(objectName, OBJ_CASE_INSENSITIVE, 0, nullptr);
    final lpHandle = calloc<IntPtr>();
    try {
      int result = _CreateDirectoryObject(lpHandle, DIRECTORY_ALL_ACCESS, objAttrs, 0, 0);
      if (result != 0) {
        log("\x1B[91mNative directory creation failed: ${getMessageNt(result)}", level: 1000);
        return null;
      }
      else return lpHandle.value;
    }
    finally {
      objectName.free();
      calloc.free(objAttrs);
      calloc.free(lpHandle);
    }
  }

  static bool openSection(String nativePath, [bool logErrors = true]) {
    final objectName = nativePath.toUnicodeString();
    final objAttrs = _InitializeObjectAttributes(objectName, OBJ_CASE_INSENSITIVE, 0, nullptr);
    final lpHandle = calloc<IntPtr>();
    try {
      int result = _NtOpenSection(lpHandle, GENERIC_READ, objAttrs);
      if (result != 0) {
        if (logErrors) log("\x1B[91mFailed to open section in object manager: ${getMessageNt(result)}", level: 1000);
        return false;
      }
      else {
        CloseHandle(lpHandle.value);
        return true;
      }
    }
    finally {
      objectName.free();
      calloc.free(objAttrs);
      calloc.free(lpHandle);
    }
  }

  static int? createNativeSymlink(int rootDirHandle, String target, String symlink) {
    final lpTarget = target.toUnicodeString();
    final lpSymlink = symlink.toUnicodeString();
    final attributes = _InitializeObjectAttributes(lpSymlink, OBJ_CASE_INSENSITIVE, rootDirHandle, nullptr);
    final lpHandle = calloc<IntPtr>();
    try {
      int result = _NtCreateSymbolicLinkObject(lpHandle, SYMBOLIC_LINK_ALL_ACCESS, attributes, lpTarget);
      if (result != 0) {
        log("\x1B[91mNative symlink creation failed: ${getMessageNt(result)}", level: 1000);
        return null;
      }
      else return lpHandle.value;
    }
    finally {
      lpTarget.free();
      lpSymlink.free();
      calloc.free(attributes);
      calloc.free(lpHandle);
    }
  }
}