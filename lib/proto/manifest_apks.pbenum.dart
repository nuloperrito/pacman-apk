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

import 'package:protobuf/protobuf.dart' as $pb;

class FeatureModuleType extends $pb.ProtobufEnum {
  static const FeatureModuleType UNKNOWN_MODULE_TYPE =
      FeatureModuleType._(0, _omitEnumNames ? '' : 'UNKNOWN_MODULE_TYPE');
  static const FeatureModuleType FEATURE_MODULE =
      FeatureModuleType._(1, _omitEnumNames ? '' : 'FEATURE_MODULE');
  static const FeatureModuleType ML_MODULE =
      FeatureModuleType._(2, _omitEnumNames ? '' : 'ML_MODULE');
  static const FeatureModuleType SDK_MODULE =
      FeatureModuleType._(3, _omitEnumNames ? '' : 'SDK_MODULE');

  static const $core.List<FeatureModuleType> values = <FeatureModuleType>[
    UNKNOWN_MODULE_TYPE,
    FEATURE_MODULE,
    ML_MODULE,
    SDK_MODULE,
  ];

  static final $core.List<FeatureModuleType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static FeatureModuleType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const FeatureModuleType._(super.value, super.name);
}

class DeliveryType extends $pb.ProtobufEnum {
  static const DeliveryType UNKNOWN_DELIVERY_TYPE =
      DeliveryType._(0, _omitEnumNames ? '' : 'UNKNOWN_DELIVERY_TYPE');
  static const DeliveryType INSTALL_TIME =
      DeliveryType._(1, _omitEnumNames ? '' : 'INSTALL_TIME');
  static const DeliveryType ON_DEMAND =
      DeliveryType._(2, _omitEnumNames ? '' : 'ON_DEMAND');
  static const DeliveryType FAST_FOLLOW =
      DeliveryType._(3, _omitEnumNames ? '' : 'FAST_FOLLOW');

  static const $core.List<DeliveryType> values = <DeliveryType>[
    UNKNOWN_DELIVERY_TYPE,
    INSTALL_TIME,
    ON_DEMAND,
    FAST_FOLLOW,
  ];

  static final $core.List<DeliveryType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static DeliveryType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeliveryType._(super.value, super.name);
}

class AssetModuleType extends $pb.ProtobufEnum {
  static const AssetModuleType UNKNOWN_ASSET_TYPE =
      AssetModuleType._(0, _omitEnumNames ? '' : 'UNKNOWN_ASSET_TYPE');
  static const AssetModuleType DEFAULT_ASSET_TYPE =
      AssetModuleType._(1, _omitEnumNames ? '' : 'DEFAULT_ASSET_TYPE');
  static const AssetModuleType AI_PACK_TYPE =
      AssetModuleType._(2, _omitEnumNames ? '' : 'AI_PACK_TYPE');

  static const $core.List<AssetModuleType> values = <AssetModuleType>[
    UNKNOWN_ASSET_TYPE,
    DEFAULT_ASSET_TYPE,
    AI_PACK_TYPE,
  ];

  static final $core.List<AssetModuleType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static AssetModuleType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AssetModuleType._(super.value, super.name);
}

class Abi_AbiAlias extends $pb.ProtobufEnum {
  static const Abi_AbiAlias UNSPECIFIED_CPU_ARCHITECTURE =
      Abi_AbiAlias._(0, _omitEnumNames ? '' : 'UNSPECIFIED_CPU_ARCHITECTURE');
  static const Abi_AbiAlias ARMEABI =
      Abi_AbiAlias._(1, _omitEnumNames ? '' : 'ARMEABI');
  static const Abi_AbiAlias ARMEABI_V7A =
      Abi_AbiAlias._(2, _omitEnumNames ? '' : 'ARMEABI_V7A');
  static const Abi_AbiAlias ARM64_V8A =
      Abi_AbiAlias._(3, _omitEnumNames ? '' : 'ARM64_V8A');
  static const Abi_AbiAlias X86 =
      Abi_AbiAlias._(4, _omitEnumNames ? '' : 'X86');
  static const Abi_AbiAlias X86_64 =
      Abi_AbiAlias._(5, _omitEnumNames ? '' : 'X86_64');
  static const Abi_AbiAlias MIPS =
      Abi_AbiAlias._(6, _omitEnumNames ? '' : 'MIPS');
  static const Abi_AbiAlias MIPS64 =
      Abi_AbiAlias._(7, _omitEnumNames ? '' : 'MIPS64');
  static const Abi_AbiAlias RISCV64 =
      Abi_AbiAlias._(8, _omitEnumNames ? '' : 'RISCV64');

  static const $core.List<Abi_AbiAlias> values = <Abi_AbiAlias>[
    UNSPECIFIED_CPU_ARCHITECTURE,
    ARMEABI,
    ARMEABI_V7A,
    ARM64_V8A,
    X86,
    X86_64,
    MIPS,
    MIPS64,
    RISCV64,
  ];

  static final $core.List<Abi_AbiAlias?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static Abi_AbiAlias? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Abi_AbiAlias._(super.value, super.name);
}

