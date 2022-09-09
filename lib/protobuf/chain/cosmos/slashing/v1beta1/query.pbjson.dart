///
//  Generated code. Do not modify.
//  source: cosmos/slashing/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'slashing.pbjson.dart' as $41;
import 'package:alan/proto/google/protobuf/duration.pbjson.dart' as $30;
import 'package:alan/proto/google/protobuf/timestamp.pbjson.dart' as $4;
import '../../base/query/v1beta1/pagination.pbjson.dart' as $2;

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
      '6': '.cosmos.slashing.v1beta1.Params',
      '8': const {},
      '10': 'params'
    },
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode(
    'ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEj0KBnBhcmFtcxgBIAEoCzIfLmNvc21vcy5zbGFzaGluZy52MWJldGExLlBhcmFtc0IEyN4fAFIGcGFyYW1z');
@$core.Deprecated('Use querySigningInfoRequestDescriptor instead')
const QuerySigningInfoRequest$json = const {
  '1': 'QuerySigningInfoRequest',
  '2': const [
    const {'1': 'cons_address', '3': 1, '4': 1, '5': 9, '10': 'consAddress'},
  ],
};

/// Descriptor for `QuerySigningInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySigningInfoRequestDescriptor =
    $convert.base64Decode(
        'ChdRdWVyeVNpZ25pbmdJbmZvUmVxdWVzdBIhCgxjb25zX2FkZHJlc3MYASABKAlSC2NvbnNBZGRyZXNz');
@$core.Deprecated('Use querySigningInfoResponseDescriptor instead')
const QuerySigningInfoResponse$json = const {
  '1': 'QuerySigningInfoResponse',
  '2': const [
    const {
      '1': 'val_signing_info',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.slashing.v1beta1.ValidatorSigningInfo',
      '8': const {},
      '10': 'valSigningInfo'
    },
  ],
};

/// Descriptor for `QuerySigningInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySigningInfoResponseDescriptor =
    $convert.base64Decode(
        'ChhRdWVyeVNpZ25pbmdJbmZvUmVzcG9uc2USXQoQdmFsX3NpZ25pbmdfaW5mbxgBIAEoCzItLmNvc21vcy5zbGFzaGluZy52MWJldGExLlZhbGlkYXRvclNpZ25pbmdJbmZvQgTI3h8AUg52YWxTaWduaW5nSW5mbw==');
@$core.Deprecated('Use querySigningInfosRequestDescriptor instead')
const QuerySigningInfosRequest$json = const {
  '1': 'QuerySigningInfosRequest',
  '2': const [
    const {
      '1': 'pagination',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QuerySigningInfosRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySigningInfosRequestDescriptor =
    $convert.base64Decode(
        'ChhRdWVyeVNpZ25pbmdJbmZvc1JlcXVlc3QSRgoKcGFnaW5hdGlvbhgBIAEoCzImLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlcXVlc3RSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use querySigningInfosResponseDescriptor instead')
const QuerySigningInfosResponse$json = const {
  '1': 'QuerySigningInfosResponse',
  '2': const [
    const {
      '1': 'info',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.cosmos.slashing.v1beta1.ValidatorSigningInfo',
      '8': const {},
      '10': 'info'
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

/// Descriptor for `QuerySigningInfosResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySigningInfosResponseDescriptor =
    $convert.base64Decode(
        'ChlRdWVyeVNpZ25pbmdJbmZvc1Jlc3BvbnNlEkcKBGluZm8YASADKAsyLS5jb3Ntb3Muc2xhc2hpbmcudjFiZXRhMS5WYWxpZGF0b3JTaWduaW5nSW5mb0IEyN4fAFIEaW5mbxJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
const $core.Map<$core.String, $core.dynamic> QueryServiceBase$json = const {
  '1': 'Query',
  '2': const [
    const {
      '1': 'Params',
      '2': '.cosmos.slashing.v1beta1.QueryParamsRequest',
      '3': '.cosmos.slashing.v1beta1.QueryParamsResponse',
      '4': const {}
    },
    const {
      '1': 'SigningInfo',
      '2': '.cosmos.slashing.v1beta1.QuerySigningInfoRequest',
      '3': '.cosmos.slashing.v1beta1.QuerySigningInfoResponse',
      '4': const {}
    },
    const {
      '1': 'SigningInfos',
      '2': '.cosmos.slashing.v1beta1.QuerySigningInfosRequest',
      '3': '.cosmos.slashing.v1beta1.QuerySigningInfosResponse',
      '4': const {}
    },
  ],
};

@$core.Deprecated('Use queryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    QueryServiceBase$messageJson = const {
  '.cosmos.slashing.v1beta1.QueryParamsRequest': QueryParamsRequest$json,
  '.cosmos.slashing.v1beta1.QueryParamsResponse': QueryParamsResponse$json,
  '.cosmos.slashing.v1beta1.Params': $41.Params$json,
  '.google.protobuf.Duration': $30.Duration$json,
  '.cosmos.slashing.v1beta1.QuerySigningInfoRequest':
      QuerySigningInfoRequest$json,
  '.cosmos.slashing.v1beta1.QuerySigningInfoResponse':
      QuerySigningInfoResponse$json,
  '.cosmos.slashing.v1beta1.ValidatorSigningInfo':
      $41.ValidatorSigningInfo$json,
  '.google.protobuf.Timestamp': $4.Timestamp$json,
  '.cosmos.slashing.v1beta1.QuerySigningInfosRequest':
      QuerySigningInfosRequest$json,
  '.cosmos.base.query.v1beta1.PageRequest': $2.PageRequest$json,
  '.cosmos.slashing.v1beta1.QuerySigningInfosResponse':
      QuerySigningInfosResponse$json,
  '.cosmos.base.query.v1beta1.PageResponse': $2.PageResponse$json,
};

/// Descriptor for `Query`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List queryServiceDescriptor = $convert.base64Decode(
    'CgVRdWVyeRKMAQoGUGFyYW1zEisuY29zbW9zLnNsYXNoaW5nLnYxYmV0YTEuUXVlcnlQYXJhbXNSZXF1ZXN0GiwuY29zbW9zLnNsYXNoaW5nLnYxYmV0YTEuUXVlcnlQYXJhbXNSZXNwb25zZSIngtPkkwIhEh8vY29zbW9zL3NsYXNoaW5nL3YxYmV0YTEvcGFyYW1zErEBCgtTaWduaW5nSW5mbxIwLmNvc21vcy5zbGFzaGluZy52MWJldGExLlF1ZXJ5U2lnbmluZ0luZm9SZXF1ZXN0GjEuY29zbW9zLnNsYXNoaW5nLnYxYmV0YTEuUXVlcnlTaWduaW5nSW5mb1Jlc3BvbnNlIj2C0+STAjcSNS9jb3Ntb3Mvc2xhc2hpbmcvdjFiZXRhMS9zaWduaW5nX2luZm9zL3tjb25zX2FkZHJlc3N9EqUBCgxTaWduaW5nSW5mb3MSMS5jb3Ntb3Muc2xhc2hpbmcudjFiZXRhMS5RdWVyeVNpZ25pbmdJbmZvc1JlcXVlc3QaMi5jb3Ntb3Muc2xhc2hpbmcudjFiZXRhMS5RdWVyeVNpZ25pbmdJbmZvc1Jlc3BvbnNlIi6C0+STAigSJi9jb3Ntb3Mvc2xhc2hpbmcvdjFiZXRhMS9zaWduaW5nX2luZm9z');
