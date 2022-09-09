///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'package:alan/proto/google/protobuf/any.pbjson.dart' as $0;

@$core.Deprecated('Use msgGrantAllowanceDescriptor instead')
const MsgGrantAllowance$json = const {
  '1': 'MsgGrantAllowance',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
    const {
      '1': 'allowance',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '8': const {},
      '10': 'allowance'
    },
  ],
};

/// Descriptor for `MsgGrantAllowance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgGrantAllowanceDescriptor = $convert.base64Decode(
    'ChFNc2dHcmFudEFsbG93YW5jZRIYCgdncmFudGVyGAEgASgJUgdncmFudGVyEhgKB2dyYW50ZWUYAiABKAlSB2dyYW50ZWUSRQoJYWxsb3dhbmNlGAMgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueUIRyrQtDUZlZUFsbG93YW5jZUlSCWFsbG93YW5jZQ==');
@$core.Deprecated('Use msgGrantAllowanceResponseDescriptor instead')
const MsgGrantAllowanceResponse$json = const {
  '1': 'MsgGrantAllowanceResponse',
};

/// Descriptor for `MsgGrantAllowanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgGrantAllowanceResponseDescriptor =
    $convert.base64Decode('ChlNc2dHcmFudEFsbG93YW5jZVJlc3BvbnNl');
@$core.Deprecated('Use msgRevokeAllowanceDescriptor instead')
const MsgRevokeAllowance$json = const {
  '1': 'MsgRevokeAllowance',
  '2': const [
    const {'1': 'granter', '3': 1, '4': 1, '5': 9, '10': 'granter'},
    const {'1': 'grantee', '3': 2, '4': 1, '5': 9, '10': 'grantee'},
  ],
};

/// Descriptor for `MsgRevokeAllowance`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRevokeAllowanceDescriptor = $convert.base64Decode(
    'ChJNc2dSZXZva2VBbGxvd2FuY2USGAoHZ3JhbnRlchgBIAEoCVIHZ3JhbnRlchIYCgdncmFudGVlGAIgASgJUgdncmFudGVl');
@$core.Deprecated('Use msgRevokeAllowanceResponseDescriptor instead')
const MsgRevokeAllowanceResponse$json = const {
  '1': 'MsgRevokeAllowanceResponse',
};

/// Descriptor for `MsgRevokeAllowanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgRevokeAllowanceResponseDescriptor =
    $convert.base64Decode('ChpNc2dSZXZva2VBbGxvd2FuY2VSZXNwb25zZQ==');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {
      '1': 'GrantAllowance',
      '2': '.cosmos.feegrant.v1beta1.MsgGrantAllowance',
      '3': '.cosmos.feegrant.v1beta1.MsgGrantAllowanceResponse'
    },
    const {
      '1': 'RevokeAllowance',
      '2': '.cosmos.feegrant.v1beta1.MsgRevokeAllowance',
      '3': '.cosmos.feegrant.v1beta1.MsgRevokeAllowanceResponse'
    },
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    MsgServiceBase$messageJson = const {
  '.cosmos.feegrant.v1beta1.MsgGrantAllowance': MsgGrantAllowance$json,
  '.google.protobuf.Any': $0.Any$json,
  '.cosmos.feegrant.v1beta1.MsgGrantAllowanceResponse':
      MsgGrantAllowanceResponse$json,
  '.cosmos.feegrant.v1beta1.MsgRevokeAllowance': MsgRevokeAllowance$json,
  '.cosmos.feegrant.v1beta1.MsgRevokeAllowanceResponse':
      MsgRevokeAllowanceResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode(
    'CgNNc2cScAoOR3JhbnRBbGxvd2FuY2USKi5jb3Ntb3MuZmVlZ3JhbnQudjFiZXRhMS5Nc2dHcmFudEFsbG93YW5jZRoyLmNvc21vcy5mZWVncmFudC52MWJldGExLk1zZ0dyYW50QWxsb3dhbmNlUmVzcG9uc2UScwoPUmV2b2tlQWxsb3dhbmNlEisuY29zbW9zLmZlZWdyYW50LnYxYmV0YTEuTXNnUmV2b2tlQWxsb3dhbmNlGjMuY29zbW9zLmZlZWdyYW50LnYxYmV0YTEuTXNnUmV2b2tlQWxsb3dhbmNlUmVzcG9uc2U=');