class ScreenDensity_DensityAlias extends $pb.ProtobufEnum {
  static const ScreenDensity_DensityAlias DENSITY_UNSPECIFIED =
      ScreenDensity_DensityAlias._(
          0, _omitEnumNames ? '' : 'DENSITY_UNSPECIFIED');
  static const ScreenDensity_DensityAlias NODPI =
      ScreenDensity_DensityAlias._(1, _omitEnumNames ? '' : 'NODPI');
  static const ScreenDensity_DensityAlias LDPI =
      ScreenDensity_DensityAlias._(2, _omitEnumNames ? '' : 'LDPI');
  static const ScreenDensity_DensityAlias MDPI =
      ScreenDensity_DensityAlias._(3, _omitEnumNames ? '' : 'MDPI');
  static const ScreenDensity_DensityAlias TVDPI =
      ScreenDensity_DensityAlias._(4, _omitEnumNames ? '' : 'TVDPI');
  static const ScreenDensity_DensityAlias HDPI =
      ScreenDensity_DensityAlias._(5, _omitEnumNames ? '' : 'HDPI');
  static const ScreenDensity_DensityAlias XHDPI =
      ScreenDensity_DensityAlias._(6, _omitEnumNames ? '' : 'XHDPI');
  static const ScreenDensity_DensityAlias XXHDPI =
      ScreenDensity_DensityAlias._(7, _omitEnumNames ? '' : 'XXHDPI');
  static const ScreenDensity_DensityAlias XXXHDPI =
      ScreenDensity_DensityAlias._(8, _omitEnumNames ? '' : 'XXXHDPI');

  static const $core.List<ScreenDensity_DensityAlias> values =
      <ScreenDensity_DensityAlias>[
    DENSITY_UNSPECIFIED,
    NODPI,
    LDPI,
    MDPI,
    TVDPI,
    HDPI,
    XHDPI,
    XXHDPI,
    XXXHDPI,
  ];

  static final $core.List<ScreenDensity_DensityAlias?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static ScreenDensity_DensityAlias? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ScreenDensity_DensityAlias._(super.value, super.name);
}

class TextureCompressionFormat_TextureCompressionFormatAlias
    extends $pb.ProtobufEnum {
  static const TextureCompressionFormat_TextureCompressionFormatAlias
      UNSPECIFIED_TEXTURE_COMPRESSION_FORMAT =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          0, _omitEnumNames ? '' : 'UNSPECIFIED_TEXTURE_COMPRESSION_FORMAT');
  static const TextureCompressionFormat_TextureCompressionFormatAlias
      ETC1_RGB8 = TextureCompressionFormat_TextureCompressionFormatAlias._(
          1, _omitEnumNames ? '' : 'ETC1_RGB8');
  static const TextureCompressionFormat_TextureCompressionFormatAlias PALETTED =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          2, _omitEnumNames ? '' : 'PALETTED');
  static const TextureCompressionFormat_TextureCompressionFormatAlias THREE_DC =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          3, _omitEnumNames ? '' : 'THREE_DC');
  static const TextureCompressionFormat_TextureCompressionFormatAlias ATC =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          4, _omitEnumNames ? '' : 'ATC');
  static const TextureCompressionFormat_TextureCompressionFormatAlias LATC =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          5, _omitEnumNames ? '' : 'LATC');
  static const TextureCompressionFormat_TextureCompressionFormatAlias DXT1 =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          6, _omitEnumNames ? '' : 'DXT1');
  static const TextureCompressionFormat_TextureCompressionFormatAlias S3TC =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          7, _omitEnumNames ? '' : 'S3TC');
  static const TextureCompressionFormat_TextureCompressionFormatAlias PVRTC =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          8, _omitEnumNames ? '' : 'PVRTC');
  static const TextureCompressionFormat_TextureCompressionFormatAlias ASTC =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          9, _omitEnumNames ? '' : 'ASTC');
  static const TextureCompressionFormat_TextureCompressionFormatAlias ETC2 =
      TextureCompressionFormat_TextureCompressionFormatAlias._(
          10, _omitEnumNames ? '' : 'ETC2');

  static const $core
      .List<TextureCompressionFormat_TextureCompressionFormatAlias>
      values = <TextureCompressionFormat_TextureCompressionFormatAlias>[
    UNSPECIFIED_TEXTURE_COMPRESSION_FORMAT,
    ETC1_RGB8,
    PALETTED,
    THREE_DC,
    ATC,
    LATC,
    DXT1,
    S3TC,
    PVRTC,
    ASTC,
    ETC2,
  ];

  static final $core
      .List<TextureCompressionFormat_TextureCompressionFormatAlias?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 10);
  static TextureCompressionFormat_TextureCompressionFormatAlias? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TextureCompressionFormat_TextureCompressionFormatAlias._(
      super.value, super.name);
}

class Sanitizer_SanitizerAlias extends $pb.ProtobufEnum {
  static const Sanitizer_SanitizerAlias NONE =
      Sanitizer_SanitizerAlias._(0, _omitEnumNames ? '' : 'NONE');
  static const Sanitizer_SanitizerAlias HWADDRESS =
      Sanitizer_SanitizerAlias._(1, _omitEnumNames ? '' : 'HWADDRESS');

  static const $core.List<Sanitizer_SanitizerAlias> values =
      <Sanitizer_SanitizerAlias>[
    NONE,
    HWADDRESS,
  ];

  static final $core.List<Sanitizer_SanitizerAlias?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static Sanitizer_SanitizerAlias? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const Sanitizer_SanitizerAlias._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
