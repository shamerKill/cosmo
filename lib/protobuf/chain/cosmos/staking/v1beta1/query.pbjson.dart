///
//  Generated code. Do not modify.
//  source: cosmos/staking/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import '../../base/query/v1beta1/pagination.pbjson.dart' as $2;
import 'staking.pbjson.dart' as $44;
import 'package:alan/proto/google/protobuf/any.pbjson.dart' as $0;
import 'package:alan/proto/google/protobuf/timestamp.pbjson.dart' as $4;
import '../../base/v1beta1/coin.pbjson.dart' as $9;
import 'package:alan/proto/tendermint/types/types.pbjson.dart' as $15;
import 'package:alan/proto/tendermint/version/types.pbjson.dart' as $18;
import 'package:alan/proto/google/protobuf/duration.pbjson.dart' as $30;

@$core.Deprecated('Use queryValidatorsRequestDescriptor instead')
const QueryValidatorsRequest$json = const {
  '1': 'QueryValidatorsRequest',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryValidatorsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValidatorsRequestDescriptor =
    $convert.base64Decode(
        'ChZRdWVyeVZhbGlkYXRvcnNSZXF1ZXN0EhYKBnN0YXR1cxgBIAEoCVIGc3RhdHVzEkYKCnBhZ2luYXRpb24YAiABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryValidatorsResponseDescriptor instead')
const QueryValidatorsResponse$json = const {
  '1': 'QueryValidatorsResponse',
  '2': const [
    const {
      '1': 'validators',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.Validator',
      '8': const {},
      '10': 'validators'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageResponse',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryValidatorsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValidatorsResponseDescriptor =
    $convert.base64Decode(
        'ChdRdWVyeVZhbGlkYXRvcnNSZXNwb25zZRJHCgp2YWxpZGF0b3JzGAEgAygLMiEuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5WYWxpZGF0b3JCBMjeHwBSCnZhbGlkYXRvcnMSRwoKcGFnaW5hdGlvbhgCIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryValidatorRequestDescriptor instead')
const QueryValidatorRequest$json = const {
  '1': 'QueryValidatorRequest',
  '2': const [
    const {
      '1': 'validator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'validatorAddr'
    },
  ],
};

/// Descriptor for `QueryValidatorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValidatorRequestDescriptor = $convert.base64Decode(
    'ChVRdWVyeVZhbGlkYXRvclJlcXVlc3QSJQoOdmFsaWRhdG9yX2FkZHIYASABKAlSDXZhbGlkYXRvckFkZHI=');
@$core.Deprecated('Use queryValidatorResponseDescriptor instead')
const QueryValidatorResponse$json = const {
  '1': 'QueryValidatorResponse',
  '2': const [
    const {
      '1': 'validator',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.Validator',
      '8': const {},
      '10': 'validator'
    },
  ],
};

/// Descriptor for `QueryValidatorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValidatorResponseDescriptor =
    $convert.base64Decode(
        'ChZRdWVyeVZhbGlkYXRvclJlc3BvbnNlEkUKCXZhbGlkYXRvchgBIAEoCzIhLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuVmFsaWRhdG9yQgTI3h8AUgl2YWxpZGF0b3I=');
@$core.Deprecated('Use queryValidatorDelegationsRequestDescriptor instead')
const QueryValidatorDelegationsRequest$json = const {
  '1': 'QueryValidatorDelegationsRequest',
  '2': const [
    const {
      '1': 'validator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'validatorAddr'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryValidatorDelegationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValidatorDelegationsRequestDescriptor =
    $convert.base64Decode(
        'CiBRdWVyeVZhbGlkYXRvckRlbGVnYXRpb25zUmVxdWVzdBIlCg52YWxpZGF0b3JfYWRkchgBIAEoCVINdmFsaWRhdG9yQWRkchJGCgpwYWdpbmF0aW9uGAIgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryValidatorDelegationsResponseDescriptor instead')
const QueryValidatorDelegationsResponse$json = const {
  '1': 'QueryValidatorDelegationsResponse',
  '2': const [
    const {
      '1': 'delegation_responses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.DelegationResponse',
      '8': const {},
      '10': 'delegationResponses'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageResponse',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryValidatorDelegationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValidatorDelegationsResponseDescriptor =
    $convert.base64Decode(
        'CiFRdWVyeVZhbGlkYXRvckRlbGVnYXRpb25zUmVzcG9uc2USegoUZGVsZWdhdGlvbl9yZXNwb25zZXMYASADKAsyKi5jb3Ntb3Muc3Rha2luZy52MWJldGExLkRlbGVnYXRpb25SZXNwb25zZUIbyN4fAKrfHxNEZWxlZ2F0aW9uUmVzcG9uc2VzUhNkZWxlZ2F0aW9uUmVzcG9uc2VzEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated(
    'Use queryValidatorUnbondingDelegationsRequestDescriptor instead')
const QueryValidatorUnbondingDelegationsRequest$json = const {
  '1': 'QueryValidatorUnbondingDelegationsRequest',
  '2': const [
    const {
      '1': 'validator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'validatorAddr'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryValidatorUnbondingDelegationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    queryValidatorUnbondingDelegationsRequestDescriptor = $convert.base64Decode(
        'CilRdWVyeVZhbGlkYXRvclVuYm9uZGluZ0RlbGVnYXRpb25zUmVxdWVzdBIlCg52YWxpZGF0b3JfYWRkchgBIAEoCVINdmFsaWRhdG9yQWRkchJGCgpwYWdpbmF0aW9uGAIgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated(
    'Use queryValidatorUnbondingDelegationsResponseDescriptor instead')
const QueryValidatorUnbondingDelegationsResponse$json = const {
  '1': 'QueryValidatorUnbondingDelegationsResponse',
  '2': const [
    const {
      '1': 'unbonding_responses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.UnbondingDelegation',
      '8': const {},
      '10': 'unbondingResponses'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageResponse',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryValidatorUnbondingDelegationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    queryValidatorUnbondingDelegationsResponseDescriptor =
    $convert.base64Decode(
        'CipRdWVyeVZhbGlkYXRvclVuYm9uZGluZ0RlbGVnYXRpb25zUmVzcG9uc2USYgoTdW5ib25kaW5nX3Jlc3BvbnNlcxgBIAMoCzIrLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuVW5ib25kaW5nRGVsZWdhdGlvbkIEyN4fAFISdW5ib25kaW5nUmVzcG9uc2VzEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryDelegationRequestDescriptor instead')
const QueryDelegationRequest$json = const {
  '1': 'QueryDelegationRequest',
  '2': const [
    const {
      '1': 'delegator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddr'
    },
    const {
      '1': 'validator_addr',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'validatorAddr'
    },
  ],
  '7': const {},
};

/// Descriptor for `QueryDelegationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegationRequestDescriptor =
    $convert.base64Decode(
        'ChZRdWVyeURlbGVnYXRpb25SZXF1ZXN0EiUKDmRlbGVnYXRvcl9hZGRyGAEgASgJUg1kZWxlZ2F0b3JBZGRyEiUKDnZhbGlkYXRvcl9hZGRyGAIgASgJUg12YWxpZGF0b3JBZGRyOgjooB8AiKAfAA==');
@$core.Deprecated('Use queryDelegationResponseDescriptor instead')
const QueryDelegationResponse$json = const {
  '1': 'QueryDelegationResponse',
  '2': const [
    const {
      '1': 'delegation_response',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.DelegationResponse',
      '10': 'delegationResponse'
    },
  ],
};

/// Descriptor for `QueryDelegationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegationResponseDescriptor =
    $convert.base64Decode(
        'ChdRdWVyeURlbGVnYXRpb25SZXNwb25zZRJbChNkZWxlZ2F0aW9uX3Jlc3BvbnNlGAEgASgLMiouY29zbW9zLnN0YWtpbmcudjFiZXRhMS5EZWxlZ2F0aW9uUmVzcG9uc2VSEmRlbGVnYXRpb25SZXNwb25zZQ==');
@$core.Deprecated('Use queryUnbondingDelegationRequestDescriptor instead')
const QueryUnbondingDelegationRequest$json = const {
  '1': 'QueryUnbondingDelegationRequest',
  '2': const [
    const {
      '1': 'delegator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddr'
    },
    const {
      '1': 'validator_addr',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'validatorAddr'
    },
  ],
  '7': const {},
};

/// Descriptor for `QueryUnbondingDelegationRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryUnbondingDelegationRequestDescriptor =
    $convert.base64Decode(
        'Ch9RdWVyeVVuYm9uZGluZ0RlbGVnYXRpb25SZXF1ZXN0EiUKDmRlbGVnYXRvcl9hZGRyGAEgASgJUg1kZWxlZ2F0b3JBZGRyEiUKDnZhbGlkYXRvcl9hZGRyGAIgASgJUg12YWxpZGF0b3JBZGRyOgjooB8AiKAfAA==');
@$core.Deprecated('Use queryUnbondingDelegationResponseDescriptor instead')
const QueryUnbondingDelegationResponse$json = const {
  '1': 'QueryUnbondingDelegationResponse',
  '2': const [
    const {
      '1': 'unbond',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.UnbondingDelegation',
      '8': const {},
      '10': 'unbond'
    },
  ],
};

/// Descriptor for `QueryUnbondingDelegationResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryUnbondingDelegationResponseDescriptor =
    $convert.base64Decode(
        'CiBRdWVyeVVuYm9uZGluZ0RlbGVnYXRpb25SZXNwb25zZRJJCgZ1bmJvbmQYASABKAsyKy5jb3Ntb3Muc3Rha2luZy52MWJldGExLlVuYm9uZGluZ0RlbGVnYXRpb25CBMjeHwBSBnVuYm9uZA==');
@$core.Deprecated('Use queryDelegatorDelegationsRequestDescriptor instead')
const QueryDelegatorDelegationsRequest$json = const {
  '1': 'QueryDelegatorDelegationsRequest',
  '2': const [
    const {
      '1': 'delegator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddr'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
  '7': const {},
};

/// Descriptor for `QueryDelegatorDelegationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegatorDelegationsRequestDescriptor =
    $convert.base64Decode(
        'CiBRdWVyeURlbGVnYXRvckRlbGVnYXRpb25zUmVxdWVzdBIlCg5kZWxlZ2F0b3JfYWRkchgBIAEoCVINZGVsZWdhdG9yQWRkchJGCgpwYWdpbmF0aW9uGAIgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbjoI6KAfAIigHwA=');
@$core.Deprecated('Use queryDelegatorDelegationsResponseDescriptor instead')
const QueryDelegatorDelegationsResponse$json = const {
  '1': 'QueryDelegatorDelegationsResponse',
  '2': const [
    const {
      '1': 'delegation_responses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.DelegationResponse',
      '8': const {},
      '10': 'delegationResponses'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageResponse',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryDelegatorDelegationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegatorDelegationsResponseDescriptor =
    $convert.base64Decode(
        'CiFRdWVyeURlbGVnYXRvckRlbGVnYXRpb25zUmVzcG9uc2USYwoUZGVsZWdhdGlvbl9yZXNwb25zZXMYASADKAsyKi5jb3Ntb3Muc3Rha2luZy52MWJldGExLkRlbGVnYXRpb25SZXNwb25zZUIEyN4fAFITZGVsZWdhdGlvblJlc3BvbnNlcxJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
@$core.Deprecated(
    'Use queryDelegatorUnbondingDelegationsRequestDescriptor instead')
const QueryDelegatorUnbondingDelegationsRequest$json = const {
  '1': 'QueryDelegatorUnbondingDelegationsRequest',
  '2': const [
    const {
      '1': 'delegator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddr'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
  '7': const {},
};

/// Descriptor for `QueryDelegatorUnbondingDelegationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    queryDelegatorUnbondingDelegationsRequestDescriptor = $convert.base64Decode(
        'CilRdWVyeURlbGVnYXRvclVuYm9uZGluZ0RlbGVnYXRpb25zUmVxdWVzdBIlCg5kZWxlZ2F0b3JfYWRkchgBIAEoCVINZGVsZWdhdG9yQWRkchJGCgpwYWdpbmF0aW9uGAIgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbjoI6KAfAIigHwA=');
@$core.Deprecated(
    'Use queryDelegatorUnbondingDelegationsResponseDescriptor instead')
const QueryDelegatorUnbondingDelegationsResponse$json = const {
  '1': 'QueryDelegatorUnbondingDelegationsResponse',
  '2': const [
    const {
      '1': 'unbonding_responses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.UnbondingDelegation',
      '8': const {},
      '10': 'unbondingResponses'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageResponse',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryDelegatorUnbondingDelegationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List
    queryDelegatorUnbondingDelegationsResponseDescriptor =
    $convert.base64Decode(
        'CipRdWVyeURlbGVnYXRvclVuYm9uZGluZ0RlbGVnYXRpb25zUmVzcG9uc2USYgoTdW5ib25kaW5nX3Jlc3BvbnNlcxgBIAMoCzIrLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuVW5ib25kaW5nRGVsZWdhdGlvbkIEyN4fAFISdW5ib25kaW5nUmVzcG9uc2VzEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryRedelegationsRequestDescriptor instead')
const QueryRedelegationsRequest$json = const {
  '1': 'QueryRedelegationsRequest',
  '2': const [
    const {
      '1': 'delegator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddr'
    },
    const {
      '1': 'src_validator_addr',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'srcValidatorAddr'
    },
    const {
      '1': 'dst_validator_addr',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'dstValidatorAddr'
    },
    const {
      '1': 'pagination',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
  '7': const {},
};

/// Descriptor for `QueryRedelegationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryRedelegationsRequestDescriptor =
    $convert.base64Decode(
        'ChlRdWVyeVJlZGVsZWdhdGlvbnNSZXF1ZXN0EiUKDmRlbGVnYXRvcl9hZGRyGAEgASgJUg1kZWxlZ2F0b3JBZGRyEiwKEnNyY192YWxpZGF0b3JfYWRkchgCIAEoCVIQc3JjVmFsaWRhdG9yQWRkchIsChJkc3RfdmFsaWRhdG9yX2FkZHIYAyABKAlSEGRzdFZhbGlkYXRvckFkZHISRgoKcGFnaW5hdGlvbhgEIAEoCzImLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlcXVlc3RSCnBhZ2luYXRpb246COigHwCIoB8A');
@$core.Deprecated('Use queryRedelegationsResponseDescriptor instead')
const QueryRedelegationsResponse$json = const {
  '1': 'QueryRedelegationsResponse',
  '2': const [
    const {
      '1': 'redelegation_responses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.RedelegationResponse',
      '8': const {},
      '10': 'redelegationResponses'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageResponse',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryRedelegationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryRedelegationsResponseDescriptor =
    $convert.base64Decode(
        'ChpRdWVyeVJlZGVsZWdhdGlvbnNSZXNwb25zZRJpChZyZWRlbGVnYXRpb25fcmVzcG9uc2VzGAEgAygLMiwuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5SZWRlbGVnYXRpb25SZXNwb25zZUIEyN4fAFIVcmVkZWxlZ2F0aW9uUmVzcG9uc2VzEkcKCnBhZ2luYXRpb24YAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryDelegatorValidatorsRequestDescriptor instead')
const QueryDelegatorValidatorsRequest$json = const {
  '1': 'QueryDelegatorValidatorsRequest',
  '2': const [
    const {
      '1': 'delegator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddr'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
  '7': const {},
};

/// Descriptor for `QueryDelegatorValidatorsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegatorValidatorsRequestDescriptor =
    $convert.base64Decode(
        'Ch9RdWVyeURlbGVnYXRvclZhbGlkYXRvcnNSZXF1ZXN0EiUKDmRlbGVnYXRvcl9hZGRyGAEgASgJUg1kZWxlZ2F0b3JBZGRyEkYKCnBhZ2luYXRpb24YAiABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9uOgjooB8AiKAfAA==');
@$core.Deprecated('Use queryDelegatorValidatorsResponseDescriptor instead')
const QueryDelegatorValidatorsResponse$json = const {
  '1': 'QueryDelegatorValidatorsResponse',
  '2': const [
    const {
      '1': 'validators',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.Validator',
      '8': const {},
      '10': 'validators'
    },
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageResponse',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryDelegatorValidatorsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegatorValidatorsResponseDescriptor =
    $convert.base64Decode(
        'CiBRdWVyeURlbGVnYXRvclZhbGlkYXRvcnNSZXNwb25zZRJHCgp2YWxpZGF0b3JzGAEgAygLMiEuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5WYWxpZGF0b3JCBMjeHwBSCnZhbGlkYXRvcnMSRwoKcGFnaW5hdGlvbhgCIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryDelegatorValidatorRequestDescriptor instead')
const QueryDelegatorValidatorRequest$json = const {
  '1': 'QueryDelegatorValidatorRequest',
  '2': const [
    const {
      '1': 'delegator_addr',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'delegatorAddr'
    },
    const {
      '1': 'validator_addr',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'validatorAddr'
    },
  ],
  '7': const {},
};

/// Descriptor for `QueryDelegatorValidatorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegatorValidatorRequestDescriptor =
    $convert.base64Decode(
        'Ch5RdWVyeURlbGVnYXRvclZhbGlkYXRvclJlcXVlc3QSJQoOZGVsZWdhdG9yX2FkZHIYASABKAlSDWRlbGVnYXRvckFkZHISJQoOdmFsaWRhdG9yX2FkZHIYAiABKAlSDXZhbGlkYXRvckFkZHI6COigHwCIoB8A');
@$core.Deprecated('Use queryDelegatorValidatorResponseDescriptor instead')
const QueryDelegatorValidatorResponse$json = const {
  '1': 'QueryDelegatorValidatorResponse',
  '2': const [
    const {
      '1': 'validator',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.Validator',
      '8': const {},
      '10': 'validator'
    },
  ],
};

/// Descriptor for `QueryDelegatorValidatorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryDelegatorValidatorResponseDescriptor =
    $convert.base64Decode(
        'Ch9RdWVyeURlbGVnYXRvclZhbGlkYXRvclJlc3BvbnNlEkUKCXZhbGlkYXRvchgBIAEoCzIhLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuVmFsaWRhdG9yQgTI3h8AUgl2YWxpZGF0b3I=');
@$core.Deprecated('Use queryHistoricalInfoRequestDescriptor instead')
const QueryHistoricalInfoRequest$json = const {
  '1': 'QueryHistoricalInfoRequest',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 3, '10': 'height'},
  ],
};

/// Descriptor for `QueryHistoricalInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryHistoricalInfoRequestDescriptor =
    $convert.base64Decode(
        'ChpRdWVyeUhpc3RvcmljYWxJbmZvUmVxdWVzdBIWCgZoZWlnaHQYASABKANSBmhlaWdodA==');
@$core.Deprecated('Use queryHistoricalInfoResponseDescriptor instead')
const QueryHistoricalInfoResponse$json = const {
  '1': 'QueryHistoricalInfoResponse',
  '2': const [
    const {
      '1': 'hist',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.HistoricalInfo',
      '10': 'hist'
    },
  ],
};

/// Descriptor for `QueryHistoricalInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryHistoricalInfoResponseDescriptor =
    $convert.base64Decode(
        'ChtRdWVyeUhpc3RvcmljYWxJbmZvUmVzcG9uc2USOgoEaGlzdBgBIAEoCzImLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuSGlzdG9yaWNhbEluZm9SBGhpc3Q=');
@$core.Deprecated('Use queryPoolRequestDescriptor instead')
const QueryPoolRequest$json = const {
  '1': 'QueryPoolRequest',
};

/// Descriptor for `QueryPoolRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPoolRequestDescriptor =
    $convert.base64Decode('ChBRdWVyeVBvb2xSZXF1ZXN0');
@$core.Deprecated('Use queryPoolResponseDescriptor instead')
const QueryPoolResponse$json = const {
  '1': 'QueryPoolResponse',
  '2': const [
    const {
      '1': 'pool',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.Pool',
      '8': const {},
      '10': 'pool'
    },
  ],
};

/// Descriptor for `QueryPoolResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryPoolResponseDescriptor = $convert.base64Decode(
    'ChFRdWVyeVBvb2xSZXNwb25zZRI2CgRwb29sGAEgASgLMhwuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5Qb29sQgTI3h8AUgRwb29s');
@$core.Deprecated('Use queryParamsRequestDescriptor instead')
const QueryParamsRequest$json = const {
  '1': 'QueryParamsRequest',
};

/// Descriptor for `QueryParamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsRequestDescriptor =
    $convert.base64Decode('ChJRdWVyeVBhcmFtc1JlcXVlc3Q=');
@$core.Deprecated('Use queryParamsResponseDescriptor instead')
const QueryParamsResponse$json = const {
  '1': 'QueryParamsResponse',
  '2': const [
    const {
      '1': 'params',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.staking.v1beta1.Params',
      '8': const {},
      '10': 'params'
    },
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode(
    'ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEjwKBnBhcmFtcxgBIAEoCzIeLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUGFyYW1zQgTI3h8AUgZwYXJhbXM=');
const $core.Map<$core.String, $core.dynamic> QueryServiceBase$json = const {
  '1': 'Query',
  '2': const [
    const {
      '1': 'Validators',
      '2': '.cosmos.staking.v1beta1.QueryValidatorsRequest',
      '3': '.cosmos.staking.v1beta1.QueryValidatorsResponse',
      '4': const {}
    },
    const {
      '1': 'Validator',
      '2': '.cosmos.staking.v1beta1.QueryValidatorRequest',
      '3': '.cosmos.staking.v1beta1.QueryValidatorResponse',
      '4': const {}
    },
    const {
      '1': 'ValidatorDelegations',
      '2': '.cosmos.staking.v1beta1.QueryValidatorDelegationsRequest',
      '3': '.cosmos.staking.v1beta1.QueryValidatorDelegationsResponse',
      '4': const {}
    },
    const {
      '1': 'ValidatorUnbondingDelegations',
      '2': '.cosmos.staking.v1beta1.QueryValidatorUnbondingDelegationsRequest',
      '3': '.cosmos.staking.v1beta1.QueryValidatorUnbondingDelegationsResponse',
      '4': const {}
    },
    const {
      '1': 'Delegation',
      '2': '.cosmos.staking.v1beta1.QueryDelegationRequest',
      '3': '.cosmos.staking.v1beta1.QueryDelegationResponse',
      '4': const {}
    },
    const {
      '1': 'UnbondingDelegation',
      '2': '.cosmos.staking.v1beta1.QueryUnbondingDelegationRequest',
      '3': '.cosmos.staking.v1beta1.QueryUnbondingDelegationResponse',
      '4': const {}
    },
    const {
      '1': 'DelegatorDelegations',
      '2': '.cosmos.staking.v1beta1.QueryDelegatorDelegationsRequest',
      '3': '.cosmos.staking.v1beta1.QueryDelegatorDelegationsResponse',
      '4': const {}
    },
    const {
      '1': 'DelegatorUnbondingDelegations',
      '2': '.cosmos.staking.v1beta1.QueryDelegatorUnbondingDelegationsRequest',
      '3': '.cosmos.staking.v1beta1.QueryDelegatorUnbondingDelegationsResponse',
      '4': const {}
    },
    const {
      '1': 'Redelegations',
      '2': '.cosmos.staking.v1beta1.QueryRedelegationsRequest',
      '3': '.cosmos.staking.v1beta1.QueryRedelegationsResponse',
      '4': const {}
    },
    const {
      '1': 'DelegatorValidators',
      '2': '.cosmos.staking.v1beta1.QueryDelegatorValidatorsRequest',
      '3': '.cosmos.staking.v1beta1.QueryDelegatorValidatorsResponse',
      '4': const {}
    },
    const {
      '1': 'DelegatorValidator',
      '2': '.cosmos.staking.v1beta1.QueryDelegatorValidatorRequest',
      '3': '.cosmos.staking.v1beta1.QueryDelegatorValidatorResponse',
      '4': const {}
    },
    const {
      '1': 'HistoricalInfo',
      '2': '.cosmos.staking.v1beta1.QueryHistoricalInfoRequest',
      '3': '.cosmos.staking.v1beta1.QueryHistoricalInfoResponse',
      '4': const {}
    },
    const {
      '1': 'Pool',
      '2': '.cosmos.staking.v1beta1.QueryPoolRequest',
      '3': '.cosmos.staking.v1beta1.QueryPoolResponse',
      '4': const {}
    },
    const {
      '1': 'Params',
      '2': '.cosmos.staking.v1beta1.QueryParamsRequest',
      '3': '.cosmos.staking.v1beta1.QueryParamsResponse',
      '4': const {}
    },
  ],
};

@$core.Deprecated('Use queryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    QueryServiceBase$messageJson = const {
  '.cosmos.staking.v1beta1.QueryValidatorsRequest': QueryValidatorsRequest$json,
  '.cosmos.base.query.v1beta1.PageRequest': $2.PageRequest$json,
  '.cosmos.staking.v1beta1.QueryValidatorsResponse':
      QueryValidatorsResponse$json,
  '.cosmos.staking.v1beta1.Validator': $44.Validator$json,
  '.google.protobuf.Any': $0.Any$json,
  '.cosmos.staking.v1beta1.Description': $44.Description$json,
  '.google.protobuf.Timestamp': $4.Timestamp$json,
  '.cosmos.staking.v1beta1.Commission': $44.Commission$json,
  '.cosmos.staking.v1beta1.CommissionRates': $44.CommissionRates$json,
  '.cosmos.base.query.v1beta1.PageResponse': $2.PageResponse$json,
  '.cosmos.staking.v1beta1.QueryValidatorRequest': QueryValidatorRequest$json,
  '.cosmos.staking.v1beta1.QueryValidatorResponse': QueryValidatorResponse$json,
  '.cosmos.staking.v1beta1.QueryValidatorDelegationsRequest':
      QueryValidatorDelegationsRequest$json,
  '.cosmos.staking.v1beta1.QueryValidatorDelegationsResponse':
      QueryValidatorDelegationsResponse$json,
  '.cosmos.staking.v1beta1.DelegationResponse': $44.DelegationResponse$json,
  '.cosmos.staking.v1beta1.Delegation': $44.Delegation$json,
  '.cosmos.base.v1beta1.Coin': $9.Coin$json,
  '.cosmos.staking.v1beta1.QueryValidatorUnbondingDelegationsRequest':
      QueryValidatorUnbondingDelegationsRequest$json,
  '.cosmos.staking.v1beta1.QueryValidatorUnbondingDelegationsResponse':
      QueryValidatorUnbondingDelegationsResponse$json,
  '.cosmos.staking.v1beta1.UnbondingDelegation': $44.UnbondingDelegation$json,
  '.cosmos.staking.v1beta1.UnbondingDelegationEntry':
      $44.UnbondingDelegationEntry$json,
  '.cosmos.staking.v1beta1.QueryDelegationRequest': QueryDelegationRequest$json,
  '.cosmos.staking.v1beta1.QueryDelegationResponse':
      QueryDelegationResponse$json,
  '.cosmos.staking.v1beta1.QueryUnbondingDelegationRequest':
      QueryUnbondingDelegationRequest$json,
  '.cosmos.staking.v1beta1.QueryUnbondingDelegationResponse':
      QueryUnbondingDelegationResponse$json,
  '.cosmos.staking.v1beta1.QueryDelegatorDelegationsRequest':
      QueryDelegatorDelegationsRequest$json,
  '.cosmos.staking.v1beta1.QueryDelegatorDelegationsResponse':
      QueryDelegatorDelegationsResponse$json,
  '.cosmos.staking.v1beta1.QueryDelegatorUnbondingDelegationsRequest':
      QueryDelegatorUnbondingDelegationsRequest$json,
  '.cosmos.staking.v1beta1.QueryDelegatorUnbondingDelegationsResponse':
      QueryDelegatorUnbondingDelegationsResponse$json,
  '.cosmos.staking.v1beta1.QueryRedelegationsRequest':
      QueryRedelegationsRequest$json,
  '.cosmos.staking.v1beta1.QueryRedelegationsResponse':
      QueryRedelegationsResponse$json,
  '.cosmos.staking.v1beta1.RedelegationResponse': $44.RedelegationResponse$json,
  '.cosmos.staking.v1beta1.Redelegation': $44.Redelegation$json,
  '.cosmos.staking.v1beta1.RedelegationEntry': $44.RedelegationEntry$json,
  '.cosmos.staking.v1beta1.RedelegationEntryResponse':
      $44.RedelegationEntryResponse$json,
  '.cosmos.staking.v1beta1.QueryDelegatorValidatorsRequest':
      QueryDelegatorValidatorsRequest$json,
  '.cosmos.staking.v1beta1.QueryDelegatorValidatorsResponse':
      QueryDelegatorValidatorsResponse$json,
  '.cosmos.staking.v1beta1.QueryDelegatorValidatorRequest':
      QueryDelegatorValidatorRequest$json,
  '.cosmos.staking.v1beta1.QueryDelegatorValidatorResponse':
      QueryDelegatorValidatorResponse$json,
  '.cosmos.staking.v1beta1.QueryHistoricalInfoRequest':
      QueryHistoricalInfoRequest$json,
  '.cosmos.staking.v1beta1.QueryHistoricalInfoResponse':
      QueryHistoricalInfoResponse$json,
  '.cosmos.staking.v1beta1.HistoricalInfo': $44.HistoricalInfo$json,
  '.tendermint.types.Header': $15.Header$json,
  '.tendermint.version.Consensus': $18.Consensus$json,
  '.tendermint.types.BlockID': $15.BlockID$json,
  '.tendermint.types.PartSetHeader': $15.PartSetHeader$json,
  '.cosmos.staking.v1beta1.QueryPoolRequest': QueryPoolRequest$json,
  '.cosmos.staking.v1beta1.QueryPoolResponse': QueryPoolResponse$json,
  '.cosmos.staking.v1beta1.Pool': $44.Pool$json,
  '.cosmos.staking.v1beta1.QueryParamsRequest': QueryParamsRequest$json,
  '.cosmos.staking.v1beta1.QueryParamsResponse': QueryParamsResponse$json,
  '.cosmos.staking.v1beta1.Params': $44.Params$json,
  '.google.protobuf.Duration': $30.Duration$json,
};

/// Descriptor for `Query`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List queryServiceDescriptor = $convert.base64Decode(
    'CgVRdWVyeRKZAQoKVmFsaWRhdG9ycxIuLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlWYWxpZGF0b3JzUmVxdWVzdBovLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlWYWxpZGF0b3JzUmVzcG9uc2UiKoLT5JMCJBIiL2Nvc21vcy9zdGFraW5nL3YxYmV0YTEvdmFsaWRhdG9ycxKnAQoJVmFsaWRhdG9yEi0uY29zbW9zLnN0YWtpbmcudjFiZXRhMS5RdWVyeVZhbGlkYXRvclJlcXVlc3QaLi5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5VmFsaWRhdG9yUmVzcG9uc2UiO4LT5JMCNRIzL2Nvc21vcy9zdGFraW5nL3YxYmV0YTEvdmFsaWRhdG9ycy97dmFsaWRhdG9yX2FkZHJ9EtQBChRWYWxpZGF0b3JEZWxlZ2F0aW9ucxI4LmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlWYWxpZGF0b3JEZWxlZ2F0aW9uc1JlcXVlc3QaOS5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5VmFsaWRhdG9yRGVsZWdhdGlvbnNSZXNwb25zZSJHgtPkkwJBEj8vY29zbW9zL3N0YWtpbmcvdjFiZXRhMS92YWxpZGF0b3JzL3t2YWxpZGF0b3JfYWRkcn0vZGVsZWdhdGlvbnMS+QEKHVZhbGlkYXRvclVuYm9uZGluZ0RlbGVnYXRpb25zEkEuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5RdWVyeVZhbGlkYXRvclVuYm9uZGluZ0RlbGVnYXRpb25zUmVxdWVzdBpCLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlWYWxpZGF0b3JVbmJvbmRpbmdEZWxlZ2F0aW9uc1Jlc3BvbnNlIlGC0+STAksSSS9jb3Ntb3Mvc3Rha2luZy92MWJldGExL3ZhbGlkYXRvcnMve3ZhbGlkYXRvcl9hZGRyfS91bmJvbmRpbmdfZGVsZWdhdGlvbnMSxwEKCkRlbGVnYXRpb24SLi5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5RGVsZWdhdGlvblJlcXVlc3QaLy5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5RGVsZWdhdGlvblJlc3BvbnNlIliC0+STAlISUC9jb3Ntb3Mvc3Rha2luZy92MWJldGExL3ZhbGlkYXRvcnMve3ZhbGlkYXRvcl9hZGRyfS9kZWxlZ2F0aW9ucy97ZGVsZWdhdG9yX2FkZHJ9EvcBChNVbmJvbmRpbmdEZWxlZ2F0aW9uEjcuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5RdWVyeVVuYm9uZGluZ0RlbGVnYXRpb25SZXF1ZXN0GjguY29zbW9zLnN0YWtpbmcudjFiZXRhMS5RdWVyeVVuYm9uZGluZ0RlbGVnYXRpb25SZXNwb25zZSJtgtPkkwJnEmUvY29zbW9zL3N0YWtpbmcvdjFiZXRhMS92YWxpZGF0b3JzL3t2YWxpZGF0b3JfYWRkcn0vZGVsZWdhdGlvbnMve2RlbGVnYXRvcl9hZGRyfS91bmJvbmRpbmdfZGVsZWdhdGlvbhLJAQoURGVsZWdhdG9yRGVsZWdhdGlvbnMSOC5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5RGVsZWdhdG9yRGVsZWdhdGlvbnNSZXF1ZXN0GjkuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5RdWVyeURlbGVnYXRvckRlbGVnYXRpb25zUmVzcG9uc2UiPILT5JMCNhI0L2Nvc21vcy9zdGFraW5nL3YxYmV0YTEvZGVsZWdhdGlvbnMve2RlbGVnYXRvcl9hZGRyfRL5AQodRGVsZWdhdG9yVW5ib25kaW5nRGVsZWdhdGlvbnMSQS5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5RGVsZWdhdG9yVW5ib25kaW5nRGVsZWdhdGlvbnNSZXF1ZXN0GkIuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5RdWVyeURlbGVnYXRvclVuYm9uZGluZ0RlbGVnYXRpb25zUmVzcG9uc2UiUYLT5JMCSxJJL2Nvc21vcy9zdGFraW5nL3YxYmV0YTEvZGVsZWdhdG9ycy97ZGVsZWdhdG9yX2FkZHJ9L3VuYm9uZGluZ19kZWxlZ2F0aW9ucxLBAQoNUmVkZWxlZ2F0aW9ucxIxLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlSZWRlbGVnYXRpb25zUmVxdWVzdBoyLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlSZWRlbGVnYXRpb25zUmVzcG9uc2UiSYLT5JMCQxJBL2Nvc21vcy9zdGFraW5nL3YxYmV0YTEvZGVsZWdhdG9ycy97ZGVsZWdhdG9yX2FkZHJ9L3JlZGVsZWdhdGlvbnMS0AEKE0RlbGVnYXRvclZhbGlkYXRvcnMSNy5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5RGVsZWdhdG9yVmFsaWRhdG9yc1JlcXVlc3QaOC5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5RGVsZWdhdG9yVmFsaWRhdG9yc1Jlc3BvbnNlIkaC0+STAkASPi9jb3Ntb3Mvc3Rha2luZy92MWJldGExL2RlbGVnYXRvcnMve2RlbGVnYXRvcl9hZGRyfS92YWxpZGF0b3JzEt4BChJEZWxlZ2F0b3JWYWxpZGF0b3ISNi5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5RGVsZWdhdG9yVmFsaWRhdG9yUmVxdWVzdBo3LmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlEZWxlZ2F0b3JWYWxpZGF0b3JSZXNwb25zZSJXgtPkkwJREk8vY29zbW9zL3N0YWtpbmcvdjFiZXRhMS9kZWxlZ2F0b3JzL3tkZWxlZ2F0b3JfYWRkcn0vdmFsaWRhdG9ycy97dmFsaWRhdG9yX2FkZHJ9ErMBCg5IaXN0b3JpY2FsSW5mbxIyLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlIaXN0b3JpY2FsSW5mb1JlcXVlc3QaMy5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5SGlzdG9yaWNhbEluZm9SZXNwb25zZSI4gtPkkwIyEjAvY29zbW9zL3N0YWtpbmcvdjFiZXRhMS9oaXN0b3JpY2FsX2luZm8ve2hlaWdodH0SgQEKBFBvb2wSKC5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5UG9vbFJlcXVlc3QaKS5jb3Ntb3Muc3Rha2luZy52MWJldGExLlF1ZXJ5UG9vbFJlc3BvbnNlIiSC0+STAh4SHC9jb3Ntb3Mvc3Rha2luZy92MWJldGExL3Bvb2wSiQEKBlBhcmFtcxIqLmNvc21vcy5zdGFraW5nLnYxYmV0YTEuUXVlcnlQYXJhbXNSZXF1ZXN0GisuY29zbW9zLnN0YWtpbmcudjFiZXRhMS5RdWVyeVBhcmFtc1Jlc3BvbnNlIiaC0+STAiASHi9jb3Ntb3Mvc3Rha2luZy92MWJldGExL3BhcmFtcw==');
