///
//  Generated code. Do not modify.
//  source: cosmos/evidence/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'package:alan/proto/google/protobuf/any.pbjson.dart' as $0;

@$core.Deprecated('Use msgSubmitEvidenceDescriptor instead')
const MsgSubmitEvidence$json = const {
  '1': 'MsgSubmitEvidence',
  '2': const [
    const {'1': 'submitter', '3': 1, '4': 1, '5': 9, '10': 'submitter'},
    const {'1': 'evidence', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Any', '8': const {}, '10': 'evidence'},
  ],
  '7': const {},
};

/// Descriptor for `MsgSubmitEvidence`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSubmitEvidenceDescriptor = $convert.base64Decode('ChFNc2dTdWJtaXRFdmlkZW5jZRIcCglzdWJtaXR0ZXIYASABKAlSCXN1Ym1pdHRlchI+CghldmlkZW5jZRgCIAEoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlCDMq0LQhFdmlkZW5jZVIIZXZpZGVuY2U6COigHwCIoB8A');
@$core.Deprecated('Use msgSubmitEvidenceResponseDescriptor instead')
const MsgSubmitEvidenceResponse$json = const {
  '1': 'MsgSubmitEvidenceResponse',
  '2': const [
    const {'1': 'hash', '3': 4, '4': 1, '5': 12, '10': 'hash'},
  ],
};

/// Descriptor for `MsgSubmitEvidenceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSubmitEvidenceResponseDescriptor = $convert.base64Decode('ChlNc2dTdWJtaXRFdmlkZW5jZVJlc3BvbnNlEhIKBGhhc2gYBCABKAxSBGhhc2g=');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {'1': 'SubmitEvidence', '2': '.cosmos.evidence.v1beta1.MsgSubmitEvidence', '3': '.cosmos.evidence.v1beta1.MsgSubmitEvidenceResponse'},
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> MsgServiceBase$messageJson = const {
  '.cosmos.evidence.v1beta1.MsgSubmitEvidence': MsgSubmitEvidence$json,
  '.google.protobuf.Any': $0.Any$json,
  '.cosmos.evidence.v1beta1.MsgSubmitEvidenceResponse': MsgSubmitEvidenceResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode('CgNNc2cScAoOU3VibWl0RXZpZGVuY2USKi5jb3Ntb3MuZXZpZGVuY2UudjFiZXRhMS5Nc2dTdWJtaXRFdmlkZW5jZRoyLmNvc21vcy5ldmlkZW5jZS52MWJldGExLk1zZ1N1Ym1pdEV2aWRlbmNlUmVzcG9uc2U=');
