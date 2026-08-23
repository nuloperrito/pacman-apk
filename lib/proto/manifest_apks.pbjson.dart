// This is a generated file - do not edit.
//
// Generated from manifest_apks.proto.

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

@$core.Deprecated('Use featureModuleTypeDescriptor instead')
const FeatureModuleType$json = {
  '1': 'FeatureModuleType',
  '2': [
    {'1': 'UNKNOWN_MODULE_TYPE', '2': 0},
    {'1': 'FEATURE_MODULE', '2': 1},
    {'1': 'ML_MODULE', '2': 2},
    {'1': 'SDK_MODULE', '2': 3},
  ],
};

/// Descriptor for `FeatureModuleType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List featureModuleTypeDescriptor = $convert.base64Decode(
    'ChFGZWF0dXJlTW9kdWxlVHlwZRIXChNVTktOT1dOX01PRFVMRV9UWVBFEAASEgoORkVBVFVSRV'
    '9NT0RVTEUQARINCglNTF9NT0RVTEUQAhIOCgpTREtfTU9EVUxFEAM=');

@$core.Deprecated('Use deliveryTypeDescriptor instead')
const DeliveryType$json = {
  '1': 'DeliveryType',
  '2': [
    {'1': 'UNKNOWN_DELIVERY_TYPE', '2': 0},
    {'1': 'INSTALL_TIME', '2': 1},
    {'1': 'ON_DEMAND', '2': 2},
    {'1': 'FAST_FOLLOW', '2': 3},
  ],
};

/// Descriptor for `DeliveryType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deliveryTypeDescriptor = $convert.base64Decode(
    'CgxEZWxpdmVyeVR5cGUSGQoVVU5LTk9XTl9ERUxJVkVSWV9UWVBFEAASEAoMSU5TVEFMTF9USU'
    '1FEAESDQoJT05fREVNQU5EEAISDwoLRkFTVF9GT0xMT1cQAw==');

@$core.Deprecated('Use assetModuleTypeDescriptor instead')
const AssetModuleType$json = {
  '1': 'AssetModuleType',
  '2': [
    {'1': 'UNKNOWN_ASSET_TYPE', '2': 0},
    {'1': 'DEFAULT_ASSET_TYPE', '2': 1},
    {'1': 'AI_PACK_TYPE', '2': 2},
  ],
};

/// Descriptor for `AssetModuleType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List assetModuleTypeDescriptor = $convert.base64Decode(
    'Cg9Bc3NldE1vZHVsZVR5cGUSFgoSVU5LTk9XTl9BU1NFVF9UWVBFEAASFgoSREVGQVVMVF9BU1'
    'NFVF9UWVBFEAESEAoMQUlfUEFDS19UWVBFEAI=');

@$core.Deprecated('Use buildApksResultDescriptor instead')
const BuildApksResult$json = {
  '1': 'BuildApksResult',
  '2': [
    {
      '1': 'variant',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.proto.Variant',
      '10': 'variant'
    },
    {
      '1': 'bundletool',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.proto.Bundletool',
      '10': 'bundletool'
    },
    {
      '1': 'asset_slice_set',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.proto.AssetSliceSet',
      '10': 'assetSliceSet'
    },
    {'1': 'package_name', '3': 4, '4': 1, '5': 9, '10': 'packageName'},
    {
      '1': 'local_testing_info',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.proto.LocalTestingInfo',
      '10': 'localTestingInfo'
    },
    {
      '1': 'asset_modules_info',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.proto.AssetModulesInfo',
      '10': 'assetModulesInfo'
    },
    {
      '1': 'default_targeting_value',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.proto.DefaultTargetingValue',
      '10': 'defaultTargetingValue'
    },
    {
      '1': 'permanently_fused_modules',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.proto.PermanentlyFusedModule',
      '10': 'permanentlyFusedModules'
    },
    {
      '1': 'device_group_config',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.proto.DeviceGroupConfig',
      '10': 'deviceGroupConfig'
    },
  ],
};

/// Descriptor for `BuildApksResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buildApksResultDescriptor = $convert.base64Decode(
    'Cg9CdWlsZEFwa3NSZXN1bHQSKAoHdmFyaWFudBgBIAMoCzIOLnByb3RvLlZhcmlhbnRSB3Zhcm'
    'lhbnQSMQoKYnVuZGxldG9vbBgCIAEoCzIRLnByb3RvLkJ1bmRsZXRvb2xSCmJ1bmRsZXRvb2wS'
    'PAoPYXNzZXRfc2xpY2Vfc2V0GAMgAygLMhQucHJvdG8uQXNzZXRTbGljZVNldFINYXNzZXRTbG'
    'ljZVNldBIhCgxwYWNrYWdlX25hbWUYBCABKAlSC3BhY2thZ2VOYW1lEkUKEmxvY2FsX3Rlc3Rp'
    'bmdfaW5mbxgFIAEoCzIXLnByb3RvLkxvY2FsVGVzdGluZ0luZm9SEGxvY2FsVGVzdGluZ0luZm'
    '8SRQoSYXNzZXRfbW9kdWxlc19pbmZvGAYgASgLMhcucHJvdG8uQXNzZXRNb2R1bGVzSW5mb1IQ'
    'YXNzZXRNb2R1bGVzSW5mbxJUChdkZWZhdWx0X3RhcmdldGluZ192YWx1ZRgHIAMoCzIcLnByb3'
    'RvLkRlZmF1bHRUYXJnZXRpbmdWYWx1ZVIVZGVmYXVsdFRhcmdldGluZ1ZhbHVlElkKGXBlcm1h'
    'bmVudGx5X2Z1c2VkX21vZHVsZXMYCCADKAsyHS5wcm90by5QZXJtYW5lbnRseUZ1c2VkTW9kdW'
    'xlUhdwZXJtYW5lbnRseUZ1c2VkTW9kdWxlcxJIChNkZXZpY2VfZ3JvdXBfY29uZmlnGAkgASgL'
    'MhgucHJvdG8uRGV2aWNlR3JvdXBDb25maWdSEWRldmljZUdyb3VwQ29uZmln');

@$core.Deprecated('Use variantDescriptor instead')
const Variant$json = {
  '1': 'Variant',
  '2': [
    {
      '1': 'targeting',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.VariantTargeting',
      '10': 'targeting'
    },
    {
      '1': 'apk_set',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.ApkSet',
      '10': 'apkSet'
    },
    {'1': 'variant_number', '3': 3, '4': 1, '5': 13, '10': 'variantNumber'},
    {
      '1': 'variant_properties',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.proto.VariantProperties',
      '10': 'variantProperties'
    },
  ],
};

/// Descriptor for `Variant`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List variantDescriptor = $convert.base64Decode(
    'CgdWYXJpYW50EjUKCXRhcmdldGluZxgBIAEoCzIXLnByb3RvLlZhcmlhbnRUYXJnZXRpbmdSCX'
    'RhcmdldGluZxImCgdhcGtfc2V0GAIgAygLMg0ucHJvdG8uQXBrU2V0UgZhcGtTZXQSJQoOdmFy'
    'aWFudF9udW1iZXIYAyABKA1SDXZhcmlhbnROdW1iZXISRwoSdmFyaWFudF9wcm9wZXJ0aWVzGA'
    'QgASgLMhgucHJvdG8uVmFyaWFudFByb3BlcnRpZXNSEXZhcmlhbnRQcm9wZXJ0aWVz');

@$core.Deprecated('Use bundletoolDescriptor instead')
const Bundletool$json = {
  '1': 'Bundletool',
  '2': [
    {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
  ],
};

/// Descriptor for `Bundletool`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bundletoolDescriptor = $convert
    .base64Decode('CgpCdW5kbGV0b29sEhgKB3ZlcnNpb24YAiABKAlSB3ZlcnNpb24=');

@$core.Deprecated('Use assetSliceSetDescriptor instead')
const AssetSliceSet$json = {
  '1': 'AssetSliceSet',
  '2': [
    {
      '1': 'asset_module_metadata',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.AssetModuleMetadata',
      '10': 'assetModuleMetadata'
    },
    {
      '1': 'apk_description',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.ApkDescription',
      '10': 'apkDescription'
    },
  ],
};

/// Descriptor for `AssetSliceSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetSliceSetDescriptor = $convert.base64Decode(
    'Cg1Bc3NldFNsaWNlU2V0Ek4KFWFzc2V0X21vZHVsZV9tZXRhZGF0YRgBIAEoCzIaLnByb3RvLk'
    'Fzc2V0TW9kdWxlTWV0YWRhdGFSE2Fzc2V0TW9kdWxlTWV0YWRhdGESPgoPYXBrX2Rlc2NyaXB0'
    'aW9uGAIgAygLMhUucHJvdG8uQXBrRGVzY3JpcHRpb25SDmFwa0Rlc2NyaXB0aW9u');

