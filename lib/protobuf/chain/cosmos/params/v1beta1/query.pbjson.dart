///
//  Generated code. Do not modify.
//  source: cosmos/params/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'params.pbjson.dart' as $39;

@$core.Deprecated('Use queryParamsRequestDescriptor instead')
const QueryParamsRequest$json = const {
  '1': 'QueryParamsRequest',
  '2': const [
    const {'1': 'subspace', '3': 1, '4': 1, '5': 9, '10': 'subspace'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `QueryParamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsRequestDescriptor = $convert.base64Decode('ChJRdWVyeVBhcmFtc1JlcXVlc3QSGgoIc3Vic3BhY2UYASABKAlSCHN1YnNwYWNlEhAKA2tleRgCIAEoCVIDa2V5');
@$core.Deprecated('Use queryParamsResponseDescriptor instead')
const QueryParamsResponse$json = const {
  '1': 'QueryParamsResponse',
  '2': const [
    const {'1': 'param', '3': 1, '4': 1, '5': 11, '6': '.cosmos.params.v1beta1.ParamChange', '8': const {}, '10': 'param'},
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode('ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEj4KBXBhcmFtGAEgASgLMiIuY29zbW9zLnBhcmFtcy52MWJldGExLlBhcmFtQ2hhbmdlQgTI3h8AUgVwYXJhbQ==');
const $core.Map<$core.String, $core.dynamic> QueryServiceBase$json = const {
  '1': 'Query',
  '2': const [
    const {'1': 'Params', '2': '.cosmos.params.v1beta1.QueryParamsRequest', '3': '.cosmos.params.v1beta1.QueryParamsResponse', '4': const {}},
  ],
};

@$core.Deprecated('Use queryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> QueryServiceBase$messageJson = const {
  '.cosmos.params.v1beta1.QueryParamsRequest': QueryParamsRequest$json,
  '.cosmos.params.v1beta1.QueryParamsResponse': QueryParamsResponse$json,
  '.cosmos.params.v1beta1.ParamChange': $39.ParamChange$json,
};

/// Descriptor for `Query`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List queryServiceDescriptor = $convert.base64Decode('CgVRdWVyeRKGAQoGUGFyYW1zEikuY29zbW9zLnBhcmFtcy52MWJldGExLlF1ZXJ5UGFyYW1zUmVxdWVzdBoqLmNvc21vcy5wYXJhbXMudjFiZXRhMS5RdWVyeVBhcmFtc1Jlc3BvbnNlIiWC0+STAh8SHS9jb3Ntb3MvcGFyYW1zL3YxYmV0YTEvcGFyYW1z');
