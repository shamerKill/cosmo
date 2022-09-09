///
//  Generated code. Do not modify.
//  source: token/token.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use tokenDescriptor instead')
const Token$json = const {
  '1': 'Token',
  '2': const [
    const {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'scale', '3': 3, '4': 1, '5': 13, '10': 'scale'},
    const {'1': 'min_unit', '3': 4, '4': 1, '5': 9, '10': 'minUnit'},
    const {
      '1': 'initial_supply',
      '3': 5,
      '4': 1,
      '5': 4,
      '10': 'initialSupply'
    },
    const {'1': 'max_supply', '3': 6, '4': 1, '5': 4, '10': 'maxSupply'},
    const {'1': 'mintable', '3': 7, '4': 1, '5': 8, '10': 'mintable'},
    const {'1': 'owner', '3': 8, '4': 1, '5': 9, '10': 'owner'},
  ],
  '7': const {},
};

/// Descriptor for `Token`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenDescriptor = $convert.base64Decode(
    'CgVUb2tlbhIWCgZzeW1ib2wYASABKAlSBnN5bWJvbBISCgRuYW1lGAIgASgJUgRuYW1lEhQKBXNjYWxlGAMgASgNUgVzY2FsZRIZCghtaW5fdW5pdBgEIAEoCVIHbWluVW5pdBIlCg5pbml0aWFsX3N1cHBseRgFIAEoBFINaW5pdGlhbFN1cHBseRIdCgptYXhfc3VwcGx5GAYgASgEUgltYXhTdXBwbHkSGgoIbWludGFibGUYByABKAhSCG1pbnRhYmxlEhQKBW93bmVyGAggASgJUgVvd25lcjoImKAfAIigHwA=');
@$core.Deprecated('Use paramsDescriptor instead')
const Params$json = const {
  '1': 'Params',
  '2': const [
    const {
      '1': 'issue_token_base_fee',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'issueTokenBaseFee'
    },
    const {
      '1': 'operate_token_fee_ratio',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'operateTokenFeeRatio'
    },
  ],
  '7': const {},
};

/// Descriptor for `Params`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paramsDescriptor = $convert.base64Decode(
    'CgZQYXJhbXMSUAoUaXNzdWVfdG9rZW5fYmFzZV9mZWUYASABKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CBMjeHwBSEWlzc3VlVG9rZW5CYXNlRmVlEmUKF29wZXJhdGVfdG9rZW5fZmVlX3JhdGlvGAIgASgJQi7a3h8mZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5EZWPI3h8AUhRvcGVyYXRlVG9rZW5GZWVSYXRpbzoI6KAfAZigHwA=');
