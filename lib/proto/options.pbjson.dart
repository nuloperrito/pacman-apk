// This is a generated file - do not edit.
//
// Generated from options.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use optionsDescriptor instead')
const Options$json = {
  '1': 'Options',
  '2': [
    {
      '1': 'ipAddress',
      '3': 1,
      '4': 1,
      '5': 13,
      '7': '2130706433',
      '10': 'ipAddress'
    },
    {'1': 'port', '3': 2, '4': 1, '5': 13, '7': '58526', '10': 'port'},
    {'1': 'autostart', '3': 8, '4': 1, '5': 8, '10': 'autostart'},
    {'1': 'timeout', '3': 10, '4': 1, '5': 13, '7': '90', '10': 'timeout'},
    {'1': 'locale', '3': 9, '4': 1, '5': 13, '10': 'locale'},
    {
      '1': 'theme',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.proto.Options.Theme',
      '10': 'theme'
    },
    {'1': 'legacyIcons', '3': 4, '4': 1, '5': 8, '10': 'legacyIcons'},
    {'1': 'systemAccent', '3': 5, '4': 1, '5': 8, '10': 'systemAccent'},
    {
      '1': 'iconShape',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.proto.Options.IconShape',
      '10': 'iconShape'
    },
    {
      '1': 'mica',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.proto.Options.Mica',
      '7': 'FULL',
      '10': 'mica'
    },
  ],
  '4': [Options_Theme$json, Options_IconShape$json, Options_Mica$json],
};

@$core.Deprecated('Use optionsDescriptor instead')
const Options_Theme$json = {
  '1': 'Theme',
  '2': [
    {'1': 'SYSTEM', '2': 0},
    {'1': 'LIGHT', '2': 1},
    {'1': 'DARK', '2': 2},
  ],
};

@$core.Deprecated('Use optionsDescriptor instead')
const Options_IconShape$json = {
  '1': 'IconShape',
  '2': [
    {'1': 'SQUIRCLE', '2': 0},
    {'1': 'CIRCLE', '2': 1},
    {'1': 'ROUNDED_SQUARE', '2': 2},
  ],
};

@$core.Deprecated('Use optionsDescriptor instead')
const Options_Mica$json = {
  '1': 'Mica',
  '2': [
    {'1': 'FULL', '2': 0},
    {'1': 'PARTIAL', '2': 1},
    {'1': 'DISABLED', '2': 2},
  ],
};

/// Descriptor for `Options`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List optionsDescriptor = $convert.base64Decode(
    'CgdPcHRpb25zEigKCWlwQWRkcmVzcxgBIAEoDToKMjEzMDcwNjQzM1IJaXBBZGRyZXNzEhkKBH'
    'BvcnQYAiABKA06BTU4NTI2UgRwb3J0EhwKCWF1dG9zdGFydBgIIAEoCFIJYXV0b3N0YXJ0EhwK'
    'B3RpbWVvdXQYCiABKA06AjkwUgd0aW1lb3V0EhYKBmxvY2FsZRgJIAEoDVIGbG9jYWxlEioKBX'
    'RoZW1lGAMgASgOMhQucHJvdG8uT3B0aW9ucy5UaGVtZVIFdGhlbWUSIAoLbGVnYWN5SWNvbnMY'
    'BCABKAhSC2xlZ2FjeUljb25zEiIKDHN5c3RlbUFjY2VudBgFIAEoCFIMc3lzdGVtQWNjZW50Ej'
    'YKCWljb25TaGFwZRgGIAEoDjIYLnByb3RvLk9wdGlvbnMuSWNvblNoYXBlUglpY29uU2hhcGUS'
    'LQoEbWljYRgHIAEoDjITLnByb3RvLk9wdGlvbnMuTWljYToERlVMTFIEbWljYSIoCgVUaGVtZR'
    'IKCgZTWVNURU0QABIJCgVMSUdIVBABEggKBERBUksQAiI5CglJY29uU2hhcGUSDAoIU1FVSVJD'
    'TEUQABIKCgZDSVJDTEUQARISCg5ST1VOREVEX1NRVUFSRRACIisKBE1pY2ESCAoERlVMTBAAEg'
    'sKB1BBUlRJQUwQARIMCghESVNBQkxFRBAC');