@$core.Deprecated('Use localTestingInfoDescriptor instead')
const LocalTestingInfo$json = {
  '1': 'LocalTestingInfo',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {
      '1': 'local_testing_path',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'localTestingPath'
    },
  ],
};

/// Descriptor for `LocalTestingInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localTestingInfoDescriptor = $convert.base64Decode(
    'ChBMb2NhbFRlc3RpbmdJbmZvEhgKB2VuYWJsZWQYASABKAhSB2VuYWJsZWQSLAoSbG9jYWxfdG'
    'VzdGluZ19wYXRoGAIgASgJUhBsb2NhbFRlc3RpbmdQYXRo');

@$core.Deprecated('Use assetModulesInfoDescriptor instead')
const AssetModulesInfo$json = {
  '1': 'AssetModulesInfo',
  '2': [
    {'1': 'app_version', '3': 1, '4': 3, '5': 3, '10': 'appVersion'},
    {'1': 'asset_version_tag', '3': 2, '4': 1, '5': 9, '10': 'assetVersionTag'},
  ],
};

/// Descriptor for `AssetModulesInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetModulesInfoDescriptor = $convert.base64Decode(
    'ChBBc3NldE1vZHVsZXNJbmZvEh8KC2FwcF92ZXJzaW9uGAEgAygDUgphcHBWZXJzaW9uEioKEW'
    'Fzc2V0X3ZlcnNpb25fdGFnGAIgASgJUg9hc3NldFZlcnNpb25UYWc=');

@$core.Deprecated('Use defaultTargetingValueDescriptor instead')
const DefaultTargetingValue$json = {
  '1': 'DefaultTargetingValue',
  '2': [
    {'1': 'dimension', '3': 1, '4': 1, '5': 5, '10': 'dimension'},
    {'1': 'default_value', '3': 2, '4': 1, '5': 9, '10': 'defaultValue'},
  ],
};

/// Descriptor for `DefaultTargetingValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List defaultTargetingValueDescriptor = $convert.base64Decode(
    'ChVEZWZhdWx0VGFyZ2V0aW5nVmFsdWUSHAoJZGltZW5zaW9uGAEgASgFUglkaW1lbnNpb24SIw'
    'oNZGVmYXVsdF92YWx1ZRgCIAEoCVIMZGVmYXVsdFZhbHVl');

@$core.Deprecated('Use permanentlyFusedModuleDescriptor instead')
const PermanentlyFusedModule$json = {
  '1': 'PermanentlyFusedModule',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `PermanentlyFusedModule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permanentlyFusedModuleDescriptor =
    $convert.base64Decode(
        'ChZQZXJtYW5lbnRseUZ1c2VkTW9kdWxlEhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use deviceGroupConfigDescriptor instead')
const DeviceGroupConfig$json = {
  '1': 'DeviceGroupConfig',
  '2': [
    {
      '1': 'device_groups',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.proto.DeviceGroup',
      '10': 'deviceGroups'
    },
  ],
};

/// Descriptor for `DeviceGroupConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceGroupConfigDescriptor = $convert.base64Decode(
    'ChFEZXZpY2VHcm91cENvbmZpZxI3Cg1kZXZpY2VfZ3JvdXBzGAEgAygLMhIucHJvdG8uRGV2aW'
    'NlR3JvdXBSDGRldmljZUdyb3Vwcw==');

@$core.Deprecated('Use deviceGroupDescriptor instead')
const DeviceGroup$json = {
  '1': 'DeviceGroup',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'device_selectors',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.DeviceSelector',
      '10': 'deviceSelectors'
    },
  ],
};

/// Descriptor for `DeviceGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceGroupDescriptor = $convert.base64Decode(
    'CgtEZXZpY2VHcm91cBISCgRuYW1lGAEgASgJUgRuYW1lEkAKEGRldmljZV9zZWxlY3RvcnMYAi'
    'ADKAsyFS5wcm90by5EZXZpY2VTZWxlY3RvclIPZGV2aWNlU2VsZWN0b3Jz');

@$core.Deprecated('Use deviceSelectorDescriptor instead')
const DeviceSelector$json = {
  '1': 'DeviceSelector',
  '2': [
    {
      '1': 'device_ram',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.DeviceRam',
      '10': 'deviceRam'
    },
    {
      '1': 'included_device_ids',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.DeviceId',
      '10': 'includedDeviceIds'
    },
    {
      '1': 'excluded_device_ids',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.proto.DeviceId',
      '10': 'excludedDeviceIds'
    },
    {
      '1': 'required_system_features',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.proto.SystemFeature',
      '10': 'requiredSystemFeatures'
    },
    {
      '1': 'forbidden_system_features',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.proto.SystemFeature',
      '10': 'forbiddenSystemFeatures'
    },
    {
      '1': 'system_on_chips',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.proto.SystemOnChip',
      '10': 'systemOnChips'
    },
  ],
};

/// Descriptor for `DeviceSelector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceSelectorDescriptor = $convert.base64Decode(
    'Cg5EZXZpY2VTZWxlY3RvchIvCgpkZXZpY2VfcmFtGAEgASgLMhAucHJvdG8uRGV2aWNlUmFtUg'
    'lkZXZpY2VSYW0SPwoTaW5jbHVkZWRfZGV2aWNlX2lkcxgCIAMoCzIPLnByb3RvLkRldmljZUlk'
    'UhFpbmNsdWRlZERldmljZUlkcxI/ChNleGNsdWRlZF9kZXZpY2VfaWRzGAMgAygLMg8ucHJvdG'
    '8uRGV2aWNlSWRSEWV4Y2x1ZGVkRGV2aWNlSWRzEk4KGHJlcXVpcmVkX3N5c3RlbV9mZWF0dXJl'
    'cxgEIAMoCzIULnByb3RvLlN5c3RlbUZlYXR1cmVSFnJlcXVpcmVkU3lzdGVtRmVhdHVyZXMSUA'
    'oZZm9yYmlkZGVuX3N5c3RlbV9mZWF0dXJlcxgFIAMoCzIULnByb3RvLlN5c3RlbUZlYXR1cmVS'
    'F2ZvcmJpZGRlblN5c3RlbUZlYXR1cmVzEjsKD3N5c3RlbV9vbl9jaGlwcxgGIAMoCzITLnByb3'
    'RvLlN5c3RlbU9uQ2hpcFINc3lzdGVtT25DaGlwcw==');

@$core.Deprecated('Use deviceRamDescriptor instead')
const DeviceRam$json = {
  '1': 'DeviceRam',
  '2': [
    {'1': 'min_bytes', '3': 1, '4': 1, '5': 3, '10': 'minBytes'},
    {'1': 'max_bytes', '3': 2, '4': 1, '5': 3, '10': 'maxBytes'},
  ],
};

/// Descriptor for `DeviceRam`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceRamDescriptor = $convert.base64Decode(
    'CglEZXZpY2VSYW0SGwoJbWluX2J5dGVzGAEgASgDUghtaW5CeXRlcxIbCgltYXhfYnl0ZXMYAi'
    'ABKANSCG1heEJ5dGVz');

@$core.Deprecated('Use deviceIdDescriptor instead')
const DeviceId$json = {
  '1': 'DeviceId',
  '2': [
    {'1': 'build_brand', '3': 1, '4': 1, '5': 9, '10': 'buildBrand'},
    {'1': 'build_device', '3': 2, '4': 1, '5': 9, '10': 'buildDevice'},
  ],
};

/// Descriptor for `DeviceId`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceIdDescriptor = $convert.base64Decode(
    'CghEZXZpY2VJZBIfCgtidWlsZF9icmFuZBgBIAEoCVIKYnVpbGRCcmFuZBIhCgxidWlsZF9kZX'
    'ZpY2UYAiABKAlSC2J1aWxkRGV2aWNl');

