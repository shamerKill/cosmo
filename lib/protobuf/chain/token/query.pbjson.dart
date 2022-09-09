///
//  Generated code. Do not modify.
//  source: token/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use queryTokenRequestDescriptor instead')
const QueryTokenRequest$json = const {
  '1': 'QueryTokenRequest',
  '2': const [
    const {'1': 'denom', '3': 1, '4': 1, '5': 9, '10': 'denom'},
  ],
};

/// Descriptor for `QueryTokenRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenRequestDescriptor = $convert
    .base64Decode('ChFRdWVyeVRva2VuUmVxdWVzdBIUCgVkZW5vbRgBIAEoCVIFZGVub20=');
@$core.Deprecated('Use queryTokenResponseDescriptor instead')
const QueryTokenResponse$json = const {
  '1': 'QueryTokenResponse',
  '2': const [
    const {
      '1': 'Token',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '8': const {},
      '10': 'Token'
    },
  ],
};

/// Descriptor for `QueryTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokenResponseDescriptor = $convert.base64Decode(
    'ChJRdWVyeVRva2VuUmVzcG9uc2USNgoFVG9rZW4YASABKAsyFC5nb29nbGUucHJvdG9idWYuQW55QgrKtC0GVG9rZW5JUgVUb2tlbg==');
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
      '6': '.plugchain.token.Params',
      '8': const {},
      '10': 'params'
    },
    const {
      '1': 'res',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageResponse',
      '10': 'res'
    },
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode(
    'ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEjUKBnBhcmFtcxgBIAEoCzIXLnBsdWdjaGFpbi50b2tlbi5QYXJhbXNCBMjeHwBSBnBhcmFtcxI5CgNyZXMYAiABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIDcmVz');
@$core.Deprecated('Use queryTokensRequestDescriptor instead')
const QueryTokensRequest$json = const {
  '1': 'QueryTokensRequest',
  '2': const [
    const {'1': 'owner', '3': 1, '4': 1, '5': 9, '10': 'owner'},
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

/// Descriptor for `QueryTokensRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokensRequestDescriptor = $convert.base64Decode(
    'ChJRdWVyeVRva2Vuc1JlcXVlc3QSFAoFb3duZXIYASABKAlSBW93bmVyEkYKCnBhZ2luYXRpb24YAiABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryTokensResponseDescriptor instead')
const QueryTokensResponse$json = const {
  '1': 'QueryTokensResponse',
  '2': const [
    const {
      '1': 'Tokens',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Any',
      '8': const {},
      '10': 'Tokens'
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

/// Descriptor for `QueryTokensResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTokensResponseDescriptor = $convert.base64Decode(
    'ChNRdWVyeVRva2Vuc1Jlc3BvbnNlEjgKBlRva2VucxgBIAMoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlCCsq0LQZUb2tlbklSBlRva2VucxJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use queryFeesRequestDescriptor instead')
const QueryFeesRequest$json = const {
  '1': 'QueryFeesRequest',
  '2': const [
    const {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
  ],
};

/// Descriptor for `QueryFeesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryFeesRequestDescriptor = $convert
    .base64Decode('ChBRdWVyeUZlZXNSZXF1ZXN0EhYKBnN5bWJvbBgBIAEoCVIGc3ltYm9s');
@$core.Deprecated('Use queryFeesResponseDescriptor instead')
const QueryFeesResponse$json = const {
  '1': 'QueryFeesResponse',
  '2': const [
    const {'1': 'exist', '3': 1, '4': 1, '5': 8, '10': 'exist'},
    const {
      '1': 'issue_fee',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'issueFee'
    },
    const {
      '1': 'operate_fee',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'operateFee'
    },
  ],
};

/// Descriptor for `QueryFeesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryFeesResponseDescriptor = $convert.base64Decode(
    'ChFRdWVyeUZlZXNSZXNwb25zZRIUCgVleGlzdBgBIAEoCFIFZXhpc3QSZwoJaXNzdWVfZmVlGAIgASgLMhkuY29zbW9zLmJhc2UudjFiZXRhMS5Db2luQi/I3h8A+t4fJ2dpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuQ29pblIIaXNzdWVGZWUSawoLb3BlcmF0ZV9mZWUYAyABKAsyGS5jb3Ntb3MuYmFzZS52MWJldGExLkNvaW5CL8jeHwD63h8nZ2l0aHViLmNvbS9jb3Ntb3MvY29zbW9zLXNkay90eXBlcy5Db2luUgpvcGVyYXRlRmVl');
