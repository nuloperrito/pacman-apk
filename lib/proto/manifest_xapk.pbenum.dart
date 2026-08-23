// This is a generated file - do not edit.
//
// Generated from manifest_xapk.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ManifestXapk_InstallDir extends $pb.ProtobufEnum {
  static const ManifestXapk_InstallDir EXTERNAL_STORAGE =
      ManifestXapk_InstallDir._(0, _omitEnumNames ? '' : 'EXTERNAL_STORAGE');
  static const ManifestXapk_InstallDir INTERNAL_STORAGE =
      ManifestXapk_InstallDir._(1, _omitEnumNames ? '' : 'INTERNAL_STORAGE');

  static const $core.List<ManifestXapk_InstallDir> values =
      <ManifestXapk_InstallDir>[
    EXTERNAL_STORAGE,
    INTERNAL_STORAGE,
  ];

  static final $core.List<ManifestXapk_InstallDir?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static ManifestXapk_InstallDir? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ManifestXapk_InstallDir._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