@$core.Deprecated('Use systemFeatureDescriptor instead')
const SystemFeature$json = {
  '1': 'SystemFeature',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `SystemFeature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemFeatureDescriptor =
    $convert.base64Decode('Cg1TeXN0ZW1GZWF0dXJlEhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use systemOnChipDescriptor instead')
const SystemOnChip$json = {
  '1': 'SystemOnChip',
  '2': [
    {'1': 'manufacturer', '3': 1, '4': 1, '5': 9, '10': 'manufacturer'},
    {'1': 'model', '3': 2, '4': 1, '5': 9, '10': 'model'},
  ],
};

/// Descriptor for `SystemOnChip`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemOnChipDescriptor = $convert.base64Decode(
    'CgxTeXN0ZW1PbkNoaXASIgoMbWFudWZhY3R1cmVyGAEgASgJUgxtYW51ZmFjdHVyZXISFAoFbW'
    '9kZWwYAiABKAlSBW1vZGVs');

@$core.Deprecated('Use variantTargetingDescriptor instead')
const VariantTargeting$json = {
  '1': 'VariantTargeting',
  '2': [
    {
      '1': 'sdk_version_targeting',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.SdkVersionTargeting',
      '10': 'sdkVersionTargeting'
    },
    {
      '1': 'abi_targeting',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.proto.AbiTargeting',
      '10': 'abiTargeting'
    },
    {
      '1': 'screen_density_targeting',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.proto.ScreenDensityTargeting',
      '10': 'screenDensityTargeting'
    },
    {
      '1': 'multi_abi_targeting',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.proto.MultiAbiTargeting',
      '10': 'multiAbiTargeting'
    },
    {
      '1': 'texture_compression_format_targeting',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.proto.TextureCompressionFormatTargeting',
      '10': 'textureCompressionFormatTargeting'
    },
    {
      '1': 'sdk_runtime_targeting',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.proto.SdkRuntimeTargeting',
      '10': 'sdkRuntimeTargeting'
    },
  ],
};

/// Descriptor for `VariantTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List variantTargetingDescriptor = $convert.base64Decode(
    'ChBWYXJpYW50VGFyZ2V0aW5nEk4KFXNka192ZXJzaW9uX3RhcmdldGluZxgBIAEoCzIaLnByb3'
    'RvLlNka1ZlcnNpb25UYXJnZXRpbmdSE3Nka1ZlcnNpb25UYXJnZXRpbmcSOAoNYWJpX3Rhcmdl'
    'dGluZxgCIAEoCzITLnByb3RvLkFiaVRhcmdldGluZ1IMYWJpVGFyZ2V0aW5nElcKGHNjcmVlbl'
    '9kZW5zaXR5X3RhcmdldGluZxgDIAEoCzIdLnByb3RvLlNjcmVlbkRlbnNpdHlUYXJnZXRpbmdS'
    'FnNjcmVlbkRlbnNpdHlUYXJnZXRpbmcSSAoTbXVsdGlfYWJpX3RhcmdldGluZxgEIAEoCzIYLn'
    'Byb3RvLk11bHRpQWJpVGFyZ2V0aW5nUhFtdWx0aUFiaVRhcmdldGluZxJ5CiR0ZXh0dXJlX2Nv'
    'bXByZXNzaW9uX2Zvcm1hdF90YXJnZXRpbmcYBSABKAsyKC5wcm90by5UZXh0dXJlQ29tcHJlc3'
    'Npb25Gb3JtYXRUYXJnZXRpbmdSIXRleHR1cmVDb21wcmVzc2lvbkZvcm1hdFRhcmdldGluZxJO'
    'ChVzZGtfcnVudGltZV90YXJnZXRpbmcYBiABKAsyGi5wcm90by5TZGtSdW50aW1lVGFyZ2V0aW'
    '5nUhNzZGtSdW50aW1lVGFyZ2V0aW5n');

@$core.Deprecated('Use sdkRuntimeTargetingDescriptor instead')
const SdkRuntimeTargeting$json = {
  '1': 'SdkRuntimeTargeting',
  '2': [
    {
      '1': 'requires_sdk_runtime',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'requiresSdkRuntime'
    },
  ],
};

/// Descriptor for `SdkRuntimeTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkRuntimeTargetingDescriptor = $convert.base64Decode(
    'ChNTZGtSdW50aW1lVGFyZ2V0aW5nEjAKFHJlcXVpcmVzX3Nka19ydW50aW1lGAEgASgIUhJyZX'
    'F1aXJlc1Nka1J1bnRpbWU=');

@$core.Deprecated('Use variantPropertiesDescriptor instead')
const VariantProperties$json = {
  '1': 'VariantProperties',
  '2': [
    {'1': 'uncompressed_dex', '3': 1, '4': 1, '5': 8, '10': 'uncompressedDex'},
    {
      '1': 'uncompressed_native_libraries',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'uncompressedNativeLibraries'
    },
    {'1': 'sparse_encoding', '3': 3, '4': 1, '5': 8, '10': 'sparseEncoding'},
  ],
};

/// Descriptor for `VariantProperties`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List variantPropertiesDescriptor = $convert.base64Decode(
    'ChFWYXJpYW50UHJvcGVydGllcxIpChB1bmNvbXByZXNzZWRfZGV4GAEgASgIUg91bmNvbXByZX'
    'NzZWREZXgSQgoddW5jb21wcmVzc2VkX25hdGl2ZV9saWJyYXJpZXMYAiABKAhSG3VuY29tcHJl'
    'c3NlZE5hdGl2ZUxpYnJhcmllcxInCg9zcGFyc2VfZW5jb2RpbmcYAyABKAhSDnNwYXJzZUVuY2'
    '9kaW5n');

@$core.Deprecated('Use apkSetDescriptor instead')
const ApkSet$json = {
  '1': 'ApkSet',
  '2': [
    {
      '1': 'module_metadata',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.ModuleMetadata',
      '10': 'moduleMetadata'
    },
    {
      '1': 'apk_description',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.ApkDescription',
      '10': 'apkDescription'
    },
  ],
};

/// Descriptor for `ApkSet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apkSetDescriptor = $convert.base64Decode(
    'CgZBcGtTZXQSPgoPbW9kdWxlX21ldGFkYXRhGAEgASgLMhUucHJvdG8uTW9kdWxlTWV0YWRhdG'
    'FSDm1vZHVsZU1ldGFkYXRhEj4KD2Fwa19kZXNjcmlwdGlvbhgCIAMoCzIVLnByb3RvLkFwa0Rl'
    'c2NyaXB0aW9uUg5hcGtEZXNjcmlwdGlvbg==');

@$core.Deprecated('Use moduleMetadataDescriptor instead')
const ModuleMetadata$json = {
  '1': 'ModuleMetadata',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'module_type',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.proto.FeatureModuleType',
      '10': 'moduleType'
    },
    {
      '1': 'delivery_type',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.proto.DeliveryType',
      '10': 'deliveryType'
    },
    {'1': 'is_instant', '3': 3, '4': 1, '5': 8, '10': 'isInstant'},
    {'1': 'dependencies', '3': 4, '4': 3, '5': 9, '10': 'dependencies'},
    {
      '1': 'targeting',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.proto.ModuleTargeting',
      '10': 'targeting'
    },
    {
      '1': 'on_demand_deprecated',
      '3': 2,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'onDemandDeprecated',
    },
    {
      '1': 'runtime_enabled_sdk_dependencies',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.proto.RuntimeEnabledSdkDependency',
      '10': 'runtimeEnabledSdkDependencies'
    },
    {
      '1': 'sdk_module_metadata',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.proto.SdkModuleMetadata',
      '10': 'sdkModuleMetadata'
    },
  ],
};

/// Descriptor for `ModuleMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moduleMetadataDescriptor = $convert.base64Decode(
    'Cg5Nb2R1bGVNZXRhZGF0YRISCgRuYW1lGAEgASgJUgRuYW1lEjkKC21vZHVsZV90eXBlGAcgAS'
    'gOMhgucHJvdG8uRmVhdHVyZU1vZHVsZVR5cGVSCm1vZHVsZVR5cGUSOAoNZGVsaXZlcnlfdHlw'
    'ZRgGIAEoDjITLnByb3RvLkRlbGl2ZXJ5VHlwZVIMZGVsaXZlcnlUeXBlEh0KCmlzX2luc3Rhbn'
    'QYAyABKAhSCWlzSW5zdGFudBIiCgxkZXBlbmRlbmNpZXMYBCADKAlSDGRlcGVuZGVuY2llcxI0'
    'Cgl0YXJnZXRpbmcYBSABKAsyFi5wcm90by5Nb2R1bGVUYXJnZXRpbmdSCXRhcmdldGluZxI0Ch'
    'Rvbl9kZW1hbmRfZGVwcmVjYXRlZBgCIAEoCEICGAFSEm9uRGVtYW5kRGVwcmVjYXRlZBJrCiBy'
    'dW50aW1lX2VuYWJsZWRfc2RrX2RlcGVuZGVuY2llcxgIIAMoCzIiLnByb3RvLlJ1bnRpbWVFbm'
    'FibGVkU2RrRGVwZW5kZW5jeVIdcnVudGltZUVuYWJsZWRTZGtEZXBlbmRlbmNpZXMSSAoTc2Rr'
    'X21vZHVsZV9tZXRhZGF0YRgJIAEoCzIYLnByb3RvLlNka01vZHVsZU1ldGFkYXRhUhFzZGtNb2'
    'R1bGVNZXRhZGF0YQ==');

