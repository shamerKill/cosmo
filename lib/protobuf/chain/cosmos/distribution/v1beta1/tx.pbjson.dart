///
//  Generated code. Do not modify.
//  source: cosmos/distribution/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import '../../base/v1beta1/coin.pbjson.dart' as $9;

@$core.Deprecated('Use msgSetWithdrawAddressDescriptor instead')
const MsgSetWithdrawAddress$json = const {
  '1': 'MsgSetWithdrawAddress',
  '2': const [
    const {
      '1': 'delegator_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'delegatorAddress'
    },
    const {
      '1': 'withdraw_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'withdrawAddress'
    },
  ],
  '7': const {},
};

/// Descriptor for `MsgSetWithdrawAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSetWithdrawAddressDescriptor = $convert.base64Decode(
    'ChVNc2dTZXRXaXRoZHJhd0FkZHJlc3MSSQoRZGVsZWdhdG9yX2FkZHJlc3MYASABKAlCHPLeHxh5YW1sOiJkZWxlZ2F0b3JfYWRkcmVzcyJSEGRlbGVnYXRvckFkZHJlc3MSRgoQd2l0aGRyYXdfYWRkcmVzcxgCIAEoCUIb8t4fF3lhbWw6IndpdGhkcmF3X2FkZHJlc3MiUg93aXRoZHJhd0FkZHJlc3M6COigHwCIoB8A');
@$core.Deprecated('Use msgSetWithdrawAddressResponseDescriptor instead')
const MsgSetWithdrawAddressResponse$json = const {
  '1': 'MsgSetWithdrawAddressResponse',
};

/// Descriptor for `MsgSetWithdrawAddressResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSetWithdrawAddressResponseDescriptor =
    $convert.base64Decode('Ch1Nc2dTZXRXaXRoZHJhd0FkZHJlc3NSZXNwb25zZQ==');
@$core.Deprecated('Use msgWithdrawDelegatorRewardDescriptor instead')
const MsgWithdrawDelegatorReward$json = const {
  '1': 'MsgWithdrawDelegatorReward',
  '2': const [
    const {
      '1': 'delegator_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'delegatorAddress'
    },
    const {
      '1': 'validator_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'validatorAddress'
    },
  ],
  '7': const {},
};

/// Descriptor for `MsgWithdrawDelegatorReward`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgWithdrawDelegatorRewardDescriptor =
    $convert.base64Decode(
        'ChpNc2dXaXRoZHJhd0RlbGVnYXRvclJld2FyZBJJChFkZWxlZ2F0b3JfYWRkcmVzcxgBIAEoCUIc8t4fGHlhbWw6ImRlbGVnYXRvcl9hZGRyZXNzIlIQZGVsZWdhdG9yQWRkcmVzcxJJChF2YWxpZGF0b3JfYWRkcmVzcxgCIAEoCUIc8t4fGHlhbWw6InZhbGlkYXRvcl9hZGRyZXNzIlIQdmFsaWRhdG9yQWRkcmVzczoI6KAfAIigHwA=');
@$core.Deprecated('Use msgWithdrawDelegatorRewardResponseDescriptor instead')
const MsgWithdrawDelegatorRewardResponse$json = const {
  '1': 'MsgWithdrawDelegatorRewardResponse',
};

/// Descriptor for `MsgWithdrawDelegatorRewardResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgWithdrawDelegatorRewardResponseDescriptor =
    $convert.base64Decode('CiJNc2dXaXRoZHJhd0RlbGVnYXRvclJld2FyZFJlc3BvbnNl');
@$core.Deprecated('Use msgWithdrawValidatorCommissionDescriptor instead')
const MsgWithdrawValidatorCommission$json = const {
  '1': 'MsgWithdrawValidatorCommission',
  '2': const [
    const {
      '1': 'validator_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'validatorAddress'
    },
  ],
  '7': const {},
};

/// Descriptor for `MsgWithdrawValidatorCommission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgWithdrawValidatorCommissionDescriptor =
    $convert.base64Decode(
        'Ch5Nc2dXaXRoZHJhd1ZhbGlkYXRvckNvbW1pc3Npb24SSQoRdmFsaWRhdG9yX2FkZHJlc3MYASABKAlCHPLeHxh5YW1sOiJ2YWxpZGF0b3JfYWRkcmVzcyJSEHZhbGlkYXRvckFkZHJlc3M6COigHwCIoB8A');
@$core
    .Deprecated('Use msgWithdrawValidatorCommissionResponseDescriptor instead')
const MsgWithdrawValidatorCommissionResponse$json = const {
  '1': 'MsgWithdrawValidatorCommissionResponse',
};

/// Descriptor for `MsgWithdrawValidatorCommissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgWithdrawValidatorCommissionResponseDescriptor =
    $convert.base64Decode(
        'CiZNc2dXaXRoZHJhd1ZhbGlkYXRvckNvbW1pc3Npb25SZXNwb25zZQ==');
