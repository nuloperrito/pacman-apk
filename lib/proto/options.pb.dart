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

import 'options.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'options.pbenum.dart';

class Options extends $pb.GeneratedMessage {
  factory Options({
    $core.int? ipAddress,
    $core.int? port,
    Options_Theme? theme,
    $core.bool? legacyIcons,
    $core.bool? systemAccent,
    Options_IconShape? iconShape,
    Options_Mica? mica,
    $core.bool? autostart,
    $core.int? locale,
    $core.int? timeout,
  }) {
    final result = create();
    if (ipAddress != null) result.ipAddress = ipAddress;
    if (port != null) result.port = port;
    if (theme != null) result.theme = theme;
    if (legacyIcons != null) result.legacyIcons = legacyIcons;
    if (systemAccent != null) result.systemAccent = systemAccent;
    if (iconShape != null) result.iconShape = iconShape;
    if (mica != null) result.mica = mica;
    if (autostart != null) result.autostart = autostart;
    if (locale != null) result.locale = locale;
    if (timeout != null) result.timeout = timeout;
    return result;
  }

  Options._();

  factory Options.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Options.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Options',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'ipAddress',
        protoName: 'ipAddress',
        fieldType: $pb.PbFieldType.OU3,
        defaultOrMaker: 2130706433)
    ..aI(2, _omitFieldNames ? '' : 'port',
        fieldType: $pb.PbFieldType.OU3, defaultOrMaker: 58526)
    ..aE<Options_Theme>(3, _omitFieldNames ? '' : 'theme',
        enumValues: Options_Theme.values)
    ..aOB(4, _omitFieldNames ? '' : 'legacyIcons', protoName: 'legacyIcons')
    ..aOB(5, _omitFieldNames ? '' : 'systemAccent', protoName: 'systemAccent')
    ..aE<Options_IconShape>(6, _omitFieldNames ? '' : 'iconShape',
        protoName: 'iconShape', enumValues: Options_IconShape.values)
    ..aE<Options_Mica>(7, _omitFieldNames ? '' : 'mica',
        defaultOrMaker: Options_Mica.FULL, enumValues: Options_Mica.values)
    ..aOB(8, _omitFieldNames ? '' : 'autostart')
    ..aI(9, _omitFieldNames ? '' : 'locale', fieldType: $pb.PbFieldType.OU3)
    ..aI(10, _omitFieldNames ? '' : 'timeout',
        fieldType: $pb.PbFieldType.OU3, defaultOrMaker: 90)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Options clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Options copyWith(void Function(Options) updates) =>
      super.copyWith((message) => updates(message as Options)) as Options;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Options create() => Options._();
  @$core.override
  Options createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Options getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Options>(create);
  static Options? _defaultInstance;

  /// App options
  @$pb.TagNumber(1)
  $core.int get ipAddress => $_getI(0, 2130706433);
  @$pb.TagNumber(1)
  set ipAddress($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIpAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearIpAddress() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getI(1, 58526);
  @$pb.TagNumber(2)
  set port($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => $_clearField(2);

  /// Theme options
  @$pb.TagNumber(3)
  Options_Theme get theme => $_getN(2);
  @$pb.TagNumber(3)
  set theme(Options_Theme value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTheme() => $_has(2);
  @$pb.TagNumber(3)
  void clearTheme() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get legacyIcons => $_getBF(3);
  @$pb.TagNumber(4)
  set legacyIcons($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLegacyIcons() => $_has(3);
  @$pb.TagNumber(4)
  void clearLegacyIcons() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.bool get systemAccent => $_getBF(4);
  @$pb.TagNumber(5)
  set systemAccent($core.bool value) => $_setBool(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSystemAccent() => $_has(4);
  @$pb.TagNumber(5)
  void clearSystemAccent() => $_clearField(5);

  @$pb.TagNumber(6)
  Options_IconShape get iconShape => $_getN(5);
  @$pb.TagNumber(6)
  set iconShape(Options_IconShape value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasIconShape() => $_has(5);
  @$pb.TagNumber(6)
  void clearIconShape() => $_clearField(6);

  @$pb.TagNumber(7)
  Options_Mica get mica => $_getN(6);
  @$pb.TagNumber(7)
  set mica(Options_Mica value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasMica() => $_has(6);
  @$pb.TagNumber(7)
  void clearMica() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get autostart => $_getBF(7);
  @$pb.TagNumber(8)
  set autostart($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAutostart() => $_has(7);
  @$pb.TagNumber(8)
  void clearAutostart() => $_clearField(8);

  /// Interface options
  @$pb.TagNumber(9)
  $core.int get locale => $_getIZ(8);
  @$pb.TagNumber(9)
  set locale($core.int value) => $_setUnsignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasLocale() => $_has(8);
  @$pb.TagNumber(9)
  void clearLocale() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get timeout => $_getI(9, 90);
  @$pb.TagNumber(10)
  set timeout($core.int value) => $_setUnsignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTimeout() => $_has(9);
  @$pb.TagNumber(10)
  void clearTimeout() => $_clearField(10);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