@$core.Deprecated('Use moduleTargetingDescriptor instead')
const ModuleTargeting$json = {
  '1': 'ModuleTargeting',
  '2': [
    {
      '1': 'sdk_version_targeting',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.SdkVersionTargeting',
      '10': 'sdkVersionTargeting'
    },
    {
      '1': 'device_feature_targeting',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.DeviceFeatureTargeting',
      '10': 'deviceFeatureTargeting'
    },
    {
      '1': 'user_countries_targeting',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.proto.UserCountriesTargeting',
      '10': 'userCountriesTargeting'
    },
    {
      '1': 'device_group_targeting',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.proto.DeviceGroupModuleTargeting',
      '10': 'deviceGroupTargeting'
    },
  ],
};

/// Descriptor for `ModuleTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moduleTargetingDescriptor = $convert.base64Decode(
    'Cg9Nb2R1bGVUYXJnZXRpbmcSTgoVc2RrX3ZlcnNpb25fdGFyZ2V0aW5nGAEgASgLMhoucHJvdG'
    '8uU2RrVmVyc2lvblRhcmdldGluZ1ITc2RrVmVyc2lvblRhcmdldGluZxJXChhkZXZpY2VfZmVh'
    'dHVyZV90YXJnZXRpbmcYAiADKAsyHS5wcm90by5EZXZpY2VGZWF0dXJlVGFyZ2V0aW5nUhZkZX'
    'ZpY2VGZWF0dXJlVGFyZ2V0aW5nElcKGHVzZXJfY291bnRyaWVzX3RhcmdldGluZxgDIAEoCzId'
    'LnByb3RvLlVzZXJDb3VudHJpZXNUYXJnZXRpbmdSFnVzZXJDb3VudHJpZXNUYXJnZXRpbmcSVw'
    'oWZGV2aWNlX2dyb3VwX3RhcmdldGluZxgFIAEoCzIhLnByb3RvLkRldmljZUdyb3VwTW9kdWxl'
    'VGFyZ2V0aW5nUhRkZXZpY2VHcm91cFRhcmdldGluZw==');

@$core.Deprecated('Use deviceFeatureDescriptor instead')
const DeviceFeature$json = {
  '1': 'DeviceFeature',
  '2': [
    {'1': 'feature_name', '3': 1, '4': 1, '5': 9, '10': 'featureName'},
    {'1': 'feature_version', '3': 2, '4': 1, '5': 5, '10': 'featureVersion'},
  ],
};

/// Descriptor for `DeviceFeature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceFeatureDescriptor = $convert.base64Decode(
    'Cg1EZXZpY2VGZWF0dXJlEiEKDGZlYXR1cmVfbmFtZRgBIAEoCVILZmVhdHVyZU5hbWUSJwoPZm'
    'VhdHVyZV92ZXJzaW9uGAIgASgFUg5mZWF0dXJlVmVyc2lvbg==');

@$core.Deprecated('Use deviceFeatureTargetingDescriptor instead')
const DeviceFeatureTargeting$json = {
  '1': 'DeviceFeatureTargeting',
  '2': [
    {
      '1': 'required_feature',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.DeviceFeature',
      '10': 'requiredFeature'
    },
  ],
};

/// Descriptor for `DeviceFeatureTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceFeatureTargetingDescriptor =
    $convert.base64Decode(
        'ChZEZXZpY2VGZWF0dXJlVGFyZ2V0aW5nEj8KEHJlcXVpcmVkX2ZlYXR1cmUYASABKAsyFC5wcm'
        '90by5EZXZpY2VGZWF0dXJlUg9yZXF1aXJlZEZlYXR1cmU=');

@$core.Deprecated('Use userCountriesTargetingDescriptor instead')
const UserCountriesTargeting$json = {
  '1': 'UserCountriesTargeting',
  '2': [
    {'1': 'country_codes', '3': 1, '4': 3, '5': 9, '10': 'countryCodes'},
    {'1': 'exclude', '3': 2, '4': 1, '5': 8, '10': 'exclude'},
  ],
};

/// Descriptor for `UserCountriesTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userCountriesTargetingDescriptor =
    $convert.base64Decode(
        'ChZVc2VyQ291bnRyaWVzVGFyZ2V0aW5nEiMKDWNvdW50cnlfY29kZXMYASADKAlSDGNvdW50cn'
        'lDb2RlcxIYCgdleGNsdWRlGAIgASgIUgdleGNsdWRl');

@$core.Deprecated('Use deviceGroupModuleTargetingDescriptor instead')
const DeviceGroupModuleTargeting$json = {
  '1': 'DeviceGroupModuleTargeting',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `DeviceGroupModuleTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceGroupModuleTargetingDescriptor =
    $convert.base64Decode(
        'ChpEZXZpY2VHcm91cE1vZHVsZVRhcmdldGluZxIUCgV2YWx1ZRgBIAMoCVIFdmFsdWU=');

@$core.Deprecated('Use runtimeEnabledSdkDependencyDescriptor instead')
const RuntimeEnabledSdkDependency$json = {
  '1': 'RuntimeEnabledSdkDependency',
  '2': [
    {'1': 'package_name', '3': 1, '4': 1, '5': 9, '10': 'packageName'},
    {'1': 'major_version', '3': 2, '4': 1, '5': 5, '10': 'majorVersion'},
    {'1': 'minor_version', '3': 3, '4': 1, '5': 5, '10': 'minorVersion'},
  ],
};

/// Descriptor for `RuntimeEnabledSdkDependency`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runtimeEnabledSdkDependencyDescriptor =
    $convert.base64Decode(
        'ChtSdW50aW1lRW5hYmxlZFNka0RlcGVuZGVuY3kSIQoMcGFja2FnZV9uYW1lGAEgASgJUgtwYW'
        'NrYWdlTmFtZRIjCg1tYWpvcl92ZXJzaW9uGAIgASgFUgxtYWpvclZlcnNpb24SIwoNbWlub3Jf'
        'dmVyc2lvbhgDIAEoBVIMbWlub3JWZXJzaW9u');

@$core.Deprecated('Use sdkModuleMetadataDescriptor instead')
const SdkModuleMetadata$json = {
  '1': 'SdkModuleMetadata',
  '2': [
    {
      '1': 'sdk_module_version',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.SdkModuleVersion',
      '10': 'sdkModuleVersion'
    },
    {'1': 'sdk_package_name', '3': 2, '4': 1, '5': 9, '10': 'sdkPackageName'},
    {
      '1': 'resources_package_id',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'resourcesPackageId'
    },
  ],
};

/// Descriptor for `SdkModuleMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkModuleMetadataDescriptor = $convert.base64Decode(
    'ChFTZGtNb2R1bGVNZXRhZGF0YRJFChJzZGtfbW9kdWxlX3ZlcnNpb24YASABKAsyFy5wcm90by'
    '5TZGtNb2R1bGVWZXJzaW9uUhBzZGtNb2R1bGVWZXJzaW9uEigKEHNka19wYWNrYWdlX25hbWUY'
    'AiABKAlSDnNka1BhY2thZ2VOYW1lEjAKFHJlc291cmNlc19wYWNrYWdlX2lkGAMgASgFUhJyZX'
    'NvdXJjZXNQYWNrYWdlSWQ=');

@$core.Deprecated('Use sdkModuleVersionDescriptor instead')
const SdkModuleVersion$json = {
  '1': 'SdkModuleVersion',
  '2': [
    {'1': 'major', '3': 1, '4': 1, '5': 5, '10': 'major'},
    {'1': 'minor', '3': 2, '4': 1, '5': 5, '10': 'minor'},
    {'1': 'patch', '3': 3, '4': 1, '5': 5, '10': 'patch'},
  ],
};

/// Descriptor for `SdkModuleVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkModuleVersionDescriptor = $convert.base64Decode(
    'ChBTZGtNb2R1bGVWZXJzaW9uEhQKBW1ham9yGAEgASgFUgVtYWpvchIUCgVtaW5vchgCIAEoBV'
    'IFbWlub3ISFAoFcGF0Y2gYAyABKAVSBXBhdGNo');

