// This is a generated file - do not edit.
//
// Generated from manifest_xapk.proto.

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

@$core.Deprecated('Use manifestXapkDescriptor instead')
const ManifestXapk$json = {
  '1': 'ManifestXapk',
  '2': [
    {
      '1': 'xapk_version',
      '3': 1,
      '4': 1,
      '5': 13,
      '7': '1',
      '10': 'xapkVersion'
    },
    {'1': 'package_name', '3': 2, '4': 1, '5': 9, '10': 'packageName'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'locales_name',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.proto.ManifestXapk.LocalesNameEntry',
      '10': 'localesName'
    },
    {'1': 'version_code', '3': 5, '4': 1, '5': 13, '10': 'versionCode'},
    {'1': 'version_name', '3': 6, '4': 1, '5': 9, '10': 'versionName'},
    {'1': 'min_sdk_version', '3': 7, '4': 1, '5': 13, '10': 'minSdkVersion'},
    {
      '1': 'target_sdk_version',
      '3': 8,
      '4': 1,
      '5': 13,
      '10': 'targetSdkVersion'
    },
    {'1': 'permissions', '3': 9, '4': 3, '5': 9, '10': 'permissions'},
    {'1': 'split_configs', '3': 10, '4': 3, '5': 9, '10': 'splitConfigs'},
    {'1': 'total_size', '3': 11, '4': 1, '5': 13, '10': 'totalSize'},
    {'1': 'icon', '3': 12, '4': 1, '5': 9, '10': 'icon'},
    {
      '1': 'split_apks',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.proto.ManifestXapk.ApkFile',
      '10': 'splitApks'
    },
    {
      '1': 'expansions',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.proto.ManifestXapk.ApkExpansion',
      '10': 'expansions'
    },
  ],
  '3': [
    ManifestXapk_LocalesNameEntry$json,
    ManifestXapk_ApkFile$json,
    ManifestXapk_ApkExpansion$json
  ],
  '4': [ManifestXapk_InstallDir$json],
};

@$core.Deprecated('Use manifestXapkDescriptor instead')
const ManifestXapk_LocalesNameEntry$json = {
  '1': 'LocalesNameEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use manifestXapkDescriptor instead')
const ManifestXapk_ApkFile$json = {
  '1': 'ApkFile',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'file', '3': 2, '4': 1, '5': 9, '10': 'file'},
  ],
};

@$core.Deprecated('Use manifestXapkDescriptor instead')
const ManifestXapk_ApkExpansion$json = {
  '1': 'ApkExpansion',
  '2': [
    {
      '1': 'install_location',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.proto.ManifestXapk.InstallDir',
      '10': 'installLocation'
    },
    {'1': 'file', '3': 2, '4': 1, '5': 9, '10': 'file'},
    {'1': 'install_path', '3': 3, '4': 1, '5': 9, '10': 'installPath'},
  ],
};

@$core.Deprecated('Use manifestXapkDescriptor instead')
const ManifestXapk_InstallDir$json = {
  '1': 'InstallDir',
  '2': [
    {'1': 'EXTERNAL_STORAGE', '2': 0},
    {'1': 'INTERNAL_STORAGE', '2': 1},
  ],
};

/// Descriptor for `ManifestXapk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List manifestXapkDescriptor = $convert.base64Decode(
    'CgxNYW5pZmVzdFhhcGsSJAoMeGFwa192ZXJzaW9uGAEgASgNOgExUgt4YXBrVmVyc2lvbhIhCg'
    'xwYWNrYWdlX25hbWUYAiABKAlSC3BhY2thZ2VOYW1lEhIKBG5hbWUYAyABKAlSBG5hbWUSRwoM'
    'bG9jYWxlc19uYW1lGAQgAygLMiQucHJvdG8uTWFuaWZlc3RYYXBrLkxvY2FsZXNOYW1lRW50cn'
    'lSC2xvY2FsZXNOYW1lEiEKDHZlcnNpb25fY29kZRgFIAEoDVILdmVyc2lvbkNvZGUSIQoMdmVy'
    'c2lvbl9uYW1lGAYgASgJUgt2ZXJzaW9uTmFtZRImCg9taW5fc2RrX3ZlcnNpb24YByABKA1SDW'
    '1pblNka1ZlcnNpb24SLAoSdGFyZ2V0X3Nka192ZXJzaW9uGAggASgNUhB0YXJnZXRTZGtWZXJz'
    'aW9uEiAKC3Blcm1pc3Npb25zGAkgAygJUgtwZXJtaXNzaW9ucxIjCg1zcGxpdF9jb25maWdzGA'
    'ogAygJUgxzcGxpdENvbmZpZ3MSHQoKdG90YWxfc2l6ZRgLIAEoDVIJdG90YWxTaXplEhIKBGlj'
    'b24YDCABKAlSBGljb24SOgoKc3BsaXRfYXBrcxgNIAMoCzIbLnByb3RvLk1hbmlmZXN0WGFway'
    '5BcGtGaWxlUglzcGxpdEFwa3MSQAoKZXhwYW5zaW9ucxgOIAMoCzIgLnByb3RvLk1hbmlmZXN0'
    'WGFway5BcGtFeHBhbnNpb25SCmV4cGFuc2lvbnMaPgoQTG9jYWxlc05hbWVFbnRyeRIQCgNrZX'
    'kYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgBGi0KB0Fwa0ZpbGUSDgoCaWQY'
    'ASABKAlSAmlkEhIKBGZpbGUYAiABKAlSBGZpbGUakAEKDEFwa0V4cGFuc2lvbhJJChBpbnN0YW'
    'xsX2xvY2F0aW9uGAEgASgOMh4ucHJvdG8uTWFuaWZlc3RYYXBrLkluc3RhbGxEaXJSD2luc3Rh'
    'bGxMb2NhdGlvbhISCgRmaWxlGAIgASgJUgRmaWxlEiEKDGluc3RhbGxfcGF0aBgDIAEoCVILaW'
    '5zdGFsbFBhdGgiOAoKSW5zdGFsbERpchIUChBFWFRFUk5BTF9TVE9SQUdFEAASFAoQSU5URVJO'
    'QUxfU1RPUkFHRRAB');