@$core.Deprecated('Use msgFundCommunityPoolDescriptor instead')
const MsgFundCommunityPool$json = const {
  '1': 'MsgFundCommunityPool',
  '2': const [
    const {
      '1': 'amount',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'amount'
    },
    const {'1': 'depositor', '3': 2, '4': 1, '5': 9, '10': 'depositor'},
  ],
  '7': const {},
};

/// Descriptor for `MsgFundCommunityPool`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgFundCommunityPoolDescriptor = $convert.base64Decode(
    'ChRNc2dGdW5kQ29tbXVuaXR5UG9vbBJjCgZhbW91bnQYASADKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CMMjeHwCq3x8oZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5Db2luc1IGYW1vdW50EhwKCWRlcG9zaXRvchgCIAEoCVIJZGVwb3NpdG9yOgjooB8AiKAfAA==');
@$core.Deprecated('Use msgFundCommunityPoolResponseDescriptor instead')
const MsgFundCommunityPoolResponse$json = const {
  '1': 'MsgFundCommunityPoolResponse',
};

/// Descriptor for `MsgFundCommunityPoolResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgFundCommunityPoolResponseDescriptor =
    $convert.base64Decode('ChxNc2dGdW5kQ29tbXVuaXR5UG9vbFJlc3BvbnNl');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {
      '1': 'SetWithdrawAddress',
      '2': '.cosmos.distribution.v1beta1.MsgSetWithdrawAddress',
      '3': '.cosmos.distribution.v1beta1.MsgSetWithdrawAddressResponse'
    },
    const {
      '1': 'WithdrawDelegatorReward',
      '2': '.cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward',
      '3': '.cosmos.distribution.v1beta1.MsgWithdrawDelegatorRewardResponse'
    },
    const {
      '1': 'WithdrawValidatorCommission',
      '2': '.cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission',
      '3': '.cosmos.distribution.v1beta1.MsgWithdrawValidatorCommissionResponse'
    },
    const {
      '1': 'FundCommunityPool',
      '2': '.cosmos.distribution.v1beta1.MsgFundCommunityPool',
      '3': '.cosmos.distribution.v1beta1.MsgFundCommunityPoolResponse'
    },
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    MsgServiceBase$messageJson = const {
  '.cosmos.distribution.v1beta1.MsgSetWithdrawAddress':
      MsgSetWithdrawAddress$json,
  '.cosmos.distribution.v1beta1.MsgSetWithdrawAddressResponse':
      MsgSetWithdrawAddressResponse$json,
  '.cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward':
      MsgWithdrawDelegatorReward$json,
  '.cosmos.distribution.v1beta1.MsgWithdrawDelegatorRewardResponse':
      MsgWithdrawDelegatorRewardResponse$json,
  '.cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission':
      MsgWithdrawValidatorCommission$json,
  '.cosmos.distribution.v1beta1.MsgWithdrawValidatorCommissionResponse':
      MsgWithdrawValidatorCommissionResponse$json,
  '.cosmos.distribution.v1beta1.MsgFundCommunityPool':
      MsgFundCommunityPool$json,
  '.cosmos.base.v1beta1.Coin': $9.Coin$json,
  '.cosmos.distribution.v1beta1.MsgFundCommunityPoolResponse':
      MsgFundCommunityPoolResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode(
    'CgNNc2cShAEKElNldFdpdGhkcmF3QWRkcmVzcxIyLmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5Nc2dTZXRXaXRoZHJhd0FkZHJlc3MaOi5jb3Ntb3MuZGlzdHJpYnV0aW9uLnYxYmV0YTEuTXNnU2V0V2l0aGRyYXdBZGRyZXNzUmVzcG9uc2USkwEKF1dpdGhkcmF3RGVsZWdhdG9yUmV3YXJkEjcuY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLk1zZ1dpdGhkcmF3RGVsZWdhdG9yUmV3YXJkGj8uY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLk1zZ1dpdGhkcmF3RGVsZWdhdG9yUmV3YXJkUmVzcG9uc2USnwEKG1dpdGhkcmF3VmFsaWRhdG9yQ29tbWlzc2lvbhI7LmNvc21vcy5kaXN0cmlidXRpb24udjFiZXRhMS5Nc2dXaXRoZHJhd1ZhbGlkYXRvckNvbW1pc3Npb24aQy5jb3Ntb3MuZGlzdHJpYnV0aW9uLnYxYmV0YTEuTXNnV2l0aGRyYXdWYWxpZGF0b3JDb21taXNzaW9uUmVzcG9uc2USgQEKEUZ1bmRDb21tdW5pdHlQb29sEjEuY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLk1zZ0Z1bmRDb21tdW5pdHlQb29sGjkuY29zbW9zLmRpc3RyaWJ1dGlvbi52MWJldGExLk1zZ0Z1bmRDb21tdW5pdHlQb29sUmVzcG9uc2U=');