@$core.Deprecated('Use apkDescriptionDescriptor instead')
const ApkDescription$json = {
  '1': 'ApkDescription',
  '2': [
    {
      '1': 'targeting',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.ApkTargeting',
      '10': 'targeting'
    },
    {'1': 'path', '3': 2, '4': 1, '5': 9, '10': 'path'},
    {
      '1': 'split_apk_metadata',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.proto.SplitApkMetadata',
      '9': 0,
      '10': 'splitApkMetadata'
    },
    {
      '1': 'standalone_apk_metadata',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.proto.StandaloneApkMetadata',
      '9': 0,
      '10': 'standaloneApkMetadata'
    },
    {
      '1': 'instant_apk_metadata',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.proto.SplitApkMetadata',
      '9': 0,
      '10': 'instantApkMetadata'
    },
    {
      '1': 'system_apk_metadata',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.proto.SystemApkMetadata',
      '9': 0,
      '10': 'systemApkMetadata'
    },
    {
      '1': 'asset_slice_metadata',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.proto.SplitApkMetadata',
      '9': 0,
      '10': 'assetSliceMetadata'
    },
    {
      '1': 'apex_apk_metadata',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.proto.ApexApkMetadata',
      '9': 0,
      '10': 'apexApkMetadata'
    },
    {
      '1': 'archived_apk_metadata',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.proto.ArchivedApkMetadata',
      '9': 0,
      '10': 'archivedApkMetadata'
    },
    {
      '1': 'signing_description',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.proto.SigningDescription',
      '10': 'signingDescription'
    },
  ],
  '8': [
    {'1': 'apk_metadata_oneof_value'},
  ],
};

/// Descriptor for `ApkDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apkDescriptionDescriptor = $convert.base64Decode(
    'Cg5BcGtEZXNjcmlwdGlvbhIxCgl0YXJnZXRpbmcYASABKAsyEy5wcm90by5BcGtUYXJnZXRpbm'
    'dSCXRhcmdldGluZxISCgRwYXRoGAIgASgJUgRwYXRoEkcKEnNwbGl0X2Fwa19tZXRhZGF0YRgD'
    'IAEoCzIXLnByb3RvLlNwbGl0QXBrTWV0YWRhdGFIAFIQc3BsaXRBcGtNZXRhZGF0YRJWChdzdG'
    'FuZGFsb25lX2Fwa19tZXRhZGF0YRgEIAEoCzIcLnByb3RvLlN0YW5kYWxvbmVBcGtNZXRhZGF0'
    'YUgAUhVzdGFuZGFsb25lQXBrTWV0YWRhdGESSwoUaW5zdGFudF9hcGtfbWV0YWRhdGEYBSABKA'
    'syFy5wcm90by5TcGxpdEFwa01ldGFkYXRhSABSEmluc3RhbnRBcGtNZXRhZGF0YRJKChNzeXN0'
    'ZW1fYXBrX21ldGFkYXRhGAYgASgLMhgucHJvdG8uU3lzdGVtQXBrTWV0YWRhdGFIAFIRc3lzdG'
    'VtQXBrTWV0YWRhdGESSwoUYXNzZXRfc2xpY2VfbWV0YWRhdGEYByABKAsyFy5wcm90by5TcGxp'
    'dEFwa01ldGFkYXRhSABSEmFzc2V0U2xpY2VNZXRhZGF0YRJEChFhcGV4X2Fwa19tZXRhZGF0YR'
    'gIIAEoCzIWLnByb3RvLkFwZXhBcGtNZXRhZGF0YUgAUg9hcGV4QXBrTWV0YWRhdGESUAoVYXJj'
    'aGl2ZWRfYXBrX21ldGFkYXRhGAkgASgLMhoucHJvdG8uQXJjaGl2ZWRBcGtNZXRhZGF0YUgAUh'
    'NhcmNoaXZlZEFwa01ldGFkYXRhEkoKE3NpZ25pbmdfZGVzY3JpcHRpb24YCiABKAsyGS5wcm90'
    'by5TaWduaW5nRGVzY3JpcHRpb25SEnNpZ25pbmdEZXNjcmlwdGlvbkIaChhhcGtfbWV0YWRhdG'
    'Ffb25lb2ZfdmFsdWU=');

@$core.Deprecated('Use apkTargetingDescriptor instead')
const ApkTargeting$json = {
  '1': 'ApkTargeting',
  '2': [
    {
      '1': 'abi_targeting',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.AbiTargeting',
      '10': 'abiTargeting'
    },
    {
      '1': 'language_targeting',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.proto.LanguageTargeting',
      '10': 'languageTargeting'
    },
    {
      '1': 'screen_density_targeting',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.proto.ScreenDensityTargeting',
      '10': 'screenDensityTargeting'
    },
    {
      '1': 'sdk_version_targeting',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.proto.SdkVersionTargeting',
      '10': 'sdkVersionTargeting'
    },
    {
      '1': 'texture_compression_format_targeting',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.proto.TextureCompressionFormatTargeting',
      '10': 'textureCompressionFormatTargeting'
    },
    {
      '1': 'multi_abi_targeting',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.proto.MultiAbiTargeting',
      '10': 'multiAbiTargeting'
    },
    {
      '1': 'sanitizer_targeting',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.proto.SanitizerTargeting',
      '10': 'sanitizerTargeting'
    },
    {
      '1': 'device_tier_targeting',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.proto.DeviceTierTargeting',
      '8': {'3': true},
      '10': 'deviceTierTargeting',
    },
    {
      '1': 'country_set_targeting',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.proto.CountrySetTargeting',
      '8': {'3': true},
      '10': 'countrySetTargeting',
    },
    {
      '1': 'device_group_targeting',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.proto.DeviceGroupTargeting',
      '10': 'deviceGroupTargeting'
    },
  ],
};

/// Descriptor for `ApkTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apkTargetingDescriptor = $convert.base64Decode(
    'CgxBcGtUYXJnZXRpbmcSOAoNYWJpX3RhcmdldGluZxgBIAEoCzITLnByb3RvLkFiaVRhcmdldG'
    'luZ1IMYWJpVGFyZ2V0aW5nEkcKEmxhbmd1YWdlX3RhcmdldGluZxgDIAEoCzIYLnByb3RvLkxh'
    'bmd1YWdlVGFyZ2V0aW5nUhFsYW5ndWFnZVRhcmdldGluZxJXChhzY3JlZW5fZGVuc2l0eV90YX'
    'JnZXRpbmcYBCABKAsyHS5wcm90by5TY3JlZW5EZW5zaXR5VGFyZ2V0aW5nUhZzY3JlZW5EZW5z'
    'aXR5VGFyZ2V0aW5nEk4KFXNka192ZXJzaW9uX3RhcmdldGluZxgFIAEoCzIaLnByb3RvLlNka1'
    'ZlcnNpb25UYXJnZXRpbmdSE3Nka1ZlcnNpb25UYXJnZXRpbmcSeQokdGV4dHVyZV9jb21wcmVz'
    'c2lvbl9mb3JtYXRfdGFyZ2V0aW5nGAYgASgLMigucHJvdG8uVGV4dHVyZUNvbXByZXNzaW9uRm'
    '9ybWF0VGFyZ2V0aW5nUiF0ZXh0dXJlQ29tcHJlc3Npb25Gb3JtYXRUYXJnZXRpbmcSSAoTbXVs'
    'dGlfYWJpX3RhcmdldGluZxgHIAEoCzIYLnByb3RvLk11bHRpQWJpVGFyZ2V0aW5nUhFtdWx0aU'
    'FiaVRhcmdldGluZxJKChNzYW5pdGl6ZXJfdGFyZ2V0aW5nGAggASgLMhkucHJvdG8uU2FuaXRp'
    'emVyVGFyZ2V0aW5nUhJzYW5pdGl6ZXJUYXJnZXRpbmcSUgoVZGV2aWNlX3RpZXJfdGFyZ2V0aW'
    '5nGAkgASgLMhoucHJvdG8uRGV2aWNlVGllclRhcmdldGluZ0ICGAFSE2RldmljZVRpZXJUYXJn'
    'ZXRpbmcSUgoVY291bnRyeV9zZXRfdGFyZ2V0aW5nGAogASgLMhoucHJvdG8uQ291bnRyeVNldF'
    'RhcmdldGluZ0ICGAFSE2NvdW50cnlTZXRUYXJnZXRpbmcSUQoWZGV2aWNlX2dyb3VwX3Rhcmdl'
    'dGluZxgLIAEoCzIbLnByb3RvLkRldmljZUdyb3VwVGFyZ2V0aW5nUhRkZXZpY2VHcm91cFRhcm'
    'dldGluZw==');

@$core.Deprecated('Use splitApkMetadataDescriptor instead')
const SplitApkMetadata$json = {
  '1': 'SplitApkMetadata',
  '2': [
    {'1': 'split_id', '3': 1, '4': 1, '5': 9, '10': 'splitId'},
    {'1': 'is_master_split', '3': 2, '4': 1, '5': 8, '10': 'isMasterSplit'},
  ],
};

