// This is a generated file - do not edit.
//
// Generated from options.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Options_Theme extends $pb.ProtobufEnum {
  static const Options_Theme SYSTEM =
      Options_Theme._(0, _omitEnumNames ? '' : 'SYSTEM');
  static const Options_Theme LIGHT =
      Options_Theme._(1, _omitEnumNames ? '' : 'LIGHT');
  static const Options_Theme DARK =
      Options_Theme._(2, _omitEnumNames ? '' : 'DARK');

  static const $core.List<Options_Theme> values = <Options_Theme>[
    SYSTEM,
    LIGHT,
    DARK,
  ];

  static final $core.List<Options_Theme?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Options_Theme? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Options_Theme._(super.value, super.name);
}

class Options_IconShape extends $pb.ProtobufEnum {
  static const Options_IconShape SQUIRCLE =
      Options_IconShape._(0, _omitEnumNames ? '' : 'SQUIRCLE');
  static const Options_IconShape CIRCLE =
      Options_IconShape._(1, _omitEnumNames ? '' : 'CIRCLE');
  static const Options_IconShape ROUNDED_SQUARE =
      Options_IconShape._(2, _omitEnumNames ? '' : 'ROUNDED_SQUARE');

  static const $core.List<Options_IconShape> values = <Options_IconShape>[
    SQUIRCLE,
    CIRCLE,
    ROUNDED_SQUARE,
  ];

  static final $core.List<Options_IconShape?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Options_IconShape? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Options_IconShape._(super.value, super.name);
}

class Options_Mica extends $pb.ProtobufEnum {
  static const Options_Mica FULL =
      Options_Mica._(0, _omitEnumNames ? '' : 'FULL');
  static const Options_Mica PARTIAL =
      Options_Mica._(1, _omitEnumNames ? '' : 'PARTIAL');
  static const Options_Mica DISABLED =
      Options_Mica._(2, _omitEnumNames ? '' : 'DISABLED');

  static const $core.List<Options_Mica> values = <Options_Mica>[
    FULL,
    PARTIAL,
    DISABLED,
  ];

  static final $core.List<Options_Mica?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static Options_Mica? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Options_Mica._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
