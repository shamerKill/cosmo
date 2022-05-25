///
//  Generated code. Do not modify.
//  source: ethermint/feemarket/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'feemarket.pbjson.dart' as $58;

@$core.Deprecated('Use queryParamsRequestDescriptor instead')
const QueryParamsRequest$json = const {
  '1': 'QueryParamsRequest',
};

/// Descriptor for `QueryParamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsRequestDescriptor = $convert.base64Decode('ChJRdWVyeVBhcmFtc1JlcXVlc3Q=');
@$core.Deprecated('Use queryParamsResponseDescriptor instead')
const QueryParamsResponse$json = const {
  '1': 'QueryParamsResponse',
  '2': const [
    const {'1': 'params', '3': 1, '4': 1, '5': 11, '6': '.ethermint.feemarket.v1.Params', '8': const {}, '10': 'params'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEjwKBnBhcmFtcxgBIAEoCzIeLmV0aGVybWludC5mZWVtYXJrZXQudjEuUGFyYW1zQgTI3h8AUgZwYXJhbXM=');
@$core.Deprecated('Use queryBaseFeeRequestDescriptor instead')
const QueryBaseFeeRequest$json = const {
  '1': 'QueryBaseFeeRequest',
};

/// Descriptor for `QueryBaseFeeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBaseFeeRequestDescriptor = $convert.base64Decode('ChNRdWVyeUJhc2VGZWVSZXF1ZXN0');
@$core.Deprecated('Use queryBaseFeeResponseDescriptor instead')
const QueryBaseFeeResponse$json = const {
  '1': 'QueryBaseFeeResponse',
  '2': const [
    const {'1': 'base_fee', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'baseFee'},
  ],
};

/// Descriptor for `QueryBaseFeeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBaseFeeResponseDescriptor = $convert.base64Decode('ChRRdWVyeUJhc2VGZWVSZXNwb25zZRJFCghiYXNlX2ZlZRgBIAEoCUIq2t4fJmdpdGh1Yi5jb20vY29zbW9zL2Nvc21vcy1zZGsvdHlwZXMuSW50UgdiYXNlRmVl');
@$core.Deprecated('Use queryBlockGasRequestDescriptor instead')
const QueryBlockGasRequest$json = const {
  '1': 'QueryBlockGasRequest',
};

/// Descriptor for `QueryBlockGasRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBlockGasRequestDescriptor = $convert.base64Decode('ChRRdWVyeUJsb2NrR2FzUmVxdWVzdA==');
@$core.Deprecated('Use queryBlockGasResponseDescriptor instead')
const QueryBlockGasResponse$json = const {
  '1': 'QueryBlockGasResponse',
  '2': const [
    const {'1': 'gas', '3': 1, '4': 1, '5': 3, '10': 'gas'},
  ],
};

/// Descriptor for `QueryBlockGasResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBlockGasResponseDescriptor = $convert.base64Decode('ChVRdWVyeUJsb2NrR2FzUmVzcG9uc2USEAoDZ2FzGAEgASgDUgNnYXM=');
const $core.Map<$core.String, $core.dynamic> QueryServiceBase$json = const {
  '1': 'Query',
  '2': const [
    const {'1': 'Params', '2': '.ethermint.feemarket.v1.QueryParamsRequest', '3': '.ethermint.feemarket.v1.QueryParamsResponse', '4': const {}},
    const {'1': 'BaseFee', '2': '.ethermint.feemarket.v1.QueryBaseFeeRequest', '3': '.ethermint.feemarket.v1.QueryBaseFeeResponse', '4': const {}},
    const {'1': 'BlockGas', '2': '.ethermint.feemarket.v1.QueryBlockGasRequest', '3': '.ethermint.feemarket.v1.QueryBlockGasResponse', '4': const {}},
  ],
};

@$core.Deprecated('Use queryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> QueryServiceBase$messageJson = const {
  '.ethermint.feemarket.v1.QueryParamsRequest': QueryParamsRequest$json,
  '.ethermint.feemarket.v1.QueryParamsResponse': QueryParamsResponse$json,
  '.ethermint.feemarket.v1.Params': $58.Params$json,
  '.ethermint.feemarket.v1.QueryBaseFeeRequest': QueryBaseFeeRequest$json,
  '.ethermint.feemarket.v1.QueryBaseFeeResponse': QueryBaseFeeResponse$json,
  '.ethermint.feemarket.v1.QueryBlockGasRequest': QueryBlockGasRequest$json,
  '.ethermint.feemarket.v1.QueryBlockGasResponse': QueryBlockGasResponse$json,
};

/// Descriptor for `Query`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List queryServiceDescriptor = $convert.base64Decode('CgVRdWVyeRKDAQoGUGFyYW1zEiouZXRoZXJtaW50LmZlZW1hcmtldC52MS5RdWVyeVBhcmFtc1JlcXVlc3QaKy5ldGhlcm1pbnQuZmVlbWFya2V0LnYxLlF1ZXJ5UGFyYW1zUmVzcG9uc2UiIILT5JMCGhIYL2ZlZW1hcmtldC9ldm0vdjEvcGFyYW1zEogBCgdCYXNlRmVlEisuZXRoZXJtaW50LmZlZW1hcmtldC52MS5RdWVyeUJhc2VGZWVSZXF1ZXN0GiwuZXRoZXJtaW50LmZlZW1hcmtldC52MS5RdWVyeUJhc2VGZWVSZXNwb25zZSIigtPkkwIcEhovZmVlbWFya2V0L2V2bS92MS9iYXNlX2ZlZRKMAQoIQmxvY2tHYXMSLC5ldGhlcm1pbnQuZmVlbWFya2V0LnYxLlF1ZXJ5QmxvY2tHYXNSZXF1ZXN0Gi0uZXRoZXJtaW50LmZlZW1hcmtldC52MS5RdWVyeUJsb2NrR2FzUmVzcG9uc2UiI4LT5JMCHRIbL2ZlZW1hcmtldC9ldm0vdjEvYmxvY2tfZ2Fz');