/// Descriptor for `SplitApkMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List splitApkMetadataDescriptor = $convert.base64Decode(
    'ChBTcGxpdEFwa01ldGFkYXRhEhkKCHNwbGl0X2lkGAEgASgJUgdzcGxpdElkEiYKD2lzX21hc3'
    'Rlcl9zcGxpdBgCIAEoCFINaXNNYXN0ZXJTcGxpdA==');

@$core.Deprecated('Use standaloneApkMetadataDescriptor instead')
const StandaloneApkMetadata$json = {
  '1': 'StandaloneApkMetadata',
  '2': [
    {'1': 'fused_module_name', '3': 1, '4': 3, '5': 9, '10': 'fusedModuleName'},
    {'1': 'split_id', '3': 3, '4': 1, '5': 9, '10': 'splitId'},
  ],
};

/// Descriptor for `StandaloneApkMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List standaloneApkMetadataDescriptor = $convert.base64Decode(
    'ChVTdGFuZGFsb25lQXBrTWV0YWRhdGESKgoRZnVzZWRfbW9kdWxlX25hbWUYASADKAlSD2Z1c2'
    'VkTW9kdWxlTmFtZRIZCghzcGxpdF9pZBgDIAEoCVIHc3BsaXRJZA==');

@$core.Deprecated('Use systemApkMetadataDescriptor instead')
const SystemApkMetadata$json = {
  '1': 'SystemApkMetadata',
  '2': [
    {'1': 'fused_module_name', '3': 1, '4': 3, '5': 9, '10': 'fusedModuleName'},
  ],
};

/// Descriptor for `SystemApkMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List systemApkMetadataDescriptor = $convert.base64Decode(
    'ChFTeXN0ZW1BcGtNZXRhZGF0YRIqChFmdXNlZF9tb2R1bGVfbmFtZRgBIAMoCVIPZnVzZWRNb2'
    'R1bGVOYW1l');

@$core.Deprecated('Use apexApkMetadataDescriptor instead')
const ApexApkMetadata$json = {
  '1': 'ApexApkMetadata',
  '2': [
    {
      '1': 'apex_embedded_apk_config',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.proto.ApexEmbeddedApkConfig',
      '10': 'apexEmbeddedApkConfig'
    },
  ],
};

/// Descriptor for `ApexApkMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apexApkMetadataDescriptor = $convert.base64Decode(
    'Cg9BcGV4QXBrTWV0YWRhdGESVQoYYXBleF9lbWJlZGRlZF9hcGtfY29uZmlnGAEgAygLMhwucH'
    'JvdG8uQXBleEVtYmVkZGVkQXBrQ29uZmlnUhVhcGV4RW1iZWRkZWRBcGtDb25maWc=');

@$core.Deprecated('Use apexEmbeddedApkConfigDescriptor instead')
const ApexEmbeddedApkConfig$json = {
  '1': 'ApexEmbeddedApkConfig',
  '2': [
    {'1': 'package_name', '3': 1, '4': 1, '5': 9, '10': 'packageName'},
    {'1': 'path', '3': 2, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `ApexEmbeddedApkConfig`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List apexEmbeddedApkConfigDescriptor = $convert.base64Decode(
    'ChVBcGV4RW1iZWRkZWRBcGtDb25maWcSIQoMcGFja2FnZV9uYW1lGAEgASgJUgtwYWNrYWdlTm'
    'FtZRISCgRwYXRoGAIgASgJUgRwYXRo');

@$core.Deprecated('Use archivedApkMetadataDescriptor instead')
const ArchivedApkMetadata$json = {
  '1': 'ArchivedApkMetadata',
};

/// Descriptor for `ArchivedApkMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List archivedApkMetadataDescriptor =
    $convert.base64Decode('ChNBcmNoaXZlZEFwa01ldGFkYXRh');

@$core.Deprecated('Use signingDescriptionDescriptor instead')
const SigningDescription$json = {
  '1': 'SigningDescription',
  '2': [
    {
      '1': 'signed_with_rotated_key',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'signedWithRotatedKey'
    },
  ],
};

/// Descriptor for `SigningDescription`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signingDescriptionDescriptor = $convert.base64Decode(
    'ChJTaWduaW5nRGVzY3JpcHRpb24SNQoXc2lnbmVkX3dpdGhfcm90YXRlZF9rZXkYASABKAhSFH'
    'NpZ25lZFdpdGhSb3RhdGVkS2V5');

@$core.Deprecated('Use abiTargetingDescriptor instead')
const AbiTargeting$json = {
  '1': 'AbiTargeting',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 11, '6': '.proto.Abi', '10': 'value'},
    {
      '1': 'alternatives',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.Abi',
      '10': 'alternatives'
    },
  ],
};

/// Descriptor for `AbiTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List abiTargetingDescriptor = $convert.base64Decode(
    'CgxBYmlUYXJnZXRpbmcSIAoFdmFsdWUYASADKAsyCi5wcm90by5BYmlSBXZhbHVlEi4KDGFsdG'
    'VybmF0aXZlcxgCIAMoCzIKLnByb3RvLkFiaVIMYWx0ZXJuYXRpdmVz');

@$core.Deprecated('Use abiDescriptor instead')
const Abi$json = {
  '1': 'Abi',
  '2': [
    {
      '1': 'alias',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.proto.Abi.AbiAlias',
      '10': 'alias'
    },
  ],
  '4': [Abi_AbiAlias$json],
};

@$core.Deprecated('Use abiDescriptor instead')
const Abi_AbiAlias$json = {
  '1': 'AbiAlias',
  '2': [
    {'1': 'UNSPECIFIED_CPU_ARCHITECTURE', '2': 0},
    {'1': 'ARMEABI', '2': 1},
    {'1': 'ARMEABI_V7A', '2': 2},
    {'1': 'ARM64_V8A', '2': 3},
    {'1': 'X86', '2': 4},
    {'1': 'X86_64', '2': 5},
    {'1': 'MIPS', '2': 6},
    {'1': 'MIPS64', '2': 7},
    {'1': 'RISCV64', '2': 8},
  ],
};

/// Descriptor for `Abi`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List abiDescriptor = $convert.base64Decode(
    'CgNBYmkSKQoFYWxpYXMYASABKA4yEy5wcm90by5BYmkuQWJpQWxpYXNSBWFsaWFzIpEBCghBYm'
    'lBbGlhcxIgChxVTlNQRUNJRklFRF9DUFVfQVJDSElURUNUVVJFEAASCwoHQVJNRUFCSRABEg8K'
    'C0FSTUVBQklfVjdBEAISDQoJQVJNNjRfVjhBEAMSBwoDWDg2EAQSCgoGWDg2XzY0EAUSCAoETU'
    'lQUxAGEgoKBk1JUFM2NBAHEgsKB1JJU0NWNjQQCA==');

@$core.Deprecated('Use screenDensityTargetingDescriptor instead')
const ScreenDensityTargeting$json = {
  '1': 'ScreenDensityTargeting',
  '2': [
    {
      '1': 'value',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.proto.ScreenDensity',
      '10': 'value'
    },
    {
      '1': 'alternatives',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.ScreenDensity',
      '10': 'alternatives'
    },
  ],
};

/// Descriptor for `ScreenDensityTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List screenDensityTargetingDescriptor = $convert.base64Decode(
    'ChZTY3JlZW5EZW5zaXR5VGFyZ2V0aW5nEioKBXZhbHVlGAEgAygLMhQucHJvdG8uU2NyZWVuRG'
    'Vuc2l0eVIFdmFsdWUSOAoMYWx0ZXJuYXRpdmVzGAIgAygLMhQucHJvdG8uU2NyZWVuRGVuc2l0'
    'eVIMYWx0ZXJuYXRpdmVz');

@$core.Deprecated('Use screenDensityDescriptor instead')
const ScreenDensity$json = {
  '1': 'ScreenDensity',
  '2': [
    {
      '1': 'density_alias',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.proto.ScreenDensity.DensityAlias',
      '9': 0,
      '10': 'densityAlias'
    },
    {'1': 'density_dpi', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'densityDpi'},
  ],
  '4': [ScreenDensity_DensityAlias$json],
  '8': [
    {'1': 'density_oneof'},
  ],
};

