// This is a generated file - do not edit.
//
// Generated from manifest_apks.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'manifest_apks.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'manifest_apks.pbenum.dart';

class BuildApksResult extends $pb.GeneratedMessage {
  factory BuildApksResult({
    $core.Iterable<Variant>? variant,
    Bundletool? bundletool,
    $core.Iterable<AssetSliceSet>? assetSliceSet,
    $core.String? packageName,
    LocalTestingInfo? localTestingInfo,
    AssetModulesInfo? assetModulesInfo,
    $core.Iterable<DefaultTargetingValue>? defaultTargetingValue,
    $core.Iterable<PermanentlyFusedModule>? permanentlyFusedModules,
    DeviceGroupConfig? deviceGroupConfig,
  }) {
    final result = create();
    if (variant != null) result.variant.addAll(variant);
    if (bundletool != null) result.bundletool = bundletool;
    if (assetSliceSet != null) result.assetSliceSet.addAll(assetSliceSet);
    if (packageName != null) result.packageName = packageName;
    if (localTestingInfo != null) result.localTestingInfo = localTestingInfo;
    if (assetModulesInfo != null) result.assetModulesInfo = assetModulesInfo;
    if (defaultTargetingValue != null)
      result.defaultTargetingValue.addAll(defaultTargetingValue);
    if (permanentlyFusedModules != null)
      result.permanentlyFusedModules.addAll(permanentlyFusedModules);
    if (deviceGroupConfig != null) result.deviceGroupConfig = deviceGroupConfig;
    return result;
  }

  BuildApksResult._();

