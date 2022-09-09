///
//  Generated code. Do not modify.
//  source: cosmos/vesting/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import '../../base/v1beta1/coin.pbjson.dart' as $9;

@$core.Deprecated('Use msgCreateVestingAccountDescriptor instead')
const MsgCreateVestingAccount$json = const {
  '1': 'MsgCreateVestingAccount',
  '2': const [
    const {
      '1': 'from_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'fromAddress'
    },
    const {
      '1': 'to_address',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'toAddress'
    },
    const {
      '1': 'amount',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'amount'
    },
    const {
      '1': 'end_time',
      '3': 4,
      '4': 1,
      '5': 3,
      '8': const {},
      '10': 'endTime'
    },
    const {'1': 'delayed', '3': 5, '4': 1, '5': 8, '10': 'delayed'},
  ],
  '7': const {},
};

/// Descriptor for `MsgCreateVestingAccount`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateVestingAccountDescriptor =
    $convert.base64Decode(
        'ChdNc2dDcmVhdGVWZXN0aW5nQWNjb3VudBI6Cgxmcm9tX2FkZHJlc3MYASABKAlCF/LeHxN5YW1sOiJmcm9tX2FkZHJlc3MiUgtmcm9tQWRkcmVzcxI0Cgp0b19hZGRyZXNzGAIgASgJQhXy3h8ReWFtbDoidG9fYWRkcmVzcyJSCXRvQWRkcmVzcxJjCgZhbW91bnQYAyADKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CMMjeHwCq3x8oZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5Db2luc1IGYW1vdW50Ei4KCGVuZF90aW1lGAQgASgDQhPy3h8PeWFtbDoiZW5kX3RpbWUiUgdlbmRUaW1lEhgKB2RlbGF5ZWQYBSABKAhSB2RlbGF5ZWQ6BOigHwE=');
@$core.Deprecated('Use msgCreateVestingAccountResponseDescriptor instead')
const MsgCreateVestingAccountResponse$json = const {
  '1': 'MsgCreateVestingAccountResponse',
};

/// Descriptor for `MsgCreateVestingAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgCreateVestingAccountResponseDescriptor =
    $convert.base64Decode('Ch9Nc2dDcmVhdGVWZXN0aW5nQWNjb3VudFJlc3BvbnNl');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {
      '1': 'CreateVestingAccount',
      '2': '.cosmos.vesting.v1beta1.MsgCreateVestingAccount',
      '3': '.cosmos.vesting.v1beta1.MsgCreateVestingAccountResponse'
    },
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    MsgServiceBase$messageJson = const {
  '.cosmos.vesting.v1beta1.MsgCreateVestingAccount':
      MsgCreateVestingAccount$json,
  '.cosmos.base.v1beta1.Coin': $9.Coin$json,
  '.cosmos.vesting.v1beta1.MsgCreateVestingAccountResponse':
      MsgCreateVestingAccountResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode(
    'CgNNc2cSgAEKFENyZWF0ZVZlc3RpbmdBY2NvdW50Ei8uY29zbW9zLnZlc3RpbmcudjFiZXRhMS5Nc2dDcmVhdGVWZXN0aW5nQWNjb3VudBo3LmNvc21vcy52ZXN0aW5nLnYxYmV0YTEuTXNnQ3JlYXRlVmVzdGluZ0FjY291bnRSZXNwb25zZQ==');