@$core.Deprecated('Use screenDensityDescriptor instead')
const ScreenDensity_DensityAlias$json = {
  '1': 'DensityAlias',
  '2': [
    {'1': 'DENSITY_UNSPECIFIED', '2': 0},
    {'1': 'NODPI', '2': 1},
    {'1': 'LDPI', '2': 2},
    {'1': 'MDPI', '2': 3},
    {'1': 'TVDPI', '2': 4},
    {'1': 'HDPI', '2': 5},
    {'1': 'XHDPI', '2': 6},
    {'1': 'XXHDPI', '2': 7},
    {'1': 'XXXHDPI', '2': 8},
  ],
};

/// Descriptor for `ScreenDensity`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List screenDensityDescriptor = $convert.base64Decode(
    'Cg1TY3JlZW5EZW5zaXR5EkgKDWRlbnNpdHlfYWxpYXMYASABKA4yIS5wcm90by5TY3JlZW5EZW'
    '5zaXR5LkRlbnNpdHlBbGlhc0gAUgxkZW5zaXR5QWxpYXMSIQoLZGVuc2l0eV9kcGkYAiABKAVI'
    'AFIKZGVuc2l0eURwaSJ/CgxEZW5zaXR5QWxpYXMSFwoTREVOU0lUWV9VTlNQRUNJRklFRBAAEg'
    'kKBU5PRFBJEAESCAoETERQSRACEggKBE1EUEkQAxIJCgVUVkRQSRAEEggKBEhEUEkQBRIJCgVY'
    'SERQSRAGEgoKBlhYSERQSRAHEgsKB1hYWEhEUEkQCEIPCg1kZW5zaXR5X29uZW9m');

@$core.Deprecated('Use languageTargetingDescriptor instead')
const LanguageTargeting$json = {
  '1': 'LanguageTargeting',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 9, '10': 'value'},
    {'1': 'alternatives', '3': 2, '4': 3, '5': 9, '10': 'alternatives'},
  ],
};

/// Descriptor for `LanguageTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List languageTargetingDescriptor = $convert.base64Decode(
    'ChFMYW5ndWFnZVRhcmdldGluZxIUCgV2YWx1ZRgBIAMoCVIFdmFsdWUSIgoMYWx0ZXJuYXRpdm'
    'VzGAIgAygJUgxhbHRlcm5hdGl2ZXM=');

@$core.Deprecated('Use textureCompressionFormatTargetingDescriptor instead')
const TextureCompressionFormatTargeting$json = {
  '1': 'TextureCompressionFormatTargeting',
  '2': [
    {
      '1': 'value',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.proto.TextureCompressionFormat',
      '10': 'value'
    },
    {
      '1': 'alternatives',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.TextureCompressionFormat',
      '10': 'alternatives'
    },
  ],
};

/// Descriptor for `TextureCompressionFormatTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textureCompressionFormatTargetingDescriptor =
    $convert.base64Decode(
        'CiFUZXh0dXJlQ29tcHJlc3Npb25Gb3JtYXRUYXJnZXRpbmcSNQoFdmFsdWUYASADKAsyHy5wcm'
        '90by5UZXh0dXJlQ29tcHJlc3Npb25Gb3JtYXRSBXZhbHVlEkMKDGFsdGVybmF0aXZlcxgCIAMo'
        'CzIfLnByb3RvLlRleHR1cmVDb21wcmVzc2lvbkZvcm1hdFIMYWx0ZXJuYXRpdmVz');

@$core.Deprecated('Use textureCompressionFormatDescriptor instead')
const TextureCompressionFormat$json = {
  '1': 'TextureCompressionFormat',
  '2': [
    {
      '1': 'alias',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.proto.TextureCompressionFormat.TextureCompressionFormatAlias',
      '10': 'alias'
    },
  ],
  '4': [TextureCompressionFormat_TextureCompressionFormatAlias$json],
};

@$core.Deprecated('Use textureCompressionFormatDescriptor instead')
const TextureCompressionFormat_TextureCompressionFormatAlias$json = {
  '1': 'TextureCompressionFormatAlias',
  '2': [
    {'1': 'UNSPECIFIED_TEXTURE_COMPRESSION_FORMAT', '2': 0},
    {'1': 'ETC1_RGB8', '2': 1},
    {'1': 'PALETTED', '2': 2},
    {'1': 'THREE_DC', '2': 3},
    {'1': 'ATC', '2': 4},
    {'1': 'LATC', '2': 5},
    {'1': 'DXT1', '2': 6},
    {'1': 'S3TC', '2': 7},
    {'1': 'PVRTC', '2': 8},
    {'1': 'ASTC', '2': 9},
    {'1': 'ETC2', '2': 10},
  ],
};

/// Descriptor for `TextureCompressionFormat`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textureCompressionFormatDescriptor = $convert.base64Decode(
    'ChhUZXh0dXJlQ29tcHJlc3Npb25Gb3JtYXQSUwoFYWxpYXMYASABKA4yPS5wcm90by5UZXh0dX'
    'JlQ29tcHJlc3Npb25Gb3JtYXQuVGV4dHVyZUNvbXByZXNzaW9uRm9ybWF0QWxpYXNSBWFsaWFz'
    'IrwBCh1UZXh0dXJlQ29tcHJlc3Npb25Gb3JtYXRBbGlhcxIqCiZVTlNQRUNJRklFRF9URVhUVV'
    'JFX0NPTVBSRVNTSU9OX0ZPUk1BVBAAEg0KCUVUQzFfUkdCOBABEgwKCFBBTEVUVEVEEAISDAoI'
    'VEhSRUVfREMQAxIHCgNBVEMQBBIICgRMQVRDEAUSCAoERFhUMRAGEggKBFMzVEMQBxIJCgVQVl'
    'JUQxAIEggKBEFTVEMQCRIICgRFVEMyEAo=');

@$core.Deprecated('Use multiAbiTargetingDescriptor instead')
const MultiAbiTargeting$json = {
  '1': 'MultiAbiTargeting',
  '2': [
    {
      '1': 'value',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.proto.MultiAbi',
      '10': 'value'
    },
    {
      '1': 'alternatives',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.MultiAbi',
      '10': 'alternatives'
    },
  ],
};

/// Descriptor for `MultiAbiTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiAbiTargetingDescriptor = $convert.base64Decode(
    'ChFNdWx0aUFiaVRhcmdldGluZxIlCgV2YWx1ZRgBIAMoCzIPLnByb3RvLk11bHRpQWJpUgV2YW'
    'x1ZRIzCgxhbHRlcm5hdGl2ZXMYAiADKAsyDy5wcm90by5NdWx0aUFiaVIMYWx0ZXJuYXRpdmVz');

@$core.Deprecated('Use multiAbiDescriptor instead')
const MultiAbi$json = {
  '1': 'MultiAbi',
  '2': [
    {'1': 'abi', '3': 1, '4': 3, '5': 11, '6': '.proto.Abi', '10': 'abi'},
  ],
};

/// Descriptor for `MultiAbi`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List multiAbiDescriptor = $convert
    .base64Decode('CghNdWx0aUFiaRIcCgNhYmkYASADKAsyCi5wcm90by5BYmlSA2FiaQ==');

@$core.Deprecated('Use sdkVersionTargetingDescriptor instead')
const SdkVersionTargeting$json = {
  '1': 'SdkVersionTargeting',
  '2': [
    {
      '1': 'value',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.proto.SdkVersion',
      '10': 'value'
    },
    {
      '1': 'alternatives',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.proto.SdkVersion',
      '10': 'alternatives'
    },
  ],
};

/// Descriptor for `SdkVersionTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkVersionTargetingDescriptor = $convert.base64Decode(
    'ChNTZGtWZXJzaW9uVGFyZ2V0aW5nEicKBXZhbHVlGAEgAygLMhEucHJvdG8uU2RrVmVyc2lvbl'
    'IFdmFsdWUSNQoMYWx0ZXJuYXRpdmVzGAIgAygLMhEucHJvdG8uU2RrVmVyc2lvblIMYWx0ZXJu'
    'YXRpdmVz');

@$core.Deprecated('Use sdkVersionDescriptor instead')
const SdkVersion$json = {
  '1': 'SdkVersion',
  '2': [
    {
      '1': 'min',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.Int32Value',
      '10': 'min'
    },
  ],
};

/// Descriptor for `SdkVersion`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sdkVersionDescriptor = $convert.base64Decode(
    'CgpTZGtWZXJzaW9uEiMKA21pbhgBIAEoCzIRLnByb3RvLkludDMyVmFsdWVSA21pbg==');

@$core.Deprecated('Use deviceTierTargetingDescriptor instead')
const DeviceTierTargeting$json = {
  '1': 'DeviceTierTargeting',
  '2': [
    {
      '1': 'value',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.proto.Int32Value',
      '10': 'value'
    },
    {
      '1': 'alternatives',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.proto.Int32Value',
      '10': 'alternatives'
    },
  ],
};