  factory BuildApksResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BuildApksResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BuildApksResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<Variant>(1, _omitFieldNames ? '' : 'variant',
        subBuilder: Variant.create)
    ..aOM<Bundletool>(2, _omitFieldNames ? '' : 'bundletool',
        subBuilder: Bundletool.create)
    ..pPM<AssetSliceSet>(3, _omitFieldNames ? '' : 'assetSliceSet',
        subBuilder: AssetSliceSet.create)
    ..aOS(4, _omitFieldNames ? '' : 'packageName')
    ..aOM<LocalTestingInfo>(5, _omitFieldNames ? '' : 'localTestingInfo',
        subBuilder: LocalTestingInfo.create)
    ..aOM<AssetModulesInfo>(6, _omitFieldNames ? '' : 'assetModulesInfo',
        subBuilder: AssetModulesInfo.create)
    ..pPM<DefaultTargetingValue>(
        7, _omitFieldNames ? '' : 'defaultTargetingValue',
        subBuilder: DefaultTargetingValue.create)
    ..pPM<PermanentlyFusedModule>(
        8, _omitFieldNames ? '' : 'permanentlyFusedModules',
        subBuilder: PermanentlyFusedModule.create)
    ..aOM<DeviceGroupConfig>(9, _omitFieldNames ? '' : 'deviceGroupConfig',
        subBuilder: DeviceGroupConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuildApksResult clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BuildApksResult copyWith(void Function(BuildApksResult) updates) =>
      super.copyWith((message) => updates(message as BuildApksResult))
          as BuildApksResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuildApksResult create() => BuildApksResult._();
  @$core.override
  BuildApksResult createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static BuildApksResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BuildApksResult>(create);
  static BuildApksResult? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Variant> get variant => $_getList(0);

  @$pb.TagNumber(2)
  Bundletool get bundletool => $_getN(1);
  @$pb.TagNumber(2)
  set bundletool(Bundletool value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasBundletool() => $_has(1);
  @$pb.TagNumber(2)
  void clearBundletool() => $_clearField(2);
  @$pb.TagNumber(2)
  Bundletool ensureBundletool() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<AssetSliceSet> get assetSliceSet => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get packageName => $_getSZ(3);
  @$pb.TagNumber(4)
  set packageName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPackageName() => $_has(3);
  @$pb.TagNumber(4)
  void clearPackageName() => $_clearField(4);

  @$pb.TagNumber(5)
  LocalTestingInfo get localTestingInfo => $_getN(4);
  @$pb.TagNumber(5)
  set localTestingInfo(LocalTestingInfo value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasLocalTestingInfo() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocalTestingInfo() => $_clearField(5);
  @$pb.TagNumber(5)
  LocalTestingInfo ensureLocalTestingInfo() => $_ensure(4);

  @$pb.TagNumber(6)
  AssetModulesInfo get assetModulesInfo => $_getN(5);
  @$pb.TagNumber(6)
  set assetModulesInfo(AssetModulesInfo value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAssetModulesInfo() => $_has(5);
  @$pb.TagNumber(6)
  void clearAssetModulesInfo() => $_clearField(6);
  @$pb.TagNumber(6)
  AssetModulesInfo ensureAssetModulesInfo() => $_ensure(5);

  @$pb.TagNumber(7)
  $pb.PbList<DefaultTargetingValue> get defaultTargetingValue => $_getList(6);

  @$pb.TagNumber(8)
  $pb.PbList<PermanentlyFusedModule> get permanentlyFusedModules =>
      $_getList(7);

  @$pb.TagNumber(9)
  DeviceGroupConfig get deviceGroupConfig => $_getN(8);
  @$pb.TagNumber(9)
  set deviceGroupConfig(DeviceGroupConfig value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasDeviceGroupConfig() => $_has(8);
  @$pb.TagNumber(9)
  void clearDeviceGroupConfig() => $_clearField(9);
  @$pb.TagNumber(9)
  DeviceGroupConfig ensureDeviceGroupConfig() => $_ensure(8);
}

class Variant extends $pb.GeneratedMessage {
  factory Variant({
    VariantTargeting? targeting,
    $core.Iterable<ApkSet>? apkSet,
    $core.int? variantNumber,
    VariantProperties? variantProperties,
  }) {
    final result = create();
    if (targeting != null) result.targeting = targeting;
    if (apkSet != null) result.apkSet.addAll(apkSet);
    if (variantNumber != null) result.variantNumber = variantNumber;
    if (variantProperties != null) result.variantProperties = variantProperties;
    return result;
  }

  Variant._();

  factory Variant.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Variant.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Variant',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<VariantTargeting>(1, _omitFieldNames ? '' : 'targeting',
        subBuilder: VariantTargeting.create)
    ..pPM<ApkSet>(2, _omitFieldNames ? '' : 'apkSet', subBuilder: ApkSet.create)
    ..aI(3, _omitFieldNames ? '' : 'variantNumber',
        fieldType: $pb.PbFieldType.OU3)
    ..aOM<VariantProperties>(4, _omitFieldNames ? '' : 'variantProperties',
        subBuilder: VariantProperties.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Variant clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Variant copyWith(void Function(Variant) updates) =>
      super.copyWith((message) => updates(message as Variant)) as Variant;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Variant create() => Variant._();
  @$core.override
  Variant createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Variant getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Variant>(create);
  static Variant? _defaultInstance;

  @$pb.TagNumber(1)
  VariantTargeting get targeting => $_getN(0);
  @$pb.TagNumber(1)
  set targeting(VariantTargeting value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTargeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargeting() => $_clearField(1);
  @$pb.TagNumber(1)
  VariantTargeting ensureTargeting() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<ApkSet> get apkSet => $_getList(1);

  @$pb.TagNumber(3)
  $core.int get variantNumber => $_getIZ(2);
  @$pb.TagNumber(3)
  set variantNumber($core.int value) => $_setUnsignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVariantNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearVariantNumber() => $_clearField(3);

  @$pb.TagNumber(4)
  VariantProperties get variantProperties => $_getN(3);
  @$pb.TagNumber(4)
  set variantProperties(VariantProperties value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasVariantProperties() => $_has(3);
  @$pb.TagNumber(4)
  void clearVariantProperties() => $_clearField(4);
  @$pb.TagNumber(4)
  VariantProperties ensureVariantProperties() => $_ensure(3);
}

class Bundletool extends $pb.GeneratedMessage {
  factory Bundletool({
    $core.String? version,
  }) {
    final result = create();
    if (version != null) result.version = version;
    return result;
  }

  Bundletool._();

  factory Bundletool.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Bundletool.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Bundletool',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Bundletool clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Bundletool copyWith(void Function(Bundletool) updates) =>
      super.copyWith((message) => updates(message as Bundletool)) as Bundletool;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Bundletool create() => Bundletool._();
  @$core.override
  Bundletool createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Bundletool getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Bundletool>(create);
  static Bundletool? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(2)
  set version($core.String value) => $_setString(0, value);
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(2)
  void clearVersion() => $_clearField(2);
}

class AssetSliceSet extends $pb.GeneratedMessage {
  factory AssetSliceSet({
    AssetModuleMetadata? assetModuleMetadata,
    $core.Iterable<ApkDescription>? apkDescription,
  }) {
    final result = create();
    if (assetModuleMetadata != null)
      result.assetModuleMetadata = assetModuleMetadata;
    if (apkDescription != null) result.apkDescription.addAll(apkDescription);
    return result;
  }

  AssetSliceSet._();

  factory AssetSliceSet.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetSliceSet.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetSliceSet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<AssetModuleMetadata>(1, _omitFieldNames ? '' : 'assetModuleMetadata',
        subBuilder: AssetModuleMetadata.create)
    ..pPM<ApkDescription>(2, _omitFieldNames ? '' : 'apkDescription',
        subBuilder: ApkDescription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetSliceSet clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetSliceSet copyWith(void Function(AssetSliceSet) updates) =>
      super.copyWith((message) => updates(message as AssetSliceSet))
          as AssetSliceSet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetSliceSet create() => AssetSliceSet._();
  @$core.override
  AssetSliceSet createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetSliceSet getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssetSliceSet>(create);
  static AssetSliceSet? _defaultInstance;

  @$pb.TagNumber(1)
  AssetModuleMetadata get assetModuleMetadata => $_getN(0);
  @$pb.TagNumber(1)
  set assetModuleMetadata(AssetModuleMetadata value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAssetModuleMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearAssetModuleMetadata() => $_clearField(1);
  @$pb.TagNumber(1)
  AssetModuleMetadata ensureAssetModuleMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<ApkDescription> get apkDescription => $_getList(1);
}

class LocalTestingInfo extends $pb.GeneratedMessage {
  factory LocalTestingInfo({
    $core.bool? enabled,
    $core.String? localTestingPath,
  }) {
    final result = create();
    if (enabled != null) result.enabled = enabled;
    if (localTestingPath != null) result.localTestingPath = localTestingPath;
    return result;
  }

  LocalTestingInfo._();

  factory LocalTestingInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LocalTestingInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LocalTestingInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aOS(2, _omitFieldNames ? '' : 'localTestingPath')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocalTestingInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LocalTestingInfo copyWith(void Function(LocalTestingInfo) updates) =>
      super.copyWith((message) => updates(message as LocalTestingInfo))
          as LocalTestingInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocalTestingInfo create() => LocalTestingInfo._();
  @$core.override
  LocalTestingInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LocalTestingInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LocalTestingInfo>(create);
  static LocalTestingInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get localTestingPath => $_getSZ(1);
  @$pb.TagNumber(2)
  set localTestingPath($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLocalTestingPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalTestingPath() => $_clearField(2);
}

class AssetModulesInfo extends $pb.GeneratedMessage {
  factory AssetModulesInfo({
    $core.Iterable<$fixnum.Int64>? appVersion,
    $core.String? assetVersionTag,
  }) {
    final result = create();
    if (appVersion != null) result.appVersion.addAll(appVersion);
    if (assetVersionTag != null) result.assetVersionTag = assetVersionTag;
    return result;
  }

  AssetModulesInfo._();

  factory AssetModulesInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetModulesInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetModulesInfo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..p<$fixnum.Int64>(
        1, _omitFieldNames ? '' : 'appVersion', $pb.PbFieldType.K6)
    ..aOS(2, _omitFieldNames ? '' : 'assetVersionTag')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetModulesInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetModulesInfo copyWith(void Function(AssetModulesInfo) updates) =>
      super.copyWith((message) => updates(message as AssetModulesInfo))
          as AssetModulesInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetModulesInfo create() => AssetModulesInfo._();
  @$core.override
  AssetModulesInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetModulesInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssetModulesInfo>(create);
  static AssetModulesInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$fixnum.Int64> get appVersion => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get assetVersionTag => $_getSZ(1);
  @$pb.TagNumber(2)
  set assetVersionTag($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAssetVersionTag() => $_has(1);
  @$pb.TagNumber(2)
  void clearAssetVersionTag() => $_clearField(2);
}

class DefaultTargetingValue extends $pb.GeneratedMessage {
  factory DefaultTargetingValue({
    $core.int? dimension,
    $core.String? defaultValue,
  }) {
    final result = create();
    if (dimension != null) result.dimension = dimension;
    if (defaultValue != null) result.defaultValue = defaultValue;
    return result;
  }

  DefaultTargetingValue._();

  factory DefaultTargetingValue.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DefaultTargetingValue.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DefaultTargetingValue',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'dimension')
    ..aOS(2, _omitFieldNames ? '' : 'defaultValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DefaultTargetingValue clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DefaultTargetingValue copyWith(
          void Function(DefaultTargetingValue) updates) =>
      super.copyWith((message) => updates(message as DefaultTargetingValue))
          as DefaultTargetingValue;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DefaultTargetingValue create() => DefaultTargetingValue._();
  @$core.override
  DefaultTargetingValue createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DefaultTargetingValue getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DefaultTargetingValue>(create);
  static DefaultTargetingValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get dimension => $_getIZ(0);
  @$pb.TagNumber(1)
  set dimension($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDimension() => $_has(0);
  @$pb.TagNumber(1)
  void clearDimension() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get defaultValue => $_getSZ(1);
  @$pb.TagNumber(2)
  set defaultValue($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDefaultValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearDefaultValue() => $_clearField(2);
}

class PermanentlyFusedModule extends $pb.GeneratedMessage {
  factory PermanentlyFusedModule({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  PermanentlyFusedModule._();

  factory PermanentlyFusedModule.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PermanentlyFusedModule.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PermanentlyFusedModule',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PermanentlyFusedModule clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PermanentlyFusedModule copyWith(
          void Function(PermanentlyFusedModule) updates) =>
      super.copyWith((message) => updates(message as PermanentlyFusedModule))
          as PermanentlyFusedModule;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PermanentlyFusedModule create() => PermanentlyFusedModule._();
  @$core.override
  PermanentlyFusedModule createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PermanentlyFusedModule getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PermanentlyFusedModule>(create);
  static PermanentlyFusedModule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

class DeviceGroupConfig extends $pb.GeneratedMessage {
  factory DeviceGroupConfig({
    $core.Iterable<DeviceGroup>? deviceGroups,
  }) {
    final result = create();
    if (deviceGroups != null) result.deviceGroups.addAll(deviceGroups);
    return result;
  }

  DeviceGroupConfig._();

  factory DeviceGroupConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceGroupConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceGroupConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<DeviceGroup>(1, _omitFieldNames ? '' : 'deviceGroups',
        subBuilder: DeviceGroup.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceGroupConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceGroupConfig copyWith(void Function(DeviceGroupConfig) updates) =>
      super.copyWith((message) => updates(message as DeviceGroupConfig))
          as DeviceGroupConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceGroupConfig create() => DeviceGroupConfig._();
  @$core.override
  DeviceGroupConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceGroupConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceGroupConfig>(create);
  static DeviceGroupConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<DeviceGroup> get deviceGroups => $_getList(0);
}

class DeviceGroup extends $pb.GeneratedMessage {
  factory DeviceGroup({
    $core.String? name,
    $core.Iterable<DeviceSelector>? deviceSelectors,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (deviceSelectors != null) result.deviceSelectors.addAll(deviceSelectors);
    return result;
  }

  DeviceGroup._();

  factory DeviceGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pPM<DeviceSelector>(2, _omitFieldNames ? '' : 'deviceSelectors',
        subBuilder: DeviceSelector.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceGroup clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceGroup copyWith(void Function(DeviceGroup) updates) =>
      super.copyWith((message) => updates(message as DeviceGroup))
          as DeviceGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceGroup create() => DeviceGroup._();
  @$core.override
  DeviceGroup createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceGroup>(create);
  static DeviceGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<DeviceSelector> get deviceSelectors => $_getList(1);
}

class DeviceSelector extends $pb.GeneratedMessage {
  factory DeviceSelector({
    DeviceRam? deviceRam,
    $core.Iterable<DeviceId>? includedDeviceIds,
    $core.Iterable<DeviceId>? excludedDeviceIds,
    $core.Iterable<SystemFeature>? requiredSystemFeatures,
    $core.Iterable<SystemFeature>? forbiddenSystemFeatures,
    $core.Iterable<SystemOnChip>? systemOnChips,
  }) {
    final result = create();
    if (deviceRam != null) result.deviceRam = deviceRam;
    if (includedDeviceIds != null)
      result.includedDeviceIds.addAll(includedDeviceIds);
    if (excludedDeviceIds != null)
      result.excludedDeviceIds.addAll(excludedDeviceIds);
    if (requiredSystemFeatures != null)
      result.requiredSystemFeatures.addAll(requiredSystemFeatures);
    if (forbiddenSystemFeatures != null)
      result.forbiddenSystemFeatures.addAll(forbiddenSystemFeatures);
    if (systemOnChips != null) result.systemOnChips.addAll(systemOnChips);
    return result;
  }

  DeviceSelector._();

  factory DeviceSelector.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceSelector.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceSelector',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<DeviceRam>(1, _omitFieldNames ? '' : 'deviceRam',
        subBuilder: DeviceRam.create)
    ..pPM<DeviceId>(2, _omitFieldNames ? '' : 'includedDeviceIds',
        subBuilder: DeviceId.create)
    ..pPM<DeviceId>(3, _omitFieldNames ? '' : 'excludedDeviceIds',
        subBuilder: DeviceId.create)
    ..pPM<SystemFeature>(4, _omitFieldNames ? '' : 'requiredSystemFeatures',
        subBuilder: SystemFeature.create)
    ..pPM<SystemFeature>(5, _omitFieldNames ? '' : 'forbiddenSystemFeatures',
        subBuilder: SystemFeature.create)
    ..pPM<SystemOnChip>(6, _omitFieldNames ? '' : 'systemOnChips',
        subBuilder: SystemOnChip.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceSelector clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceSelector copyWith(void Function(DeviceSelector) updates) =>
      super.copyWith((message) => updates(message as DeviceSelector))
          as DeviceSelector;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceSelector create() => DeviceSelector._();
  @$core.override
  DeviceSelector createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceSelector getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceSelector>(create);
  static DeviceSelector? _defaultInstance;

  @$pb.TagNumber(1)
  DeviceRam get deviceRam => $_getN(0);
  @$pb.TagNumber(1)
  set deviceRam(DeviceRam value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDeviceRam() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeviceRam() => $_clearField(1);
  @$pb.TagNumber(1)
  DeviceRam ensureDeviceRam() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<DeviceId> get includedDeviceIds => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<DeviceId> get excludedDeviceIds => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<SystemFeature> get requiredSystemFeatures => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<SystemFeature> get forbiddenSystemFeatures => $_getList(4);

  @$pb.TagNumber(6)
  $pb.PbList<SystemOnChip> get systemOnChips => $_getList(5);
}

class DeviceRam extends $pb.GeneratedMessage {
  factory DeviceRam({
    $fixnum.Int64? minBytes,
    $fixnum.Int64? maxBytes,
  }) {
    final result = create();
    if (minBytes != null) result.minBytes = minBytes;
    if (maxBytes != null) result.maxBytes = maxBytes;
    return result;
  }

  DeviceRam._();

  factory DeviceRam.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceRam.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceRam',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'minBytes')
    ..aInt64(2, _omitFieldNames ? '' : 'maxBytes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceRam clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceRam copyWith(void Function(DeviceRam) updates) =>
      super.copyWith((message) => updates(message as DeviceRam)) as DeviceRam;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceRam create() => DeviceRam._();
  @$core.override
  DeviceRam createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceRam getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceRam>(create);
  static DeviceRam? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get minBytes => $_getI64(0);
  @$pb.TagNumber(1)
  set minBytes($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMinBytes() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinBytes() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get maxBytes => $_getI64(1);
  @$pb.TagNumber(2)
  set maxBytes($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMaxBytes() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxBytes() => $_clearField(2);
}

class DeviceId extends $pb.GeneratedMessage {
  factory DeviceId({
    $core.String? buildBrand,
    $core.String? buildDevice,
  }) {
    final result = create();
    if (buildBrand != null) result.buildBrand = buildBrand;
    if (buildDevice != null) result.buildDevice = buildDevice;
    return result;
  }

  DeviceId._();

  factory DeviceId.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceId.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceId',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'buildBrand')
    ..aOS(2, _omitFieldNames ? '' : 'buildDevice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceId clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceId copyWith(void Function(DeviceId) updates) =>
      super.copyWith((message) => updates(message as DeviceId)) as DeviceId;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceId create() => DeviceId._();
  @$core.override
  DeviceId createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceId getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeviceId>(create);
  static DeviceId? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get buildBrand => $_getSZ(0);
  @$pb.TagNumber(1)
  set buildBrand($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBuildBrand() => $_has(0);
  @$pb.TagNumber(1)
  void clearBuildBrand() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get buildDevice => $_getSZ(1);
  @$pb.TagNumber(2)
  set buildDevice($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBuildDevice() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuildDevice() => $_clearField(2);
}

class SystemFeature extends $pb.GeneratedMessage {
  factory SystemFeature({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  SystemFeature._();

  factory SystemFeature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemFeature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemFeature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemFeature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemFeature copyWith(void Function(SystemFeature) updates) =>
      super.copyWith((message) => updates(message as SystemFeature))
          as SystemFeature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemFeature create() => SystemFeature._();
  @$core.override
  SystemFeature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SystemFeature getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemFeature>(create);
  static SystemFeature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

class SystemOnChip extends $pb.GeneratedMessage {
  factory SystemOnChip({
    $core.String? manufacturer,
    $core.String? model,
  }) {
    final result = create();
    if (manufacturer != null) result.manufacturer = manufacturer;
    if (model != null) result.model = model;
    return result;
  }

  SystemOnChip._();

  factory SystemOnChip.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemOnChip.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemOnChip',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'manufacturer')
    ..aOS(2, _omitFieldNames ? '' : 'model')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemOnChip clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemOnChip copyWith(void Function(SystemOnChip) updates) =>
      super.copyWith((message) => updates(message as SystemOnChip))
          as SystemOnChip;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemOnChip create() => SystemOnChip._();
  @$core.override
  SystemOnChip createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SystemOnChip getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemOnChip>(create);
  static SystemOnChip? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get manufacturer => $_getSZ(0);
  @$pb.TagNumber(1)
  set manufacturer($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasManufacturer() => $_has(0);
  @$pb.TagNumber(1)
  void clearManufacturer() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get model => $_getSZ(1);
  @$pb.TagNumber(2)
  set model($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasModel() => $_has(1);
  @$pb.TagNumber(2)
  void clearModel() => $_clearField(2);
}

class VariantTargeting extends $pb.GeneratedMessage {
  factory VariantTargeting({
    SdkVersionTargeting? sdkVersionTargeting,
    AbiTargeting? abiTargeting,
    ScreenDensityTargeting? screenDensityTargeting,
    MultiAbiTargeting? multiAbiTargeting,
    TextureCompressionFormatTargeting? textureCompressionFormatTargeting,
    SdkRuntimeTargeting? sdkRuntimeTargeting,
  }) {
    final result = create();
    if (sdkVersionTargeting != null)
      result.sdkVersionTargeting = sdkVersionTargeting;
    if (abiTargeting != null) result.abiTargeting = abiTargeting;
    if (screenDensityTargeting != null)
      result.screenDensityTargeting = screenDensityTargeting;
    if (multiAbiTargeting != null) result.multiAbiTargeting = multiAbiTargeting;
    if (textureCompressionFormatTargeting != null)
      result.textureCompressionFormatTargeting =
          textureCompressionFormatTargeting;
    if (sdkRuntimeTargeting != null)
      result.sdkRuntimeTargeting = sdkRuntimeTargeting;
    return result;
  }

  VariantTargeting._();

  factory VariantTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VariantTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VariantTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<SdkVersionTargeting>(1, _omitFieldNames ? '' : 'sdkVersionTargeting',
        subBuilder: SdkVersionTargeting.create)
    ..aOM<AbiTargeting>(2, _omitFieldNames ? '' : 'abiTargeting',
        subBuilder: AbiTargeting.create)
    ..aOM<ScreenDensityTargeting>(
        3, _omitFieldNames ? '' : 'screenDensityTargeting',
        subBuilder: ScreenDensityTargeting.create)
    ..aOM<MultiAbiTargeting>(4, _omitFieldNames ? '' : 'multiAbiTargeting',
        subBuilder: MultiAbiTargeting.create)
    ..aOM<TextureCompressionFormatTargeting>(
        5, _omitFieldNames ? '' : 'textureCompressionFormatTargeting',
        subBuilder: TextureCompressionFormatTargeting.create)
    ..aOM<SdkRuntimeTargeting>(6, _omitFieldNames ? '' : 'sdkRuntimeTargeting',
        subBuilder: SdkRuntimeTargeting.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VariantTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VariantTargeting copyWith(void Function(VariantTargeting) updates) =>
      super.copyWith((message) => updates(message as VariantTargeting))
          as VariantTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VariantTargeting create() => VariantTargeting._();
  @$core.override
  VariantTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VariantTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VariantTargeting>(create);
  static VariantTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  SdkVersionTargeting get sdkVersionTargeting => $_getN(0);
  @$pb.TagNumber(1)
  set sdkVersionTargeting(SdkVersionTargeting value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSdkVersionTargeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdkVersionTargeting() => $_clearField(1);
  @$pb.TagNumber(1)
  SdkVersionTargeting ensureSdkVersionTargeting() => $_ensure(0);

  @$pb.TagNumber(2)
  AbiTargeting get abiTargeting => $_getN(1);
  @$pb.TagNumber(2)
  set abiTargeting(AbiTargeting value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasAbiTargeting() => $_has(1);
  @$pb.TagNumber(2)
  void clearAbiTargeting() => $_clearField(2);
  @$pb.TagNumber(2)
  AbiTargeting ensureAbiTargeting() => $_ensure(1);

  @$pb.TagNumber(3)
  ScreenDensityTargeting get screenDensityTargeting => $_getN(2);
  @$pb.TagNumber(3)
  set screenDensityTargeting(ScreenDensityTargeting value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasScreenDensityTargeting() => $_has(2);
  @$pb.TagNumber(3)
  void clearScreenDensityTargeting() => $_clearField(3);
  @$pb.TagNumber(3)
  ScreenDensityTargeting ensureScreenDensityTargeting() => $_ensure(2);

  @$pb.TagNumber(4)
  MultiAbiTargeting get multiAbiTargeting => $_getN(3);
  @$pb.TagNumber(4)
  set multiAbiTargeting(MultiAbiTargeting value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMultiAbiTargeting() => $_has(3);
  @$pb.TagNumber(4)
  void clearMultiAbiTargeting() => $_clearField(4);
  @$pb.TagNumber(4)
  MultiAbiTargeting ensureMultiAbiTargeting() => $_ensure(3);

  @$pb.TagNumber(5)
  TextureCompressionFormatTargeting get textureCompressionFormatTargeting =>
      $_getN(4);
  @$pb.TagNumber(5)
  set textureCompressionFormatTargeting(
          TextureCompressionFormatTargeting value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTextureCompressionFormatTargeting() => $_has(4);
  @$pb.TagNumber(5)
  void clearTextureCompressionFormatTargeting() => $_clearField(5);
  @$pb.TagNumber(5)
  TextureCompressionFormatTargeting ensureTextureCompressionFormatTargeting() =>
      $_ensure(4);

  @$pb.TagNumber(6)
  SdkRuntimeTargeting get sdkRuntimeTargeting => $_getN(5);
  @$pb.TagNumber(6)
  set sdkRuntimeTargeting(SdkRuntimeTargeting value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSdkRuntimeTargeting() => $_has(5);
  @$pb.TagNumber(6)
  void clearSdkRuntimeTargeting() => $_clearField(6);
  @$pb.TagNumber(6)
  SdkRuntimeTargeting ensureSdkRuntimeTargeting() => $_ensure(5);
}

class SdkRuntimeTargeting extends $pb.GeneratedMessage {
  factory SdkRuntimeTargeting({
    $core.bool? requiresSdkRuntime,
  }) {
    final result = create();
    if (requiresSdkRuntime != null)
      result.requiresSdkRuntime = requiresSdkRuntime;
    return result;
  }

  SdkRuntimeTargeting._();

  factory SdkRuntimeTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SdkRuntimeTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SdkRuntimeTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'requiresSdkRuntime')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkRuntimeTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkRuntimeTargeting copyWith(void Function(SdkRuntimeTargeting) updates) =>
      super.copyWith((message) => updates(message as SdkRuntimeTargeting))
          as SdkRuntimeTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SdkRuntimeTargeting create() => SdkRuntimeTargeting._();
  @$core.override
  SdkRuntimeTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SdkRuntimeTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SdkRuntimeTargeting>(create);
  static SdkRuntimeTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get requiresSdkRuntime => $_getBF(0);
  @$pb.TagNumber(1)
  set requiresSdkRuntime($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequiresSdkRuntime() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequiresSdkRuntime() => $_clearField(1);
}

class VariantProperties extends $pb.GeneratedMessage {
  factory VariantProperties({
    $core.bool? uncompressedDex,
    $core.bool? uncompressedNativeLibraries,
    $core.bool? sparseEncoding,
  }) {
    final result = create();
    if (uncompressedDex != null) result.uncompressedDex = uncompressedDex;
    if (uncompressedNativeLibraries != null)
      result.uncompressedNativeLibraries = uncompressedNativeLibraries;
    if (sparseEncoding != null) result.sparseEncoding = sparseEncoding;
    return result;
  }

  VariantProperties._();

  factory VariantProperties.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VariantProperties.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VariantProperties',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'uncompressedDex')
    ..aOB(2, _omitFieldNames ? '' : 'uncompressedNativeLibraries')
    ..aOB(3, _omitFieldNames ? '' : 'sparseEncoding')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VariantProperties clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VariantProperties copyWith(void Function(VariantProperties) updates) =>
      super.copyWith((message) => updates(message as VariantProperties))
          as VariantProperties;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VariantProperties create() => VariantProperties._();
  @$core.override
  VariantProperties createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VariantProperties getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VariantProperties>(create);
  static VariantProperties? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get uncompressedDex => $_getBF(0);
  @$pb.TagNumber(1)
  set uncompressedDex($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUncompressedDex() => $_has(0);
  @$pb.TagNumber(1)
  void clearUncompressedDex() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get uncompressedNativeLibraries => $_getBF(1);
  @$pb.TagNumber(2)
  set uncompressedNativeLibraries($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUncompressedNativeLibraries() => $_has(1);
  @$pb.TagNumber(2)
  void clearUncompressedNativeLibraries() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get sparseEncoding => $_getBF(2);
  @$pb.TagNumber(3)
  set sparseEncoding($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSparseEncoding() => $_has(2);
  @$pb.TagNumber(3)
  void clearSparseEncoding() => $_clearField(3);
}

class ApkSet extends $pb.GeneratedMessage {
  factory ApkSet({
    ModuleMetadata? moduleMetadata,
    $core.Iterable<ApkDescription>? apkDescription,
  }) {
    final result = create();
    if (moduleMetadata != null) result.moduleMetadata = moduleMetadata;
    if (apkDescription != null) result.apkDescription.addAll(apkDescription);
    return result;
  }

  ApkSet._();

  factory ApkSet.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApkSet.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApkSet',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<ModuleMetadata>(1, _omitFieldNames ? '' : 'moduleMetadata',
        subBuilder: ModuleMetadata.create)
    ..pPM<ApkDescription>(2, _omitFieldNames ? '' : 'apkDescription',
        subBuilder: ApkDescription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApkSet clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApkSet copyWith(void Function(ApkSet) updates) =>
      super.copyWith((message) => updates(message as ApkSet)) as ApkSet;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApkSet create() => ApkSet._();
  @$core.override
  ApkSet createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApkSet getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ApkSet>(create);
  static ApkSet? _defaultInstance;

  @$pb.TagNumber(1)
  ModuleMetadata get moduleMetadata => $_getN(0);
  @$pb.TagNumber(1)
  set moduleMetadata(ModuleMetadata value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasModuleMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearModuleMetadata() => $_clearField(1);
  @$pb.TagNumber(1)
  ModuleMetadata ensureModuleMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<ApkDescription> get apkDescription => $_getList(1);
}

class ModuleMetadata extends $pb.GeneratedMessage {
  factory ModuleMetadata({
    $core.String? name,
    @$core.Deprecated('This field is deprecated.')
    $core.bool? onDemandDeprecated,
    $core.bool? isInstant,
    $core.Iterable<$core.String>? dependencies,
    ModuleTargeting? targeting,
    DeliveryType? deliveryType,
    FeatureModuleType? moduleType,
    $core.Iterable<RuntimeEnabledSdkDependency>? runtimeEnabledSdkDependencies,
    SdkModuleMetadata? sdkModuleMetadata,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (onDemandDeprecated != null)
      result.onDemandDeprecated = onDemandDeprecated;
    if (isInstant != null) result.isInstant = isInstant;
    if (dependencies != null) result.dependencies.addAll(dependencies);
    if (targeting != null) result.targeting = targeting;
    if (deliveryType != null) result.deliveryType = deliveryType;
    if (moduleType != null) result.moduleType = moduleType;
    if (runtimeEnabledSdkDependencies != null)
      result.runtimeEnabledSdkDependencies
          .addAll(runtimeEnabledSdkDependencies);
    if (sdkModuleMetadata != null) result.sdkModuleMetadata = sdkModuleMetadata;
    return result;
  }

  ModuleMetadata._();

  factory ModuleMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ModuleMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ModuleMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'onDemandDeprecated')
    ..aOB(3, _omitFieldNames ? '' : 'isInstant')
    ..pPS(4, _omitFieldNames ? '' : 'dependencies')
    ..aOM<ModuleTargeting>(5, _omitFieldNames ? '' : 'targeting',
        subBuilder: ModuleTargeting.create)
    ..aE<DeliveryType>(6, _omitFieldNames ? '' : 'deliveryType',
        enumValues: DeliveryType.values)
    ..aE<FeatureModuleType>(7, _omitFieldNames ? '' : 'moduleType',
        enumValues: FeatureModuleType.values)
    ..pPM<RuntimeEnabledSdkDependency>(
        8, _omitFieldNames ? '' : 'runtimeEnabledSdkDependencies',
        subBuilder: RuntimeEnabledSdkDependency.create)
    ..aOM<SdkModuleMetadata>(9, _omitFieldNames ? '' : 'sdkModuleMetadata',
        subBuilder: SdkModuleMetadata.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ModuleMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ModuleMetadata copyWith(void Function(ModuleMetadata) updates) =>
      super.copyWith((message) => updates(message as ModuleMetadata))
          as ModuleMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ModuleMetadata create() => ModuleMetadata._();
  @$core.override
  ModuleMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ModuleMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ModuleMetadata>(create);
  static ModuleMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool get onDemandDeprecated => $_getBF(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set onDemandDeprecated($core.bool value) => $_setBool(1, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasOnDemandDeprecated() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearOnDemandDeprecated() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isInstant => $_getBF(2);
  @$pb.TagNumber(3)
  set isInstant($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsInstant() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsInstant() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get dependencies => $_getList(3);

  @$pb.TagNumber(5)
  ModuleTargeting get targeting => $_getN(4);
  @$pb.TagNumber(5)
  set targeting(ModuleTargeting value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasTargeting() => $_has(4);
  @$pb.TagNumber(5)
  void clearTargeting() => $_clearField(5);
  @$pb.TagNumber(5)
  ModuleTargeting ensureTargeting() => $_ensure(4);

  @$pb.TagNumber(6)
  DeliveryType get deliveryType => $_getN(5);
  @$pb.TagNumber(6)
  set deliveryType(DeliveryType value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasDeliveryType() => $_has(5);
  @$pb.TagNumber(6)
  void clearDeliveryType() => $_clearField(6);

  @$pb.TagNumber(7)
  FeatureModuleType get moduleType => $_getN(6);
  @$pb.TagNumber(7)
  set moduleType(FeatureModuleType value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasModuleType() => $_has(6);
  @$pb.TagNumber(7)
  void clearModuleType() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<RuntimeEnabledSdkDependency> get runtimeEnabledSdkDependencies =>
      $_getList(7);

  @$pb.TagNumber(9)
  SdkModuleMetadata get sdkModuleMetadata => $_getN(8);
  @$pb.TagNumber(9)
  set sdkModuleMetadata(SdkModuleMetadata value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasSdkModuleMetadata() => $_has(8);
  @$pb.TagNumber(9)
  void clearSdkModuleMetadata() => $_clearField(9);
  @$pb.TagNumber(9)
  SdkModuleMetadata ensureSdkModuleMetadata() => $_ensure(8);
}

class ModuleTargeting extends $pb.GeneratedMessage {
  factory ModuleTargeting({
    SdkVersionTargeting? sdkVersionTargeting,
    $core.Iterable<DeviceFeatureTargeting>? deviceFeatureTargeting,
    UserCountriesTargeting? userCountriesTargeting,
    DeviceGroupModuleTargeting? deviceGroupTargeting,
  }) {
    final result = create();
    if (sdkVersionTargeting != null)
      result.sdkVersionTargeting = sdkVersionTargeting;
    if (deviceFeatureTargeting != null)
      result.deviceFeatureTargeting.addAll(deviceFeatureTargeting);
    if (userCountriesTargeting != null)
      result.userCountriesTargeting = userCountriesTargeting;
    if (deviceGroupTargeting != null)
      result.deviceGroupTargeting = deviceGroupTargeting;
    return result;
  }

  ModuleTargeting._();

  factory ModuleTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ModuleTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ModuleTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<SdkVersionTargeting>(1, _omitFieldNames ? '' : 'sdkVersionTargeting',
        subBuilder: SdkVersionTargeting.create)
    ..pPM<DeviceFeatureTargeting>(
        2, _omitFieldNames ? '' : 'deviceFeatureTargeting',
        subBuilder: DeviceFeatureTargeting.create)
    ..aOM<UserCountriesTargeting>(
        3, _omitFieldNames ? '' : 'userCountriesTargeting',
        subBuilder: UserCountriesTargeting.create)
    ..aOM<DeviceGroupModuleTargeting>(
        5, _omitFieldNames ? '' : 'deviceGroupTargeting',
        subBuilder: DeviceGroupModuleTargeting.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ModuleTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ModuleTargeting copyWith(void Function(ModuleTargeting) updates) =>
      super.copyWith((message) => updates(message as ModuleTargeting))
          as ModuleTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ModuleTargeting create() => ModuleTargeting._();
  @$core.override
  ModuleTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ModuleTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ModuleTargeting>(create);
  static ModuleTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  SdkVersionTargeting get sdkVersionTargeting => $_getN(0);
  @$pb.TagNumber(1)
  set sdkVersionTargeting(SdkVersionTargeting value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSdkVersionTargeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdkVersionTargeting() => $_clearField(1);
  @$pb.TagNumber(1)
  SdkVersionTargeting ensureSdkVersionTargeting() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<DeviceFeatureTargeting> get deviceFeatureTargeting => $_getList(1);

  @$pb.TagNumber(3)
  UserCountriesTargeting get userCountriesTargeting => $_getN(2);
  @$pb.TagNumber(3)
  set userCountriesTargeting(UserCountriesTargeting value) =>
      $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUserCountriesTargeting() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserCountriesTargeting() => $_clearField(3);
  @$pb.TagNumber(3)
  UserCountriesTargeting ensureUserCountriesTargeting() => $_ensure(2);

  @$pb.TagNumber(5)
  DeviceGroupModuleTargeting get deviceGroupTargeting => $_getN(3);
  @$pb.TagNumber(5)
  set deviceGroupTargeting(DeviceGroupModuleTargeting value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDeviceGroupTargeting() => $_has(3);
  @$pb.TagNumber(5)
  void clearDeviceGroupTargeting() => $_clearField(5);
  @$pb.TagNumber(5)
  DeviceGroupModuleTargeting ensureDeviceGroupTargeting() => $_ensure(3);
}

class DeviceFeature extends $pb.GeneratedMessage {
  factory DeviceFeature({
    $core.String? featureName,
    $core.int? featureVersion,
  }) {
    final result = create();
    if (featureName != null) result.featureName = featureName;
    if (featureVersion != null) result.featureVersion = featureVersion;
    return result;
  }

  DeviceFeature._();

  factory DeviceFeature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceFeature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceFeature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'featureName')
    ..aI(2, _omitFieldNames ? '' : 'featureVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceFeature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceFeature copyWith(void Function(DeviceFeature) updates) =>
      super.copyWith((message) => updates(message as DeviceFeature))
          as DeviceFeature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceFeature create() => DeviceFeature._();
  @$core.override
  DeviceFeature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceFeature getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceFeature>(create);
  static DeviceFeature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get featureName => $_getSZ(0);
  @$pb.TagNumber(1)
  set featureName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFeatureName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeatureName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get featureVersion => $_getIZ(1);
  @$pb.TagNumber(2)
  set featureVersion($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFeatureVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearFeatureVersion() => $_clearField(2);
}

class DeviceFeatureTargeting extends $pb.GeneratedMessage {
  factory DeviceFeatureTargeting({
    DeviceFeature? requiredFeature,
  }) {
    final result = create();
    if (requiredFeature != null) result.requiredFeature = requiredFeature;
    return result;
  }

  DeviceFeatureTargeting._();

  factory DeviceFeatureTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceFeatureTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceFeatureTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<DeviceFeature>(1, _omitFieldNames ? '' : 'requiredFeature',
        subBuilder: DeviceFeature.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceFeatureTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceFeatureTargeting copyWith(
          void Function(DeviceFeatureTargeting) updates) =>
      super.copyWith((message) => updates(message as DeviceFeatureTargeting))
          as DeviceFeatureTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceFeatureTargeting create() => DeviceFeatureTargeting._();
  @$core.override
  DeviceFeatureTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceFeatureTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceFeatureTargeting>(create);
  static DeviceFeatureTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  DeviceFeature get requiredFeature => $_getN(0);
  @$pb.TagNumber(1)
  set requiredFeature(DeviceFeature value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasRequiredFeature() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequiredFeature() => $_clearField(1);
  @$pb.TagNumber(1)
  DeviceFeature ensureRequiredFeature() => $_ensure(0);
}

class UserCountriesTargeting extends $pb.GeneratedMessage {
  factory UserCountriesTargeting({
    $core.Iterable<$core.String>? countryCodes,
    $core.bool? exclude,
  }) {
    final result = create();
    if (countryCodes != null) result.countryCodes.addAll(countryCodes);
    if (exclude != null) result.exclude = exclude;
    return result;
  }

  UserCountriesTargeting._();

  factory UserCountriesTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UserCountriesTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UserCountriesTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'countryCodes')
    ..aOB(2, _omitFieldNames ? '' : 'exclude')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCountriesTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UserCountriesTargeting copyWith(
          void Function(UserCountriesTargeting) updates) =>
      super.copyWith((message) => updates(message as UserCountriesTargeting))
          as UserCountriesTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserCountriesTargeting create() => UserCountriesTargeting._();
  @$core.override
  UserCountriesTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UserCountriesTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UserCountriesTargeting>(create);
  static UserCountriesTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get countryCodes => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get exclude => $_getBF(1);
  @$pb.TagNumber(2)
  set exclude($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExclude() => $_has(1);
  @$pb.TagNumber(2)
  void clearExclude() => $_clearField(2);
}

class DeviceGroupModuleTargeting extends $pb.GeneratedMessage {
  factory DeviceGroupModuleTargeting({
    $core.Iterable<$core.String>? value,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    return result;
  }

  DeviceGroupModuleTargeting._();

  factory DeviceGroupModuleTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceGroupModuleTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceGroupModuleTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceGroupModuleTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceGroupModuleTargeting copyWith(
          void Function(DeviceGroupModuleTargeting) updates) =>
      super.copyWith(
              (message) => updates(message as DeviceGroupModuleTargeting))
          as DeviceGroupModuleTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceGroupModuleTargeting create() => DeviceGroupModuleTargeting._();
  @$core.override
  DeviceGroupModuleTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceGroupModuleTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceGroupModuleTargeting>(create);
  static DeviceGroupModuleTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get value => $_getList(0);
}

class RuntimeEnabledSdkDependency extends $pb.GeneratedMessage {
  factory RuntimeEnabledSdkDependency({
    $core.String? packageName,
    $core.int? majorVersion,
    $core.int? minorVersion,
  }) {
    final result = create();
    if (packageName != null) result.packageName = packageName;
    if (majorVersion != null) result.majorVersion = majorVersion;
    if (minorVersion != null) result.minorVersion = minorVersion;
    return result;
  }

  RuntimeEnabledSdkDependency._();

  factory RuntimeEnabledSdkDependency.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RuntimeEnabledSdkDependency.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RuntimeEnabledSdkDependency',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'packageName')
    ..aI(2, _omitFieldNames ? '' : 'majorVersion')
    ..aI(3, _omitFieldNames ? '' : 'minorVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RuntimeEnabledSdkDependency clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RuntimeEnabledSdkDependency copyWith(
          void Function(RuntimeEnabledSdkDependency) updates) =>
      super.copyWith(
              (message) => updates(message as RuntimeEnabledSdkDependency))
          as RuntimeEnabledSdkDependency;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RuntimeEnabledSdkDependency create() =>
      RuntimeEnabledSdkDependency._();
  @$core.override
  RuntimeEnabledSdkDependency createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RuntimeEnabledSdkDependency getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RuntimeEnabledSdkDependency>(create);
  static RuntimeEnabledSdkDependency? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get packageName => $_getSZ(0);
  @$pb.TagNumber(1)
  set packageName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPackageName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPackageName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get majorVersion => $_getIZ(1);
  @$pb.TagNumber(2)
  set majorVersion($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMajorVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearMajorVersion() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get minorVersion => $_getIZ(2);
  @$pb.TagNumber(3)
  set minorVersion($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMinorVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinorVersion() => $_clearField(3);
}

class SdkModuleMetadata extends $pb.GeneratedMessage {
  factory SdkModuleMetadata({
    SdkModuleVersion? sdkModuleVersion,
    $core.String? sdkPackageName,
    $core.int? resourcesPackageId,
  }) {
    final result = create();
    if (sdkModuleVersion != null) result.sdkModuleVersion = sdkModuleVersion;
    if (sdkPackageName != null) result.sdkPackageName = sdkPackageName;
    if (resourcesPackageId != null)
      result.resourcesPackageId = resourcesPackageId;
    return result;
  }

  SdkModuleMetadata._();

  factory SdkModuleMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SdkModuleMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SdkModuleMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<SdkModuleVersion>(1, _omitFieldNames ? '' : 'sdkModuleVersion',
        subBuilder: SdkModuleVersion.create)
    ..aOS(2, _omitFieldNames ? '' : 'sdkPackageName')
    ..aI(3, _omitFieldNames ? '' : 'resourcesPackageId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkModuleMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkModuleMetadata copyWith(void Function(SdkModuleMetadata) updates) =>
      super.copyWith((message) => updates(message as SdkModuleMetadata))
          as SdkModuleMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SdkModuleMetadata create() => SdkModuleMetadata._();
  @$core.override
  SdkModuleMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SdkModuleMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SdkModuleMetadata>(create);
  static SdkModuleMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  SdkModuleVersion get sdkModuleVersion => $_getN(0);
  @$pb.TagNumber(1)
  set sdkModuleVersion(SdkModuleVersion value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSdkModuleVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearSdkModuleVersion() => $_clearField(1);
  @$pb.TagNumber(1)
  SdkModuleVersion ensureSdkModuleVersion() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get sdkPackageName => $_getSZ(1);
  @$pb.TagNumber(2)
  set sdkPackageName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSdkPackageName() => $_has(1);
  @$pb.TagNumber(2)
  void clearSdkPackageName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get resourcesPackageId => $_getIZ(2);
  @$pb.TagNumber(3)
  set resourcesPackageId($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasResourcesPackageId() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourcesPackageId() => $_clearField(3);
}

class SdkModuleVersion extends $pb.GeneratedMessage {
  factory SdkModuleVersion({
    $core.int? major,
    $core.int? minor,
    $core.int? patch,
  }) {
    final result = create();
    if (major != null) result.major = major;
    if (minor != null) result.minor = minor;
    if (patch != null) result.patch = patch;
    return result;
  }

  SdkModuleVersion._();

  factory SdkModuleVersion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SdkModuleVersion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SdkModuleVersion',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'major')
    ..aI(2, _omitFieldNames ? '' : 'minor')
    ..aI(3, _omitFieldNames ? '' : 'patch')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkModuleVersion clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkModuleVersion copyWith(void Function(SdkModuleVersion) updates) =>
      super.copyWith((message) => updates(message as SdkModuleVersion))
          as SdkModuleVersion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SdkModuleVersion create() => SdkModuleVersion._();
  @$core.override
  SdkModuleVersion createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SdkModuleVersion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SdkModuleVersion>(create);
  static SdkModuleVersion? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get major => $_getIZ(0);
  @$pb.TagNumber(1)
  set major($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMajor() => $_has(0);
  @$pb.TagNumber(1)
  void clearMajor() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get minor => $_getIZ(1);
  @$pb.TagNumber(2)
  set minor($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMinor() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinor() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get patch => $_getIZ(2);
  @$pb.TagNumber(3)
  set patch($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPatch() => $_has(2);
  @$pb.TagNumber(3)
  void clearPatch() => $_clearField(3);
}

enum ApkDescription_ApkMetadataOneofValue {
  splitApkMetadata,
  standaloneApkMetadata,
  instantApkMetadata,
  systemApkMetadata,
  assetSliceMetadata,
  apexApkMetadata,
  archivedApkMetadata,
  notSet
}

class ApkDescription extends $pb.GeneratedMessage {
  factory ApkDescription({
    ApkTargeting? targeting,
    $core.String? path,
    SplitApkMetadata? splitApkMetadata,
    StandaloneApkMetadata? standaloneApkMetadata,
    SplitApkMetadata? instantApkMetadata,
    SystemApkMetadata? systemApkMetadata,
    SplitApkMetadata? assetSliceMetadata,
    ApexApkMetadata? apexApkMetadata,
    ArchivedApkMetadata? archivedApkMetadata,
    SigningDescription? signingDescription,
  }) {
    final result = create();
    if (targeting != null) result.targeting = targeting;
    if (path != null) result.path = path;
    if (splitApkMetadata != null) result.splitApkMetadata = splitApkMetadata;
    if (standaloneApkMetadata != null)
      result.standaloneApkMetadata = standaloneApkMetadata;
    if (instantApkMetadata != null)
      result.instantApkMetadata = instantApkMetadata;
    if (systemApkMetadata != null) result.systemApkMetadata = systemApkMetadata;
    if (assetSliceMetadata != null)
      result.assetSliceMetadata = assetSliceMetadata;
    if (apexApkMetadata != null) result.apexApkMetadata = apexApkMetadata;
    if (archivedApkMetadata != null)
      result.archivedApkMetadata = archivedApkMetadata;
    if (signingDescription != null)
      result.signingDescription = signingDescription;
    return result;
  }

  ApkDescription._();

  factory ApkDescription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApkDescription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ApkDescription_ApkMetadataOneofValue>
      _ApkDescription_ApkMetadataOneofValueByTag = {
    3: ApkDescription_ApkMetadataOneofValue.splitApkMetadata,
    4: ApkDescription_ApkMetadataOneofValue.standaloneApkMetadata,
    5: ApkDescription_ApkMetadataOneofValue.instantApkMetadata,
    6: ApkDescription_ApkMetadataOneofValue.systemApkMetadata,
    7: ApkDescription_ApkMetadataOneofValue.assetSliceMetadata,
    8: ApkDescription_ApkMetadataOneofValue.apexApkMetadata,
    9: ApkDescription_ApkMetadataOneofValue.archivedApkMetadata,
    0: ApkDescription_ApkMetadataOneofValue.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApkDescription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..oo(0, [3, 4, 5, 6, 7, 8, 9])
    ..aOM<ApkTargeting>(1, _omitFieldNames ? '' : 'targeting',
        subBuilder: ApkTargeting.create)
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..aOM<SplitApkMetadata>(3, _omitFieldNames ? '' : 'splitApkMetadata',
        subBuilder: SplitApkMetadata.create)
    ..aOM<StandaloneApkMetadata>(
        4, _omitFieldNames ? '' : 'standaloneApkMetadata',
        subBuilder: StandaloneApkMetadata.create)
    ..aOM<SplitApkMetadata>(5, _omitFieldNames ? '' : 'instantApkMetadata',
        subBuilder: SplitApkMetadata.create)
    ..aOM<SystemApkMetadata>(6, _omitFieldNames ? '' : 'systemApkMetadata',
        subBuilder: SystemApkMetadata.create)
    ..aOM<SplitApkMetadata>(7, _omitFieldNames ? '' : 'assetSliceMetadata',
        subBuilder: SplitApkMetadata.create)
    ..aOM<ApexApkMetadata>(8, _omitFieldNames ? '' : 'apexApkMetadata',
        subBuilder: ApexApkMetadata.create)
    ..aOM<ArchivedApkMetadata>(9, _omitFieldNames ? '' : 'archivedApkMetadata',
        subBuilder: ArchivedApkMetadata.create)
    ..aOM<SigningDescription>(10, _omitFieldNames ? '' : 'signingDescription',
        subBuilder: SigningDescription.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApkDescription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApkDescription copyWith(void Function(ApkDescription) updates) =>
      super.copyWith((message) => updates(message as ApkDescription))
          as ApkDescription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApkDescription create() => ApkDescription._();
  @$core.override
  ApkDescription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApkDescription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApkDescription>(create);
  static ApkDescription? _defaultInstance;

  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  ApkDescription_ApkMetadataOneofValue whichApkMetadataOneofValue() =>
      _ApkDescription_ApkMetadataOneofValueByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  @$pb.TagNumber(9)
  void clearApkMetadataOneofValue() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ApkTargeting get targeting => $_getN(0);
  @$pb.TagNumber(1)
  set targeting(ApkTargeting value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTargeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargeting() => $_clearField(1);
  @$pb.TagNumber(1)
  ApkTargeting ensureTargeting() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => $_clearField(2);

  @$pb.TagNumber(3)
  SplitApkMetadata get splitApkMetadata => $_getN(2);
  @$pb.TagNumber(3)
  set splitApkMetadata(SplitApkMetadata value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSplitApkMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearSplitApkMetadata() => $_clearField(3);
  @$pb.TagNumber(3)
  SplitApkMetadata ensureSplitApkMetadata() => $_ensure(2);

  @$pb.TagNumber(4)
  StandaloneApkMetadata get standaloneApkMetadata => $_getN(3);
  @$pb.TagNumber(4)
  set standaloneApkMetadata(StandaloneApkMetadata value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStandaloneApkMetadata() => $_has(3);
  @$pb.TagNumber(4)
  void clearStandaloneApkMetadata() => $_clearField(4);
  @$pb.TagNumber(4)
  StandaloneApkMetadata ensureStandaloneApkMetadata() => $_ensure(3);

  @$pb.TagNumber(5)
  SplitApkMetadata get instantApkMetadata => $_getN(4);
  @$pb.TagNumber(5)
  set instantApkMetadata(SplitApkMetadata value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasInstantApkMetadata() => $_has(4);
  @$pb.TagNumber(5)
  void clearInstantApkMetadata() => $_clearField(5);
  @$pb.TagNumber(5)
  SplitApkMetadata ensureInstantApkMetadata() => $_ensure(4);

  @$pb.TagNumber(6)
  SystemApkMetadata get systemApkMetadata => $_getN(5);
  @$pb.TagNumber(6)
  set systemApkMetadata(SystemApkMetadata value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasSystemApkMetadata() => $_has(5);
  @$pb.TagNumber(6)
  void clearSystemApkMetadata() => $_clearField(6);
  @$pb.TagNumber(6)
  SystemApkMetadata ensureSystemApkMetadata() => $_ensure(5);

  @$pb.TagNumber(7)
  SplitApkMetadata get assetSliceMetadata => $_getN(6);
  @$pb.TagNumber(7)
  set assetSliceMetadata(SplitApkMetadata value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasAssetSliceMetadata() => $_has(6);
  @$pb.TagNumber(7)
  void clearAssetSliceMetadata() => $_clearField(7);
  @$pb.TagNumber(7)
  SplitApkMetadata ensureAssetSliceMetadata() => $_ensure(6);

  @$pb.TagNumber(8)
  ApexApkMetadata get apexApkMetadata => $_getN(7);
  @$pb.TagNumber(8)
  set apexApkMetadata(ApexApkMetadata value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasApexApkMetadata() => $_has(7);
  @$pb.TagNumber(8)
  void clearApexApkMetadata() => $_clearField(8);
  @$pb.TagNumber(8)
  ApexApkMetadata ensureApexApkMetadata() => $_ensure(7);

  @$pb.TagNumber(9)
  ArchivedApkMetadata get archivedApkMetadata => $_getN(8);
  @$pb.TagNumber(9)
  set archivedApkMetadata(ArchivedApkMetadata value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasArchivedApkMetadata() => $_has(8);
  @$pb.TagNumber(9)
  void clearArchivedApkMetadata() => $_clearField(9);
  @$pb.TagNumber(9)
  ArchivedApkMetadata ensureArchivedApkMetadata() => $_ensure(8);

  @$pb.TagNumber(10)
  SigningDescription get signingDescription => $_getN(9);
  @$pb.TagNumber(10)
  set signingDescription(SigningDescription value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasSigningDescription() => $_has(9);
  @$pb.TagNumber(10)
  void clearSigningDescription() => $_clearField(10);
  @$pb.TagNumber(10)
  SigningDescription ensureSigningDescription() => $_ensure(9);
}

class ApkTargeting extends $pb.GeneratedMessage {
  factory ApkTargeting({
    AbiTargeting? abiTargeting,
    LanguageTargeting? languageTargeting,
    ScreenDensityTargeting? screenDensityTargeting,
    SdkVersionTargeting? sdkVersionTargeting,
    TextureCompressionFormatTargeting? textureCompressionFormatTargeting,
    MultiAbiTargeting? multiAbiTargeting,
    SanitizerTargeting? sanitizerTargeting,
    @$core.Deprecated('This field is deprecated.')
    DeviceTierTargeting? deviceTierTargeting,
    @$core.Deprecated('This field is deprecated.')
    CountrySetTargeting? countrySetTargeting,
    DeviceGroupTargeting? deviceGroupTargeting,
  }) {
    final result = create();
    if (abiTargeting != null) result.abiTargeting = abiTargeting;
    if (languageTargeting != null) result.languageTargeting = languageTargeting;
    if (screenDensityTargeting != null)
      result.screenDensityTargeting = screenDensityTargeting;
    if (sdkVersionTargeting != null)
      result.sdkVersionTargeting = sdkVersionTargeting;
    if (textureCompressionFormatTargeting != null)
      result.textureCompressionFormatTargeting =
          textureCompressionFormatTargeting;
    if (multiAbiTargeting != null) result.multiAbiTargeting = multiAbiTargeting;
    if (sanitizerTargeting != null)
      result.sanitizerTargeting = sanitizerTargeting;
    if (deviceTierTargeting != null)
      result.deviceTierTargeting = deviceTierTargeting;
    if (countrySetTargeting != null)
      result.countrySetTargeting = countrySetTargeting;
    if (deviceGroupTargeting != null)
      result.deviceGroupTargeting = deviceGroupTargeting;
    return result;
  }

  ApkTargeting._();

  factory ApkTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApkTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApkTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<AbiTargeting>(1, _omitFieldNames ? '' : 'abiTargeting',
        subBuilder: AbiTargeting.create)
    ..aOM<LanguageTargeting>(3, _omitFieldNames ? '' : 'languageTargeting',
        subBuilder: LanguageTargeting.create)
    ..aOM<ScreenDensityTargeting>(
        4, _omitFieldNames ? '' : 'screenDensityTargeting',
        subBuilder: ScreenDensityTargeting.create)
    ..aOM<SdkVersionTargeting>(5, _omitFieldNames ? '' : 'sdkVersionTargeting',
        subBuilder: SdkVersionTargeting.create)
    ..aOM<TextureCompressionFormatTargeting>(
        6, _omitFieldNames ? '' : 'textureCompressionFormatTargeting',
        subBuilder: TextureCompressionFormatTargeting.create)
    ..aOM<MultiAbiTargeting>(7, _omitFieldNames ? '' : 'multiAbiTargeting',
        subBuilder: MultiAbiTargeting.create)
    ..aOM<SanitizerTargeting>(8, _omitFieldNames ? '' : 'sanitizerTargeting',
        subBuilder: SanitizerTargeting.create)
    ..aOM<DeviceTierTargeting>(9, _omitFieldNames ? '' : 'deviceTierTargeting',
        subBuilder: DeviceTierTargeting.create)
    ..aOM<CountrySetTargeting>(10, _omitFieldNames ? '' : 'countrySetTargeting',
        subBuilder: CountrySetTargeting.create)
    ..aOM<DeviceGroupTargeting>(
        11, _omitFieldNames ? '' : 'deviceGroupTargeting',
        subBuilder: DeviceGroupTargeting.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApkTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApkTargeting copyWith(void Function(ApkTargeting) updates) =>
      super.copyWith((message) => updates(message as ApkTargeting))
          as ApkTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApkTargeting create() => ApkTargeting._();
  @$core.override
  ApkTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApkTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApkTargeting>(create);
  static ApkTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  AbiTargeting get abiTargeting => $_getN(0);
  @$pb.TagNumber(1)
  set abiTargeting(AbiTargeting value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAbiTargeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearAbiTargeting() => $_clearField(1);
  @$pb.TagNumber(1)
  AbiTargeting ensureAbiTargeting() => $_ensure(0);

  @$pb.TagNumber(3)
  LanguageTargeting get languageTargeting => $_getN(1);
  @$pb.TagNumber(3)
  set languageTargeting(LanguageTargeting value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasLanguageTargeting() => $_has(1);
  @$pb.TagNumber(3)
  void clearLanguageTargeting() => $_clearField(3);
  @$pb.TagNumber(3)
  LanguageTargeting ensureLanguageTargeting() => $_ensure(1);

  @$pb.TagNumber(4)
  ScreenDensityTargeting get screenDensityTargeting => $_getN(2);
  @$pb.TagNumber(4)
  set screenDensityTargeting(ScreenDensityTargeting value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasScreenDensityTargeting() => $_has(2);
  @$pb.TagNumber(4)
  void clearScreenDensityTargeting() => $_clearField(4);
  @$pb.TagNumber(4)
  ScreenDensityTargeting ensureScreenDensityTargeting() => $_ensure(2);

  @$pb.TagNumber(5)
  SdkVersionTargeting get sdkVersionTargeting => $_getN(3);
  @$pb.TagNumber(5)
  set sdkVersionTargeting(SdkVersionTargeting value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasSdkVersionTargeting() => $_has(3);
  @$pb.TagNumber(5)
  void clearSdkVersionTargeting() => $_clearField(5);
  @$pb.TagNumber(5)
  SdkVersionTargeting ensureSdkVersionTargeting() => $_ensure(3);

  @$pb.TagNumber(6)
  TextureCompressionFormatTargeting get textureCompressionFormatTargeting =>
      $_getN(4);
  @$pb.TagNumber(6)
  set textureCompressionFormatTargeting(
          TextureCompressionFormatTargeting value) =>
      $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTextureCompressionFormatTargeting() => $_has(4);
  @$pb.TagNumber(6)
  void clearTextureCompressionFormatTargeting() => $_clearField(6);
  @$pb.TagNumber(6)
  TextureCompressionFormatTargeting ensureTextureCompressionFormatTargeting() =>
      $_ensure(4);

  @$pb.TagNumber(7)
  MultiAbiTargeting get multiAbiTargeting => $_getN(5);
  @$pb.TagNumber(7)
  set multiAbiTargeting(MultiAbiTargeting value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasMultiAbiTargeting() => $_has(5);
  @$pb.TagNumber(7)
  void clearMultiAbiTargeting() => $_clearField(7);
  @$pb.TagNumber(7)
  MultiAbiTargeting ensureMultiAbiTargeting() => $_ensure(5);

  @$pb.TagNumber(8)
  SanitizerTargeting get sanitizerTargeting => $_getN(6);
  @$pb.TagNumber(8)
  set sanitizerTargeting(SanitizerTargeting value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasSanitizerTargeting() => $_has(6);
  @$pb.TagNumber(8)
  void clearSanitizerTargeting() => $_clearField(8);
  @$pb.TagNumber(8)
  SanitizerTargeting ensureSanitizerTargeting() => $_ensure(6);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  DeviceTierTargeting get deviceTierTargeting => $_getN(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  set deviceTierTargeting(DeviceTierTargeting value) => $_setField(9, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  $core.bool hasDeviceTierTargeting() => $_has(7);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  void clearDeviceTierTargeting() => $_clearField(9);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(9)
  DeviceTierTargeting ensureDeviceTierTargeting() => $_ensure(7);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  CountrySetTargeting get countrySetTargeting => $_getN(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  set countrySetTargeting(CountrySetTargeting value) => $_setField(10, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  $core.bool hasCountrySetTargeting() => $_has(8);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  void clearCountrySetTargeting() => $_clearField(10);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(10)
  CountrySetTargeting ensureCountrySetTargeting() => $_ensure(8);

  @$pb.TagNumber(11)
  DeviceGroupTargeting get deviceGroupTargeting => $_getN(9);
  @$pb.TagNumber(11)
  set deviceGroupTargeting(DeviceGroupTargeting value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasDeviceGroupTargeting() => $_has(9);
  @$pb.TagNumber(11)
  void clearDeviceGroupTargeting() => $_clearField(11);
  @$pb.TagNumber(11)
  DeviceGroupTargeting ensureDeviceGroupTargeting() => $_ensure(9);
}

class SplitApkMetadata extends $pb.GeneratedMessage {
  factory SplitApkMetadata({
    $core.String? splitId,
    $core.bool? isMasterSplit,
  }) {
    final result = create();
    if (splitId != null) result.splitId = splitId;
    if (isMasterSplit != null) result.isMasterSplit = isMasterSplit;
    return result;
  }

  SplitApkMetadata._();

  factory SplitApkMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SplitApkMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SplitApkMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'splitId')
    ..aOB(2, _omitFieldNames ? '' : 'isMasterSplit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SplitApkMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SplitApkMetadata copyWith(void Function(SplitApkMetadata) updates) =>
      super.copyWith((message) => updates(message as SplitApkMetadata))
          as SplitApkMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SplitApkMetadata create() => SplitApkMetadata._();
  @$core.override
  SplitApkMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SplitApkMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SplitApkMetadata>(create);
  static SplitApkMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get splitId => $_getSZ(0);
  @$pb.TagNumber(1)
  set splitId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSplitId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSplitId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isMasterSplit => $_getBF(1);
  @$pb.TagNumber(2)
  set isMasterSplit($core.bool value) => $_setBool(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIsMasterSplit() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsMasterSplit() => $_clearField(2);
}

class StandaloneApkMetadata extends $pb.GeneratedMessage {
  factory StandaloneApkMetadata({
    $core.Iterable<$core.String>? fusedModuleName,
    $core.String? splitId,
  }) {
    final result = create();
    if (fusedModuleName != null) result.fusedModuleName.addAll(fusedModuleName);
    if (splitId != null) result.splitId = splitId;
    return result;
  }

  StandaloneApkMetadata._();

  factory StandaloneApkMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StandaloneApkMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StandaloneApkMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'fusedModuleName')
    ..aOS(3, _omitFieldNames ? '' : 'splitId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StandaloneApkMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StandaloneApkMetadata copyWith(
          void Function(StandaloneApkMetadata) updates) =>
      super.copyWith((message) => updates(message as StandaloneApkMetadata))
          as StandaloneApkMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StandaloneApkMetadata create() => StandaloneApkMetadata._();
  @$core.override
  StandaloneApkMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static StandaloneApkMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StandaloneApkMetadata>(create);
  static StandaloneApkMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get fusedModuleName => $_getList(0);

  @$pb.TagNumber(3)
  $core.String get splitId => $_getSZ(1);
  @$pb.TagNumber(3)
  set splitId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasSplitId() => $_has(1);
  @$pb.TagNumber(3)
  void clearSplitId() => $_clearField(3);
}

class SystemApkMetadata extends $pb.GeneratedMessage {
  factory SystemApkMetadata({
    $core.Iterable<$core.String>? fusedModuleName,
  }) {
    final result = create();
    if (fusedModuleName != null) result.fusedModuleName.addAll(fusedModuleName);
    return result;
  }

  SystemApkMetadata._();

  factory SystemApkMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SystemApkMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SystemApkMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'fusedModuleName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemApkMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SystemApkMetadata copyWith(void Function(SystemApkMetadata) updates) =>
      super.copyWith((message) => updates(message as SystemApkMetadata))
          as SystemApkMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SystemApkMetadata create() => SystemApkMetadata._();
  @$core.override
  SystemApkMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SystemApkMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SystemApkMetadata>(create);
  static SystemApkMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get fusedModuleName => $_getList(0);
}

class ApexApkMetadata extends $pb.GeneratedMessage {
  factory ApexApkMetadata({
    $core.Iterable<ApexEmbeddedApkConfig>? apexEmbeddedApkConfig,
  }) {
    final result = create();
    if (apexEmbeddedApkConfig != null)
      result.apexEmbeddedApkConfig.addAll(apexEmbeddedApkConfig);
    return result;
  }

  ApexApkMetadata._();

  factory ApexApkMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApexApkMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApexApkMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<ApexEmbeddedApkConfig>(
        1, _omitFieldNames ? '' : 'apexEmbeddedApkConfig',
        subBuilder: ApexEmbeddedApkConfig.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApexApkMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApexApkMetadata copyWith(void Function(ApexApkMetadata) updates) =>
      super.copyWith((message) => updates(message as ApexApkMetadata))
          as ApexApkMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApexApkMetadata create() => ApexApkMetadata._();
  @$core.override
  ApexApkMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApexApkMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApexApkMetadata>(create);
  static ApexApkMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ApexEmbeddedApkConfig> get apexEmbeddedApkConfig => $_getList(0);
}

class ApexEmbeddedApkConfig extends $pb.GeneratedMessage {
  factory ApexEmbeddedApkConfig({
    $core.String? packageName,
    $core.String? path,
  }) {
    final result = create();
    if (packageName != null) result.packageName = packageName;
    if (path != null) result.path = path;
    return result;
  }

  ApexEmbeddedApkConfig._();

  factory ApexEmbeddedApkConfig.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ApexEmbeddedApkConfig.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ApexEmbeddedApkConfig',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'packageName')
    ..aOS(2, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApexEmbeddedApkConfig clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ApexEmbeddedApkConfig copyWith(
          void Function(ApexEmbeddedApkConfig) updates) =>
      super.copyWith((message) => updates(message as ApexEmbeddedApkConfig))
          as ApexEmbeddedApkConfig;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ApexEmbeddedApkConfig create() => ApexEmbeddedApkConfig._();
  @$core.override
  ApexEmbeddedApkConfig createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ApexEmbeddedApkConfig getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ApexEmbeddedApkConfig>(create);
  static ApexEmbeddedApkConfig? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get packageName => $_getSZ(0);
  @$pb.TagNumber(1)
  set packageName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPackageName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPackageName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => $_clearField(2);
}

class ArchivedApkMetadata extends $pb.GeneratedMessage {
  factory ArchivedApkMetadata() => create();

  ArchivedApkMetadata._();

  factory ArchivedApkMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArchivedApkMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArchivedApkMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArchivedApkMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArchivedApkMetadata copyWith(void Function(ArchivedApkMetadata) updates) =>
      super.copyWith((message) => updates(message as ArchivedApkMetadata))
          as ArchivedApkMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArchivedApkMetadata create() => ArchivedApkMetadata._();
  @$core.override
  ArchivedApkMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArchivedApkMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArchivedApkMetadata>(create);
  static ArchivedApkMetadata? _defaultInstance;
}

class SigningDescription extends $pb.GeneratedMessage {
  factory SigningDescription({
    $core.bool? signedWithRotatedKey,
  }) {
    final result = create();
    if (signedWithRotatedKey != null)
      result.signedWithRotatedKey = signedWithRotatedKey;
    return result;
  }

  SigningDescription._();

  factory SigningDescription.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SigningDescription.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SigningDescription',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'signedWithRotatedKey')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningDescription clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SigningDescription copyWith(void Function(SigningDescription) updates) =>
      super.copyWith((message) => updates(message as SigningDescription))
          as SigningDescription;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SigningDescription create() => SigningDescription._();
  @$core.override
  SigningDescription createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SigningDescription getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SigningDescription>(create);
  static SigningDescription? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get signedWithRotatedKey => $_getBF(0);
  @$pb.TagNumber(1)
  set signedWithRotatedKey($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSignedWithRotatedKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSignedWithRotatedKey() => $_clearField(1);
}

class AbiTargeting extends $pb.GeneratedMessage {
  factory AbiTargeting({
    $core.Iterable<Abi>? value,
    $core.Iterable<Abi>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  AbiTargeting._();

  factory AbiTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AbiTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AbiTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<Abi>(1, _omitFieldNames ? '' : 'value', subBuilder: Abi.create)
    ..pPM<Abi>(2, _omitFieldNames ? '' : 'alternatives', subBuilder: Abi.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AbiTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AbiTargeting copyWith(void Function(AbiTargeting) updates) =>
      super.copyWith((message) => updates(message as AbiTargeting))
          as AbiTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AbiTargeting create() => AbiTargeting._();
  @$core.override
  AbiTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AbiTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AbiTargeting>(create);
  static AbiTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Abi> get value => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<Abi> get alternatives => $_getList(1);
}

class Abi extends $pb.GeneratedMessage {
  factory Abi({
    Abi_AbiAlias? alias,
  }) {
    final result = create();
    if (alias != null) result.alias = alias;
    return result;
  }

  Abi._();

  factory Abi.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Abi.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Abi',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aE<Abi_AbiAlias>(1, _omitFieldNames ? '' : 'alias',
        enumValues: Abi_AbiAlias.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Abi clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Abi copyWith(void Function(Abi) updates) =>
      super.copyWith((message) => updates(message as Abi)) as Abi;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Abi create() => Abi._();
  @$core.override
  Abi createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Abi getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Abi>(create);
  static Abi? _defaultInstance;

  @$pb.TagNumber(1)
  Abi_AbiAlias get alias => $_getN(0);
  @$pb.TagNumber(1)
  set alias(Abi_AbiAlias value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAlias() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlias() => $_clearField(1);
}

class ScreenDensityTargeting extends $pb.GeneratedMessage {
  factory ScreenDensityTargeting({
    $core.Iterable<ScreenDensity>? value,
    $core.Iterable<ScreenDensity>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  ScreenDensityTargeting._();

  factory ScreenDensityTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScreenDensityTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScreenDensityTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<ScreenDensity>(1, _omitFieldNames ? '' : 'value',
        subBuilder: ScreenDensity.create)
    ..pPM<ScreenDensity>(2, _omitFieldNames ? '' : 'alternatives',
        subBuilder: ScreenDensity.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScreenDensityTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScreenDensityTargeting copyWith(
          void Function(ScreenDensityTargeting) updates) =>
      super.copyWith((message) => updates(message as ScreenDensityTargeting))
          as ScreenDensityTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScreenDensityTargeting create() => ScreenDensityTargeting._();
  @$core.override
  ScreenDensityTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScreenDensityTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenDensityTargeting>(create);
  static ScreenDensityTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ScreenDensity> get value => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<ScreenDensity> get alternatives => $_getList(1);
}

enum ScreenDensity_DensityOneof { densityAlias, densityDpi, notSet }

class ScreenDensity extends $pb.GeneratedMessage {
  factory ScreenDensity({
    ScreenDensity_DensityAlias? densityAlias,
    $core.int? densityDpi,
  }) {
    final result = create();
    if (densityAlias != null) result.densityAlias = densityAlias;
    if (densityDpi != null) result.densityDpi = densityDpi;
    return result;
  }

  ScreenDensity._();

  factory ScreenDensity.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ScreenDensity.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ScreenDensity_DensityOneof>
      _ScreenDensity_DensityOneofByTag = {
    1: ScreenDensity_DensityOneof.densityAlias,
    2: ScreenDensity_DensityOneof.densityDpi,
    0: ScreenDensity_DensityOneof.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ScreenDensity',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aE<ScreenDensity_DensityAlias>(1, _omitFieldNames ? '' : 'densityAlias',
        enumValues: ScreenDensity_DensityAlias.values)
    ..aI(2, _omitFieldNames ? '' : 'densityDpi')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScreenDensity clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ScreenDensity copyWith(void Function(ScreenDensity) updates) =>
      super.copyWith((message) => updates(message as ScreenDensity))
          as ScreenDensity;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ScreenDensity create() => ScreenDensity._();
  @$core.override
  ScreenDensity createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ScreenDensity getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ScreenDensity>(create);
  static ScreenDensity? _defaultInstance;

  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  ScreenDensity_DensityOneof whichDensityOneof() =>
      _ScreenDensity_DensityOneofByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(1)
  @$pb.TagNumber(2)
  void clearDensityOneof() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ScreenDensity_DensityAlias get densityAlias => $_getN(0);
  @$pb.TagNumber(1)
  set densityAlias(ScreenDensity_DensityAlias value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasDensityAlias() => $_has(0);
  @$pb.TagNumber(1)
  void clearDensityAlias() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get densityDpi => $_getIZ(1);
  @$pb.TagNumber(2)
  set densityDpi($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDensityDpi() => $_has(1);
  @$pb.TagNumber(2)
  void clearDensityDpi() => $_clearField(2);
}

class LanguageTargeting extends $pb.GeneratedMessage {
  factory LanguageTargeting({
    $core.Iterable<$core.String>? value,
    $core.Iterable<$core.String>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  LanguageTargeting._();

  factory LanguageTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LanguageTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LanguageTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'value')
    ..pPS(2, _omitFieldNames ? '' : 'alternatives')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LanguageTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LanguageTargeting copyWith(void Function(LanguageTargeting) updates) =>
      super.copyWith((message) => updates(message as LanguageTargeting))
          as LanguageTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LanguageTargeting create() => LanguageTargeting._();
  @$core.override
  LanguageTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LanguageTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LanguageTargeting>(create);
  static LanguageTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get value => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get alternatives => $_getList(1);
}

class TextureCompressionFormatTargeting extends $pb.GeneratedMessage {
  factory TextureCompressionFormatTargeting({
    $core.Iterable<TextureCompressionFormat>? value,
    $core.Iterable<TextureCompressionFormat>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  TextureCompressionFormatTargeting._();

  factory TextureCompressionFormatTargeting.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextureCompressionFormatTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextureCompressionFormatTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<TextureCompressionFormat>(1, _omitFieldNames ? '' : 'value',
        subBuilder: TextureCompressionFormat.create)
    ..pPM<TextureCompressionFormat>(2, _omitFieldNames ? '' : 'alternatives',
        subBuilder: TextureCompressionFormat.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextureCompressionFormatTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextureCompressionFormatTargeting copyWith(
          void Function(TextureCompressionFormatTargeting) updates) =>
      super.copyWith((message) =>
              updates(message as TextureCompressionFormatTargeting))
          as TextureCompressionFormatTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextureCompressionFormatTargeting create() =>
      TextureCompressionFormatTargeting._();
  @$core.override
  TextureCompressionFormatTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextureCompressionFormatTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextureCompressionFormatTargeting>(
          create);
  static TextureCompressionFormatTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<TextureCompressionFormat> get value => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<TextureCompressionFormat> get alternatives => $_getList(1);
}

class TextureCompressionFormat extends $pb.GeneratedMessage {
  factory TextureCompressionFormat({
    TextureCompressionFormat_TextureCompressionFormatAlias? alias,
  }) {
    final result = create();
    if (alias != null) result.alias = alias;
    return result;
  }

  TextureCompressionFormat._();

  factory TextureCompressionFormat.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextureCompressionFormat.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextureCompressionFormat',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aE<TextureCompressionFormat_TextureCompressionFormatAlias>(
        1, _omitFieldNames ? '' : 'alias',
        enumValues:
            TextureCompressionFormat_TextureCompressionFormatAlias.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextureCompressionFormat clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextureCompressionFormat copyWith(
          void Function(TextureCompressionFormat) updates) =>
      super.copyWith((message) => updates(message as TextureCompressionFormat))
          as TextureCompressionFormat;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextureCompressionFormat create() => TextureCompressionFormat._();
  @$core.override
  TextureCompressionFormat createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextureCompressionFormat getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextureCompressionFormat>(create);
  static TextureCompressionFormat? _defaultInstance;

  @$pb.TagNumber(1)
  TextureCompressionFormat_TextureCompressionFormatAlias get alias => $_getN(0);
  @$pb.TagNumber(1)
  set alias(TextureCompressionFormat_TextureCompressionFormatAlias value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAlias() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlias() => $_clearField(1);
}

class MultiAbiTargeting extends $pb.GeneratedMessage {
  factory MultiAbiTargeting({
    $core.Iterable<MultiAbi>? value,
    $core.Iterable<MultiAbi>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  MultiAbiTargeting._();

  factory MultiAbiTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultiAbiTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultiAbiTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<MultiAbi>(1, _omitFieldNames ? '' : 'value',
        subBuilder: MultiAbi.create)
    ..pPM<MultiAbi>(2, _omitFieldNames ? '' : 'alternatives',
        subBuilder: MultiAbi.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiAbiTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiAbiTargeting copyWith(void Function(MultiAbiTargeting) updates) =>
      super.copyWith((message) => updates(message as MultiAbiTargeting))
          as MultiAbiTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiAbiTargeting create() => MultiAbiTargeting._();
  @$core.override
  MultiAbiTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MultiAbiTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MultiAbiTargeting>(create);
  static MultiAbiTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<MultiAbi> get value => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<MultiAbi> get alternatives => $_getList(1);
}

class MultiAbi extends $pb.GeneratedMessage {
  factory MultiAbi({
    $core.Iterable<Abi>? abi,
  }) {
    final result = create();
    if (abi != null) result.abi.addAll(abi);
    return result;
  }

  MultiAbi._();

  factory MultiAbi.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory MultiAbi.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MultiAbi',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<Abi>(1, _omitFieldNames ? '' : 'abi', subBuilder: Abi.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiAbi clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  MultiAbi copyWith(void Function(MultiAbi) updates) =>
      super.copyWith((message) => updates(message as MultiAbi)) as MultiAbi;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MultiAbi create() => MultiAbi._();
  @$core.override
  MultiAbi createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static MultiAbi getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MultiAbi>(create);
  static MultiAbi? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Abi> get abi => $_getList(0);
}

class SdkVersionTargeting extends $pb.GeneratedMessage {
  factory SdkVersionTargeting({
    $core.Iterable<SdkVersion>? value,
    $core.Iterable<SdkVersion>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  SdkVersionTargeting._();

  factory SdkVersionTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SdkVersionTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SdkVersionTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<SdkVersion>(1, _omitFieldNames ? '' : 'value',
        subBuilder: SdkVersion.create)
    ..pPM<SdkVersion>(2, _omitFieldNames ? '' : 'alternatives',
        subBuilder: SdkVersion.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkVersionTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkVersionTargeting copyWith(void Function(SdkVersionTargeting) updates) =>
      super.copyWith((message) => updates(message as SdkVersionTargeting))
          as SdkVersionTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SdkVersionTargeting create() => SdkVersionTargeting._();
  @$core.override
  SdkVersionTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SdkVersionTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SdkVersionTargeting>(create);
  static SdkVersionTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SdkVersion> get value => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<SdkVersion> get alternatives => $_getList(1);
}

class SdkVersion extends $pb.GeneratedMessage {
  factory SdkVersion({
    Int32Value? min,
  }) {
    final result = create();
    if (min != null) result.min = min;
    return result;
  }

  SdkVersion._();

  factory SdkVersion.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SdkVersion.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SdkVersion',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<Int32Value>(1, _omitFieldNames ? '' : 'min',
        subBuilder: Int32Value.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkVersion clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SdkVersion copyWith(void Function(SdkVersion) updates) =>
      super.copyWith((message) => updates(message as SdkVersion)) as SdkVersion;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SdkVersion create() => SdkVersion._();
  @$core.override
  SdkVersion createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SdkVersion getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SdkVersion>(create);
  static SdkVersion? _defaultInstance;

  @$pb.TagNumber(1)
  Int32Value get min => $_getN(0);
  @$pb.TagNumber(1)
  set min(Int32Value value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMin() => $_has(0);
  @$pb.TagNumber(1)
  void clearMin() => $_clearField(1);
  @$pb.TagNumber(1)
  Int32Value ensureMin() => $_ensure(0);
}

class DeviceTierTargeting extends $pb.GeneratedMessage {
  factory DeviceTierTargeting({
    $core.Iterable<Int32Value>? value,
    $core.Iterable<Int32Value>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  DeviceTierTargeting._();

  factory DeviceTierTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceTierTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceTierTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<Int32Value>(3, _omitFieldNames ? '' : 'value',
        subBuilder: Int32Value.create)
    ..pPM<Int32Value>(4, _omitFieldNames ? '' : 'alternatives',
        subBuilder: Int32Value.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceTierTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceTierTargeting copyWith(void Function(DeviceTierTargeting) updates) =>
      super.copyWith((message) => updates(message as DeviceTierTargeting))
          as DeviceTierTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceTierTargeting create() => DeviceTierTargeting._();
  @$core.override
  DeviceTierTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceTierTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceTierTargeting>(create);
  static DeviceTierTargeting? _defaultInstance;

  @$pb.TagNumber(3)
  $pb.PbList<Int32Value> get value => $_getList(0);

  @$pb.TagNumber(4)
  $pb.PbList<Int32Value> get alternatives => $_getList(1);
}

class CountrySetTargeting extends $pb.GeneratedMessage {
  factory CountrySetTargeting({
    $core.Iterable<$core.String>? value,
    $core.Iterable<$core.String>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  CountrySetTargeting._();

  factory CountrySetTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CountrySetTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CountrySetTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'value')
    ..pPS(2, _omitFieldNames ? '' : 'alternatives')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CountrySetTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CountrySetTargeting copyWith(void Function(CountrySetTargeting) updates) =>
      super.copyWith((message) => updates(message as CountrySetTargeting))
          as CountrySetTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CountrySetTargeting create() => CountrySetTargeting._();
  @$core.override
  CountrySetTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CountrySetTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CountrySetTargeting>(create);
  static CountrySetTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get value => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get alternatives => $_getList(1);
}

class DeviceGroupTargeting extends $pb.GeneratedMessage {
  factory DeviceGroupTargeting({
    $core.Iterable<$core.String>? value,
    $core.Iterable<$core.String>? alternatives,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    if (alternatives != null) result.alternatives.addAll(alternatives);
    return result;
  }

  DeviceGroupTargeting._();

  factory DeviceGroupTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeviceGroupTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeviceGroupTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'value')
    ..pPS(2, _omitFieldNames ? '' : 'alternatives')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceGroupTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeviceGroupTargeting copyWith(void Function(DeviceGroupTargeting) updates) =>
      super.copyWith((message) => updates(message as DeviceGroupTargeting))
          as DeviceGroupTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeviceGroupTargeting create() => DeviceGroupTargeting._();
  @$core.override
  DeviceGroupTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static DeviceGroupTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeviceGroupTargeting>(create);
  static DeviceGroupTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.String> get value => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get alternatives => $_getList(1);
}

class SanitizerTargeting extends $pb.GeneratedMessage {
  factory SanitizerTargeting({
    $core.Iterable<Sanitizer>? value,
  }) {
    final result = create();
    if (value != null) result.value.addAll(value);
    return result;
  }

  SanitizerTargeting._();

  factory SanitizerTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SanitizerTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SanitizerTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..pPM<Sanitizer>(1, _omitFieldNames ? '' : 'value',
        subBuilder: Sanitizer.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SanitizerTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SanitizerTargeting copyWith(void Function(SanitizerTargeting) updates) =>
      super.copyWith((message) => updates(message as SanitizerTargeting))
          as SanitizerTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SanitizerTargeting create() => SanitizerTargeting._();
  @$core.override
  SanitizerTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SanitizerTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SanitizerTargeting>(create);
  static SanitizerTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Sanitizer> get value => $_getList(0);
}

class Sanitizer extends $pb.GeneratedMessage {
  factory Sanitizer({
    Sanitizer_SanitizerAlias? alias,
  }) {
    final result = create();
    if (alias != null) result.alias = alias;
    return result;
  }

  Sanitizer._();

  factory Sanitizer.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Sanitizer.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Sanitizer',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aE<Sanitizer_SanitizerAlias>(1, _omitFieldNames ? '' : 'alias',
        enumValues: Sanitizer_SanitizerAlias.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sanitizer clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Sanitizer copyWith(void Function(Sanitizer) updates) =>
      super.copyWith((message) => updates(message as Sanitizer)) as Sanitizer;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Sanitizer create() => Sanitizer._();
  @$core.override
  Sanitizer createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Sanitizer getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Sanitizer>(create);
  static Sanitizer? _defaultInstance;

  @$pb.TagNumber(1)
  Sanitizer_SanitizerAlias get alias => $_getN(0);
  @$pb.TagNumber(1)
  set alias(Sanitizer_SanitizerAlias value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasAlias() => $_has(0);
  @$pb.TagNumber(1)
  void clearAlias() => $_clearField(1);
}

class Int32Value extends $pb.GeneratedMessage {
  factory Int32Value({
    $core.int? value,
  }) {
    final result = create();
    if (value != null) result.value = value;
    return result;
  }

  Int32Value._();

  factory Int32Value.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Int32Value.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Int32Value',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Int32Value clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Int32Value copyWith(void Function(Int32Value) updates) =>
      super.copyWith((message) => updates(message as Int32Value)) as Int32Value;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Int32Value create() => Int32Value._();
  @$core.override
  Int32Value createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Int32Value getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Int32Value>(create);
  static Int32Value? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get value => $_getIZ(0);
  @$pb.TagNumber(1)
  set value($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearValue() => $_clearField(1);
}

class AssetModuleTargeting extends $pb.GeneratedMessage {
  factory AssetModuleTargeting({
    UserCountriesTargeting? userCountriesTargeting,
    DeviceGroupModuleTargeting? deviceGroupTargeting,
  }) {
    final result = create();
    if (userCountriesTargeting != null)
      result.userCountriesTargeting = userCountriesTargeting;
    if (deviceGroupTargeting != null)
      result.deviceGroupTargeting = deviceGroupTargeting;
    return result;
  }

  AssetModuleTargeting._();

  factory AssetModuleTargeting.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetModuleTargeting.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetModuleTargeting',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOM<UserCountriesTargeting>(
        1, _omitFieldNames ? '' : 'userCountriesTargeting',
        subBuilder: UserCountriesTargeting.create)
    ..aOM<DeviceGroupModuleTargeting>(
        2, _omitFieldNames ? '' : 'deviceGroupTargeting',
        subBuilder: DeviceGroupModuleTargeting.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetModuleTargeting clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetModuleTargeting copyWith(void Function(AssetModuleTargeting) updates) =>
      super.copyWith((message) => updates(message as AssetModuleTargeting))
          as AssetModuleTargeting;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetModuleTargeting create() => AssetModuleTargeting._();
  @$core.override
  AssetModuleTargeting createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetModuleTargeting getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssetModuleTargeting>(create);
  static AssetModuleTargeting? _defaultInstance;

  @$pb.TagNumber(1)
  UserCountriesTargeting get userCountriesTargeting => $_getN(0);
  @$pb.TagNumber(1)
  set userCountriesTargeting(UserCountriesTargeting value) =>
      $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUserCountriesTargeting() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserCountriesTargeting() => $_clearField(1);
  @$pb.TagNumber(1)
  UserCountriesTargeting ensureUserCountriesTargeting() => $_ensure(0);

  @$pb.TagNumber(2)
  DeviceGroupModuleTargeting get deviceGroupTargeting => $_getN(1);
  @$pb.TagNumber(2)
  set deviceGroupTargeting(DeviceGroupModuleTargeting value) =>
      $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDeviceGroupTargeting() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeviceGroupTargeting() => $_clearField(2);
  @$pb.TagNumber(2)
  DeviceGroupModuleTargeting ensureDeviceGroupTargeting() => $_ensure(1);
}

class AssetModuleMetadata extends $pb.GeneratedMessage {
  factory AssetModuleMetadata({
    $core.String? name,
    @$core.Deprecated('This field is deprecated.')
    $core.bool? onDemandDeprecated,
    InstantMetadata? instantMetadata,
    DeliveryType? deliveryType,
    AssetModuleType? assetModuleType,
    AssetModuleTargeting? targeting,
  }) {
    final result = create();
    if (name != null) result.name = name;
    if (onDemandDeprecated != null)
      result.onDemandDeprecated = onDemandDeprecated;
    if (instantMetadata != null) result.instantMetadata = instantMetadata;
    if (deliveryType != null) result.deliveryType = deliveryType;
    if (assetModuleType != null) result.assetModuleType = assetModuleType;
    if (targeting != null) result.targeting = targeting;
    return result;
  }

  AssetModuleMetadata._();

  factory AssetModuleMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssetModuleMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssetModuleMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOB(2, _omitFieldNames ? '' : 'onDemandDeprecated')
    ..aOM<InstantMetadata>(3, _omitFieldNames ? '' : 'instantMetadata',
        subBuilder: InstantMetadata.create)
    ..aE<DeliveryType>(4, _omitFieldNames ? '' : 'deliveryType',
        enumValues: DeliveryType.values)
    ..aE<AssetModuleType>(5, _omitFieldNames ? '' : 'assetModuleType',
        enumValues: AssetModuleType.values)
    ..aOM<AssetModuleTargeting>(6, _omitFieldNames ? '' : 'targeting',
        subBuilder: AssetModuleTargeting.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetModuleMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssetModuleMetadata copyWith(void Function(AssetModuleMetadata) updates) =>
      super.copyWith((message) => updates(message as AssetModuleMetadata))
          as AssetModuleMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetModuleMetadata create() => AssetModuleMetadata._();
  @$core.override
  AssetModuleMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AssetModuleMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssetModuleMetadata>(create);
  static AssetModuleMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool get onDemandDeprecated => $_getBF(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set onDemandDeprecated($core.bool value) => $_setBool(1, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasOnDemandDeprecated() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearOnDemandDeprecated() => $_clearField(2);

  @$pb.TagNumber(3)
  InstantMetadata get instantMetadata => $_getN(2);
  @$pb.TagNumber(3)
  set instantMetadata(InstantMetadata value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInstantMetadata() => $_has(2);
  @$pb.TagNumber(3)
  void clearInstantMetadata() => $_clearField(3);
  @$pb.TagNumber(3)
  InstantMetadata ensureInstantMetadata() => $_ensure(2);

  @$pb.TagNumber(4)
  DeliveryType get deliveryType => $_getN(3);
  @$pb.TagNumber(4)
  set deliveryType(DeliveryType value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasDeliveryType() => $_has(3);
  @$pb.TagNumber(4)
  void clearDeliveryType() => $_clearField(4);

  @$pb.TagNumber(5)
  AssetModuleType get assetModuleType => $_getN(4);
  @$pb.TagNumber(5)
  set assetModuleType(AssetModuleType value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasAssetModuleType() => $_has(4);
  @$pb.TagNumber(5)
  void clearAssetModuleType() => $_clearField(5);

  @$pb.TagNumber(6)
  AssetModuleTargeting get targeting => $_getN(5);
  @$pb.TagNumber(6)
  set targeting(AssetModuleTargeting value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasTargeting() => $_has(5);
  @$pb.TagNumber(6)
  void clearTargeting() => $_clearField(6);
  @$pb.TagNumber(6)
  AssetModuleTargeting ensureTargeting() => $_ensure(5);
}

class InstantMetadata extends $pb.GeneratedMessage {
  factory InstantMetadata({
    $core.bool? isInstant,
    @$core.Deprecated('This field is deprecated.')
    $core.bool? onDemandDeprecated,
    DeliveryType? deliveryType,
  }) {
    final result = create();
    if (isInstant != null) result.isInstant = isInstant;
    if (onDemandDeprecated != null)
      result.onDemandDeprecated = onDemandDeprecated;
    if (deliveryType != null) result.deliveryType = deliveryType;
    return result;
  }

  InstantMetadata._();

  factory InstantMetadata.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InstantMetadata.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InstantMetadata',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'proto'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isInstant')
    ..aOB(2, _omitFieldNames ? '' : 'onDemandDeprecated')
    ..aE<DeliveryType>(3, _omitFieldNames ? '' : 'deliveryType',
        enumValues: DeliveryType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstantMetadata clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstantMetadata copyWith(void Function(InstantMetadata) updates) =>
      super.copyWith((message) => updates(message as InstantMetadata))
          as InstantMetadata;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InstantMetadata create() => InstantMetadata._();
  @$core.override
  InstantMetadata createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InstantMetadata getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InstantMetadata>(create);
  static InstantMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isInstant => $_getBF(0);
  @$pb.TagNumber(1)
  set isInstant($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsInstant() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsInstant() => $_clearField(1);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool get onDemandDeprecated => $_getBF(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  set onDemandDeprecated($core.bool value) => $_setBool(1, value);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  $core.bool hasOnDemandDeprecated() => $_has(1);
  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(2)
  void clearOnDemandDeprecated() => $_clearField(2);

  @$pb.TagNumber(3)
  DeliveryType get deliveryType => $_getN(2);
  @$pb.TagNumber(3)
  set deliveryType(DeliveryType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDeliveryType() => $_has(2);
  @$pb.TagNumber(3)
  void clearDeliveryType() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
