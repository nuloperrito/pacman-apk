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

import 'manifest_xapk.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'manifest_xapk.pbenum.dart';

class ManifestXapk_ApkFile extends $pb.GeneratedMessage {
  factory ManifestXapk_ApkFile({
    $core.String? id,
    $core.String? file,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (file != null) result.file = file;
    return result;
  }

  ManifestXapk_ApkFile._();

  factory ManifestXapk_ApkFile.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ManifestXapk_ApkFile.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ManifestXapk.ApkFile',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'file')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ManifestXapk_ApkFile clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ManifestXapk_ApkFile copyWith(void Function(ManifestXapk_ApkFile) updates) =>
      super.copyWith((message) => updates(message as ManifestXapk_ApkFile))
          as ManifestXapk_ApkFile;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ManifestXapk_ApkFile create() => ManifestXapk_ApkFile._();
  @$core.override
  ManifestXapk_ApkFile createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ManifestXapk_ApkFile getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ManifestXapk_ApkFile>(create);
  static ManifestXapk_ApkFile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get file => $_getSZ(1);
  @$pb.TagNumber(2)
  set file($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFile() => $_has(1);
  @$pb.TagNumber(2)
  void clearFile() => $_clearField(2);
}

class ManifestXapk_ApkExpansion extends $pb.GeneratedMessage {
  factory ManifestXapk_ApkExpansion({
    ManifestXapk_InstallDir? installLocation,
    $core.String? file,
    $core.String? installPath,
  }) {
    final result = create();
    if (installLocation != null) result.installLocation = installLocation;
    if (file != null) result.file = file;
    if (installPath != null) result.installPath = installPath;
    return result;
  }

  ManifestXapk_ApkExpansion._();

  factory ManifestXapk_ApkExpansion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ManifestXapk_ApkExpansion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ManifestXapk.ApkExpansion',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aE<ManifestXapk_InstallDir>(1, _omitFieldNames ? '' : 'installLocation',
        enumValues: ManifestXapk_InstallDir.values)
    ..aOS(2, _omitFieldNames ? '' : 'file')
    ..aOS(3, _omitFieldNames ? '' : 'installPath')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ManifestXapk_ApkExpansion clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ManifestXapk_ApkExpansion copyWith(
          void Function(ManifestXapk_ApkExpansion) updates) =>
      super.copyWith((message) => updates(message as ManifestXapk_ApkExpansion))
          as ManifestXapk_ApkExpansion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ManifestXapk_ApkExpansion create() => ManifestXapk_ApkExpansion._();
  @$core.override
  ManifestXapk_ApkExpansion createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ManifestXapk_ApkExpansion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ManifestXapk_ApkExpansion>(create);
  static ManifestXapk_ApkExpansion? _defaultInstance;

  @$pb.TagNumber(1)
  ManifestXapk_InstallDir get installLocation => $_getN(0);
  @$pb.TagNumber(1)
  set installLocation(ManifestXapk_InstallDir value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInstallLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstallLocation() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get file => $_getSZ(1);
  @$pb.TagNumber(2)
  set file($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFile() => $_has(1);
  @$pb.TagNumber(2)
  void clearFile() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get installPath => $_getSZ(2);
  @$pb.TagNumber(3)
  set installPath($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInstallPath() => $_has(2);
  @$pb.TagNumber(3)
  void clearInstallPath() => $_clearField(3);
}

class ManifestXapk extends $pb.GeneratedMessage {
  factory ManifestXapk({
    $core.int? xapkVersion,
    $core.String? packageName,
    $core.String? name,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? localesName,
    $core.int? versionCode,
    $core.String? versionName,
    $core.int? minSdkVersion,
    $core.int? targetSdkVersion,
    $core.Iterable<$core.String>? permissions,
    $core.Iterable<$core.String>? splitConfigs,
    $core.int? totalSize,
    $core.String? icon,
    $core.Iterable<ManifestXapk_ApkFile>? splitApks,
    $core.Iterable<ManifestXapk_ApkExpansion>? expansions,
  }) {
    final result = create();
    if (xapkVersion != null) result.xapkVersion = xapkVersion;
    if (packageName != null) result.packageName = packageName;
    if (name != null) result.name = name;
    if (localesName != null) result.localesName.addEntries(localesName);
    if (versionCode != null) result.versionCode = versionCode;
    if (versionName != null) result.versionName = versionName;
    if (minSdkVersion != null) result.minSdkVersion = minSdkVersion;
    if (targetSdkVersion != null) result.targetSdkVersion = targetSdkVersion;
    if (permissions != null) result.permissions.addAll(permissions);
    if (splitConfigs != null) result.splitConfigs.addAll(splitConfigs);
    if (totalSize != null) result.totalSize = totalSize;
    if (icon != null) result.icon = icon;
    if (splitApks != null) result.splitApks.addAll(splitApks);
    if (expansions != null) result.expansions.addAll(expansions);
    return result;
  }

  ManifestXapk._();

  factory ManifestXapk.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ManifestXapk.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ManifestXapk',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'xapkVersion',
        fieldType: $pb.PbFieldType.OU3, defaultOrMaker: 1)
    ..aOS(2, _omitFieldNames ? '' : 'packageName')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..m<$core.String, $core.String>(4, _omitFieldNames ? '' : 'localesName',
        entryClassName: 'ManifestXapk.LocalesNameEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('proto'))
    ..aI(5, _omitFieldNames ? '' : 'versionCode',
        fieldType: $pb.PbFieldType.OU3)
    ..aOS(6, _omitFieldNames ? '' : 'versionName')
    ..aI(7, _omitFieldNames ? '' : 'minSdkVersion',
        fieldType: $pb.PbFieldType.OU3)
    ..aI(8, _omitFieldNames ? '' : 'targetSdkVersion',
        fieldType: $pb.PbFieldType.OU3)
    ..pPS(9, _omitFieldNames ? '' : 'permissions')
    ..pPS(10, _omitFieldNames ? '' : 'splitConfigs')
    ..aI(11, _omitFieldNames ? '' : 'totalSize', fieldType: $pb.PbFieldType.OU3)
    ..aOS(12, _omitFieldNames ? '' : 'icon')
    ..pPM<ManifestXapk_ApkFile>(13, _omitFieldNames ? '' : 'splitApks',
        subBuilder: ManifestXapk_ApkFile.create)
    ..pPM<ManifestXapk_ApkExpansion>(14, _omitFieldNames ? '' : 'expansions',
        subBuilder: ManifestXapk_ApkExpansion.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ManifestXapk clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ManifestXapk copyWith(void Function(ManifestXapk) updates) =>
      super.copyWith((message) => updates(message as ManifestXapk))
          as ManifestXapk;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ManifestXapk create() => ManifestXapk._();
  @$core.override
  ManifestXapk createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ManifestXapk getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ManifestXapk>(create);
  static ManifestXapk? _defaultInstance;

  /// App options
  @$pb.TagNumber(1)
  $core.int get xapkVersion => $_getI(0, 1);
  @$pb.TagNumber(1)
  set xapkVersion($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasXapkVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearXapkVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get packageName => $_getSZ(1);
  @$pb.TagNumber(2)
  set packageName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPackageName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPackageName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbMap<$core.String, $core.String> get localesName => $_getMap(3);

  @$pb.TagNumber(5)
  $core.int get versionCode => $_getIZ(4);
  @$pb.TagNumber(5)
  set versionCode($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVersionCode() => $_has(4);
  @$pb.TagNumber(5)
  void clearVersionCode() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get versionName => $_getSZ(5);
  @$pb.TagNumber(6)
  set versionName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVersionName() => $_has(5);
  @$pb.TagNumber(6)
  void clearVersionName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get minSdkVersion => $_getIZ(6);
  @$pb.TagNumber(7)
  set minSdkVersion($core.int value) => $_setUnsignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMinSdkVersion() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinSdkVersion() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get targetSdkVersion => $_getIZ(7);
  @$pb.TagNumber(8)
  set targetSdkVersion($core.int value) => $_setUnsignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTargetSdkVersion() => $_has(7);
  @$pb.TagNumber(8)
  void clearTargetSdkVersion() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$core.String> get permissions => $_getList(8);

  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get splitConfigs => $_getList(9);

  @$pb.TagNumber(11)
  $core.int get totalSize => $_getIZ(10);
  @$pb.TagNumber(11)
  set totalSize($core.int value) => $_setUnsignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTotalSize() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotalSize() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get icon => $_getSZ(11);
  @$pb.TagNumber(12)
  set icon($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasIcon() => $_has(11);
  @$pb.TagNumber(12)
  void clearIcon() => $_clearField(12);

  @$pb.TagNumber(13)
  $pb.PbList<ManifestXapk_ApkFile> get splitApks => $_getList(12);

  @$pb.TagNumber(14)
  $pb.PbList<ManifestXapk_ApkExpansion> get expansions => $_getList(13);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