/// Descriptor for `DeviceTierTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceTierTargetingDescriptor = $convert.base64Decode(
    'ChNEZXZpY2VUaWVyVGFyZ2V0aW5nEicKBXZhbHVlGAMgAygLMhEucHJvdG8uSW50MzJWYWx1ZV'
    'IFdmFsdWUSNQoMYWx0ZXJuYXRpdmVzGAQgAygLMhEucHJvdG8uSW50MzJWYWx1ZVIMYWx0ZXJu'
    'YXRpdmVz');

@$core.Deprecated('Use countrySetTargetingDescriptor instead')
const CountrySetTargeting$json = {
  '1': 'CountrySetTargeting',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 9, '10': 'value'},
    {'1': 'alternatives', '3': 2, '4': 3, '5': 9, '10': 'alternatives'},
  ],
};

/// Descriptor for `CountrySetTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List countrySetTargetingDescriptor = $convert.base64Decode(
    'ChNDb3VudHJ5U2V0VGFyZ2V0aW5nEhQKBXZhbHVlGAEgAygJUgV2YWx1ZRIiCgxhbHRlcm5hdG'
    'l2ZXMYAiADKAlSDGFsdGVybmF0aXZlcw==');

@$core.Deprecated('Use deviceGroupTargetingDescriptor instead')
const DeviceGroupTargeting$json = {
  '1': 'DeviceGroupTargeting',
  '2': [
    {'1': 'value', '3': 1, '4': 3, '5': 9, '10': 'value'},
    {'1': 'alternatives', '3': 2, '4': 3, '5': 9, '10': 'alternatives'},
  ],
};

/// Descriptor for `DeviceGroupTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceGroupTargetingDescriptor = $convert.base64Decode(
    'ChREZXZpY2VHcm91cFRhcmdldGluZxIUCgV2YWx1ZRgBIAMoCVIFdmFsdWUSIgoMYWx0ZXJuYX'
    'RpdmVzGAIgAygJUgxhbHRlcm5hdGl2ZXM=');

@$core.Deprecated('Use sanitizerTargetingDescriptor instead')
const SanitizerTargeting$json = {
  '1': 'SanitizerTargeting',
  '2': [
    {
      '1': 'value',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.proto.Sanitizer',
      '10': 'value'
    },
  ],
};

/// Descriptor for `SanitizerTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sanitizerTargetingDescriptor = $convert.base64Decode(
    'ChJTYW5pdGl6ZXJUYXJnZXRpbmcSJgoFdmFsdWUYASADKAsyEC5wcm90by5TYW5pdGl6ZXJSBX'
    'ZhbHVl');

@$core.Deprecated('Use sanitizerDescriptor instead')
const Sanitizer$json = {
  '1': 'Sanitizer',
  '2': [
    {
      '1': 'alias',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.proto.Sanitizer.SanitizerAlias',
      '10': 'alias'
    },
  ],
  '4': [Sanitizer_SanitizerAlias$json],
};

@$core.Deprecated('Use sanitizerDescriptor instead')
const Sanitizer_SanitizerAlias$json = {
  '1': 'SanitizerAlias',
  '2': [
    {'1': 'NONE', '2': 0},
    {'1': 'HWADDRESS', '2': 1},
  ],
};

/// Descriptor for `Sanitizer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sanitizerDescriptor = $convert.base64Decode(
    'CglTYW5pdGl6ZXISNQoFYWxpYXMYASABKA4yHy5wcm90by5TYW5pdGl6ZXIuU2FuaXRpemVyQW'
    'xpYXNSBWFsaWFzIikKDlNhbml0aXplckFsaWFzEggKBE5PTkUQABINCglIV0FERFJFU1MQAQ==');

@$core.Deprecated('Use int32ValueDescriptor instead')
const Int32Value$json = {
  '1': 'Int32Value',
  '2': [
    {'1': 'value', '3': 1, '4': 1, '5': 5, '10': 'value'},
  ],
};

/// Descriptor for `Int32Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List int32ValueDescriptor =
    $convert.base64Decode('CgpJbnQzMlZhbHVlEhQKBXZhbHVlGAEgASgFUgV2YWx1ZQ==');

@$core.Deprecated('Use assetModuleTargetingDescriptor instead')
const AssetModuleTargeting$json = {
  '1': 'AssetModuleTargeting',
  '2': [
    {
      '1': 'user_countries_targeting',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.proto.UserCountriesTargeting',
      '10': 'userCountriesTargeting'
    },
    {
      '1': 'device_group_targeting',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.proto.DeviceGroupModuleTargeting',
      '10': 'deviceGroupTargeting'
    },
  ],
};

/// Descriptor for `AssetModuleTargeting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetModuleTargetingDescriptor = $convert.base64Decode(
    'ChRBc3NldE1vZHVsZVRhcmdldGluZxJXChh1c2VyX2NvdW50cmllc190YXJnZXRpbmcYASABKA'
    'syHS5wcm90by5Vc2VyQ291bnRyaWVzVGFyZ2V0aW5nUhZ1c2VyQ291bnRyaWVzVGFyZ2V0aW5n'
    'ElcKFmRldmljZV9ncm91cF90YXJnZXRpbmcYAiABKAsyIS5wcm90by5EZXZpY2VHcm91cE1vZH'
    'VsZVRhcmdldGluZ1IUZGV2aWNlR3JvdXBUYXJnZXRpbmc=');

@$core.Deprecated('Use assetModuleMetadataDescriptor instead')
const AssetModuleMetadata$json = {
  '1': 'AssetModuleMetadata',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'delivery_type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.proto.DeliveryType',
      '10': 'deliveryType'
    },
    {
      '1': 'instant_metadata',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.proto.InstantMetadata',
      '10': 'instantMetadata'
    },
    {
      '1': 'on_demand_deprecated',
      '3': 2,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'onDemandDeprecated',
    },
    {
      '1': 'asset_module_type',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.proto.AssetModuleType',
      '10': 'assetModuleType'
    },
    {
      '1': 'targeting',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.proto.AssetModuleTargeting',
      '10': 'targeting'
    },
  ],
};

/// Descriptor for `AssetModuleMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetModuleMetadataDescriptor = $convert.base64Decode(
    'ChNBc3NldE1vZHVsZU1ldGFkYXRhEhIKBG5hbWUYASABKAlSBG5hbWUSOAoNZGVsaXZlcnlfdH'
    'lwZRgEIAEoDjITLnByb3RvLkRlbGl2ZXJ5VHlwZVIMZGVsaXZlcnlUeXBlEkEKEGluc3RhbnRf'
    'bWV0YWRhdGEYAyABKAsyFi5wcm90by5JbnN0YW50TWV0YWRhdGFSD2luc3RhbnRNZXRhZGF0YR'
    'I0ChRvbl9kZW1hbmRfZGVwcmVjYXRlZBgCIAEoCEICGAFSEm9uRGVtYW5kRGVwcmVjYXRlZBJC'
    'ChFhc3NldF9tb2R1bGVfdHlwZRgFIAEoDjIWLnByb3RvLkFzc2V0TW9kdWxlVHlwZVIPYXNzZX'
    'RNb2R1bGVUeXBlEjkKCXRhcmdldGluZxgGIAEoCzIbLnByb3RvLkFzc2V0TW9kdWxlVGFyZ2V0'
    'aW5nUgl0YXJnZXRpbmc=');

@$core.Deprecated('Use instantMetadataDescriptor instead')
const InstantMetadata$json = {
  '1': 'InstantMetadata',
  '2': [
    {'1': 'is_instant', '3': 1, '4': 1, '5': 8, '10': 'isInstant'},
    {
      '1': 'delivery_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.proto.DeliveryType',
      '10': 'deliveryType'
    },
    {
      '1': 'on_demand_deprecated',
      '3': 2,
      '4': 1,
      '5': 8,
      '8': {'3': true},
      '10': 'onDemandDeprecated',
    },
  ],
};

/// Descriptor for `InstantMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List instantMetadataDescriptor = $convert.base64Decode(
    'Cg9JbnN0YW50TWV0YWRhdGESHQoKaXNfaW5zdGFudBgBIAEoCFIJaXNJbnN0YW50EjgKDWRlbG'
    'l2ZXJ5X3R5cGUYAyABKA4yEy5wcm90by5EZWxpdmVyeVR5cGVSDGRlbGl2ZXJ5VHlwZRI0ChRv'
    'bl9kZW1hbmRfZGVwcmVjYXRlZBgCIAEoCEICGAFSEm9uRGVtYW5kRGVwcmVjYXRlZA==');
