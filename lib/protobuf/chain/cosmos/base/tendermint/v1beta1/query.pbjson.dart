///
//  Generated code. Do not modify.
//  source: cosmos/base/tendermint/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'package:alan/proto/tendermint/p2p/types.pbjson.dart' as $17;
import 'package:alan/proto/tendermint/types/types.pbjson.dart' as $15;
import 'package:alan/proto/tendermint/types/block.pbjson.dart' as $16;
import 'package:alan/proto/tendermint/version/types.pbjson.dart' as $18;
import 'package:alan/proto/google/protobuf/timestamp.pbjson.dart' as $4;
import 'package:alan/proto/tendermint/types/evidence.pbjson.dart' as $19;
import 'package:alan/proto/tendermint/types/validator.pbjson.dart' as $20;
import 'package:alan/proto/tendermint/crypto/keys.pbjson.dart' as $21;
import '../../query/v1beta1/pagination.pbjson.dart' as $2;
import 'package:alan/proto/google/protobuf/any.pbjson.dart' as $0;

@$core.Deprecated('Use getValidatorSetByHeightRequestDescriptor instead')
const GetValidatorSetByHeightRequest$json = const {
  '1': 'GetValidatorSetByHeightRequest',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 3, '10': 'height'},
    const {'1': 'pagination', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `GetValidatorSetByHeightRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorSetByHeightRequestDescriptor = $convert.base64Decode('Ch5HZXRWYWxpZGF0b3JTZXRCeUhlaWdodFJlcXVlc3QSFgoGaGVpZ2h0GAEgASgDUgZoZWlnaHQSRgoKcGFnaW5hdGlvbhgCIAEoCzImLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlcXVlc3RSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use getValidatorSetByHeightResponseDescriptor instead')
const GetValidatorSetByHeightResponse$json = const {
  '1': 'GetValidatorSetByHeightResponse',
  '2': const [
    const {'1': 'block_height', '3': 1, '4': 1, '5': 3, '10': 'blockHeight'},
    const {'1': 'validators', '3': 2, '4': 3, '5': 11, '6': '.cosmos.base.tendermint.v1beta1.Validator', '10': 'validators'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `GetValidatorSetByHeightResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getValidatorSetByHeightResponseDescriptor = $convert.base64Decode('Ch9HZXRWYWxpZGF0b3JTZXRCeUhlaWdodFJlc3BvbnNlEiEKDGJsb2NrX2hlaWdodBgBIAEoA1ILYmxvY2tIZWlnaHQSSQoKdmFsaWRhdG9ycxgCIAMoCzIpLmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5WYWxpZGF0b3JSCnZhbGlkYXRvcnMSRwoKcGFnaW5hdGlvbhgDIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
@$core.Deprecated('Use getLatestValidatorSetRequestDescriptor instead')
const GetLatestValidatorSetRequest$json = const {
  '1': 'GetLatestValidatorSetRequest',
  '2': const [
    const {'1': 'pagination', '3': 1, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageRequest', '10': 'pagination'},
  ],
};

/// Descriptor for `GetLatestValidatorSetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLatestValidatorSetRequestDescriptor = $convert.base64Decode('ChxHZXRMYXRlc3RWYWxpZGF0b3JTZXRSZXF1ZXN0EkYKCnBhZ2luYXRpb24YASABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use getLatestValidatorSetResponseDescriptor instead')
const GetLatestValidatorSetResponse$json = const {
  '1': 'GetLatestValidatorSetResponse',
  '2': const [
    const {'1': 'block_height', '3': 1, '4': 1, '5': 3, '10': 'blockHeight'},
    const {'1': 'validators', '3': 2, '4': 3, '5': 11, '6': '.cosmos.base.tendermint.v1beta1.Validator', '10': 'validators'},
    const {'1': 'pagination', '3': 3, '4': 1, '5': 11, '6': '.cosmos.base.query.v1beta1.PageResponse', '10': 'pagination'},
  ],
};

/// Descriptor for `GetLatestValidatorSetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLatestValidatorSetResponseDescriptor = $convert.base64Decode('Ch1HZXRMYXRlc3RWYWxpZGF0b3JTZXRSZXNwb25zZRIhCgxibG9ja19oZWlnaHQYASABKANSC2Jsb2NrSGVpZ2h0EkkKCnZhbGlkYXRvcnMYAiADKAsyKS5jb3Ntb3MuYmFzZS50ZW5kZXJtaW50LnYxYmV0YTEuVmFsaWRhdG9yUgp2YWxpZGF0b3JzEkcKCnBhZ2luYXRpb24YAyABKAsyJy5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXNwb25zZVIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use validatorDescriptor instead')
const Validator$json = const {
  '1': 'Validator',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'pub_key', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'pubKey'},
    const {'1': 'voting_power', '3': 3, '4': 1, '5': 3, '10': 'votingPower'},
    const {'1': 'proposer_priority', '3': 4, '4': 1, '5': 3, '10': 'proposerPriority'},
  ],
};

/// Descriptor for `Validator`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validatorDescriptor = $convert.base64Decode('CglWYWxpZGF0b3ISGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcxItCgdwdWJfa2V5GAIgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueVIGcHViS2V5EiEKDHZvdGluZ19wb3dlchgDIAEoA1ILdm90aW5nUG93ZXISKwoRcHJvcG9zZXJfcHJpb3JpdHkYBCABKANSEHByb3Bvc2VyUHJpb3JpdHk=');
@$core.Deprecated('Use getBlockByHeightRequestDescriptor instead')
const GetBlockByHeightRequest$json = const {
  '1': 'GetBlockByHeightRequest',
  '2': const [
    const {'1': 'height', '3': 1, '4': 1, '5': 3, '10': 'height'},
  ],
};

/// Descriptor for `GetBlockByHeightRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockByHeightRequestDescriptor = $convert.base64Decode('ChdHZXRCbG9ja0J5SGVpZ2h0UmVxdWVzdBIWCgZoZWlnaHQYASABKANSBmhlaWdodA==');
@$core.Deprecated('Use getBlockByHeightResponseDescriptor instead')
const GetBlockByHeightResponse$json = const {
  '1': 'GetBlockByHeightResponse',
  '2': const [
    const {'1': 'block_id', '3': 1, '4': 1, '5': 11, '6': '.tendermint.types.BlockID', '10': 'blockId'},
    const {'1': 'block', '3': 2, '4': 1, '5': 11, '6': '.tendermint.types.Block', '10': 'block'},
  ],
};

/// Descriptor for `GetBlockByHeightResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBlockByHeightResponseDescriptor = $convert.base64Decode('ChhHZXRCbG9ja0J5SGVpZ2h0UmVzcG9uc2USNAoIYmxvY2tfaWQYASABKAsyGS50ZW5kZXJtaW50LnR5cGVzLkJsb2NrSURSB2Jsb2NrSWQSLQoFYmxvY2sYAiABKAsyFy50ZW5kZXJtaW50LnR5cGVzLkJsb2NrUgVibG9jaw==');
@$core.Deprecated('Use getLatestBlockRequestDescriptor instead')
const GetLatestBlockRequest$json = const {
  '1': 'GetLatestBlockRequest',
};

/// Descriptor for `GetLatestBlockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLatestBlockRequestDescriptor = $convert.base64Decode('ChVHZXRMYXRlc3RCbG9ja1JlcXVlc3Q=');
@$core.Deprecated('Use getLatestBlockResponseDescriptor instead')
const GetLatestBlockResponse$json = const {
  '1': 'GetLatestBlockResponse',
  '2': const [
    const {'1': 'block_id', '3': 1, '4': 1, '5': 11, '6': '.tendermint.types.BlockID', '10': 'blockId'},
    const {'1': 'block', '3': 2, '4': 1, '5': 11, '6': '.tendermint.types.Block', '10': 'block'},
  ],
};

/// Descriptor for `GetLatestBlockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLatestBlockResponseDescriptor = $convert.base64Decode('ChZHZXRMYXRlc3RCbG9ja1Jlc3BvbnNlEjQKCGJsb2NrX2lkGAEgASgLMhkudGVuZGVybWludC50eXBlcy5CbG9ja0lEUgdibG9ja0lkEi0KBWJsb2NrGAIgASgLMhcudGVuZGVybWludC50eXBlcy5CbG9ja1IFYmxvY2s=');
@$core.Deprecated('Use getSyncingRequestDescriptor instead')
const GetSyncingRequest$json = const {
  '1': 'GetSyncingRequest',
};

/// Descriptor for `GetSyncingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSyncingRequestDescriptor = $convert.base64Decode('ChFHZXRTeW5jaW5nUmVxdWVzdA==');
@$core.Deprecated('Use getSyncingResponseDescriptor instead')
const GetSyncingResponse$json = const {
  '1': 'GetSyncingResponse',
  '2': const [
    const {'1': 'syncing', '3': 1, '4': 1, '5': 8, '10': 'syncing'},
  ],
};

/// Descriptor for `GetSyncingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSyncingResponseDescriptor = $convert.base64Decode('ChJHZXRTeW5jaW5nUmVzcG9uc2USGAoHc3luY2luZxgBIAEoCFIHc3luY2luZw==');
@$core.Deprecated('Use getNodeInfoRequestDescriptor instead')
const GetNodeInfoRequest$json = const {
  '1': 'GetNodeInfoRequest',
};

/// Descriptor for `GetNodeInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNodeInfoRequestDescriptor = $convert.base64Decode('ChJHZXROb2RlSW5mb1JlcXVlc3Q=');
@$core.Deprecated('Use getNodeInfoResponseDescriptor instead')
const GetNodeInfoResponse$json = const {
  '1': 'GetNodeInfoResponse',
  '2': const [
    const {'1': 'default_node_info', '3': 1, '4': 1, '5': 11, '6': '.tendermint.p2p.DefaultNodeInfo', '10': 'defaultNodeInfo'},
    const {'1': 'application_version', '3': 2, '4': 1, '5': 11, '6': '.cosmos.base.tendermint.v1beta1.VersionInfo', '10': 'applicationVersion'},
  ],
};

/// Descriptor for `GetNodeInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNodeInfoResponseDescriptor = $convert.base64Decode('ChNHZXROb2RlSW5mb1Jlc3BvbnNlEksKEWRlZmF1bHRfbm9kZV9pbmZvGAEgASgLMh8udGVuZGVybWludC5wMnAuRGVmYXVsdE5vZGVJbmZvUg9kZWZhdWx0Tm9kZUluZm8SXAoTYXBwbGljYXRpb25fdmVyc2lvbhgCIAEoCzIrLmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5WZXJzaW9uSW5mb1ISYXBwbGljYXRpb25WZXJzaW9u');
@$core.Deprecated('Use versionInfoDescriptor instead')
const VersionInfo$json = const {
  '1': 'VersionInfo',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'app_name', '3': 2, '4': 1, '5': 9, '10': 'appName'},
    const {'1': 'version', '3': 3, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'git_commit', '3': 4, '4': 1, '5': 9, '10': 'gitCommit'},
    const {'1': 'build_tags', '3': 5, '4': 1, '5': 9, '10': 'buildTags'},
    const {'1': 'go_version', '3': 6, '4': 1, '5': 9, '10': 'goVersion'},
    const {'1': 'build_deps', '3': 7, '4': 3, '5': 11, '6': '.cosmos.base.tendermint.v1beta1.Module', '10': 'buildDeps'},
    const {'1': 'cosmos_sdk_version', '3': 8, '4': 1, '5': 9, '10': 'cosmosSdkVersion'},
  ],
};

/// Descriptor for `VersionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionInfoDescriptor = $convert.base64Decode('CgtWZXJzaW9uSW5mbxISCgRuYW1lGAEgASgJUgRuYW1lEhkKCGFwcF9uYW1lGAIgASgJUgdhcHBOYW1lEhgKB3ZlcnNpb24YAyABKAlSB3ZlcnNpb24SHQoKZ2l0X2NvbW1pdBgEIAEoCVIJZ2l0Q29tbWl0Eh0KCmJ1aWxkX3RhZ3MYBSABKAlSCWJ1aWxkVGFncxIdCgpnb192ZXJzaW9uGAYgASgJUglnb1ZlcnNpb24SRQoKYnVpbGRfZGVwcxgHIAMoCzImLmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5Nb2R1bGVSCWJ1aWxkRGVwcxIsChJjb3Ntb3Nfc2RrX3ZlcnNpb24YCCABKAlSEGNvc21vc1Nka1ZlcnNpb24=');
@$core.Deprecated('Use moduleDescriptor instead')
const Module$json = const {
  '1': 'Module',
  '2': const [
    const {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
    const {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
    const {'1': 'sum', '3': 3, '4': 1, '5': 9, '10': 'sum'},
  ],
};

/// Descriptor for `Module`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moduleDescriptor = $convert.base64Decode('CgZNb2R1bGUSEgoEcGF0aBgBIAEoCVIEcGF0aBIYCgd2ZXJzaW9uGAIgASgJUgd2ZXJzaW9uEhAKA3N1bRgDIAEoCVIDc3Vt');
const $core.Map<$core.String, $core.dynamic> ServiceBase$json = const {
  '1': 'Service',
  '2': const [
    const {'1': 'GetNodeInfo', '2': '.cosmos.base.tendermint.v1beta1.GetNodeInfoRequest', '3': '.cosmos.base.tendermint.v1beta1.GetNodeInfoResponse', '4': const {}},
    const {'1': 'GetSyncing', '2': '.cosmos.base.tendermint.v1beta1.GetSyncingRequest', '3': '.cosmos.base.tendermint.v1beta1.GetSyncingResponse', '4': const {}},
    const {'1': 'GetLatestBlock', '2': '.cosmos.base.tendermint.v1beta1.GetLatestBlockRequest', '3': '.cosmos.base.tendermint.v1beta1.GetLatestBlockResponse', '4': const {}},
    const {'1': 'GetBlockByHeight', '2': '.cosmos.base.tendermint.v1beta1.GetBlockByHeightRequest', '3': '.cosmos.base.tendermint.v1beta1.GetBlockByHeightResponse', '4': const {}},
    const {'1': 'GetLatestValidatorSet', '2': '.cosmos.base.tendermint.v1beta1.GetLatestValidatorSetRequest', '3': '.cosmos.base.tendermint.v1beta1.GetLatestValidatorSetResponse', '4': const {}},
    const {'1': 'GetValidatorSetByHeight', '2': '.cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightRequest', '3': '.cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightResponse', '4': const {}},
  ],
};

@$core.Deprecated('Use serviceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ServiceBase$messageJson = const {
  '.cosmos.base.tendermint.v1beta1.GetNodeInfoRequest': GetNodeInfoRequest$json,
  '.cosmos.base.tendermint.v1beta1.GetNodeInfoResponse': GetNodeInfoResponse$json,
  '.tendermint.p2p.DefaultNodeInfo': $17.DefaultNodeInfo$json,
  '.tendermint.p2p.ProtocolVersion': $17.ProtocolVersion$json,
  '.tendermint.p2p.DefaultNodeInfoOther': $17.DefaultNodeInfoOther$json,
  '.cosmos.base.tendermint.v1beta1.VersionInfo': VersionInfo$json,
  '.cosmos.base.tendermint.v1beta1.Module': Module$json,
  '.cosmos.base.tendermint.v1beta1.GetSyncingRequest': GetSyncingRequest$json,
  '.cosmos.base.tendermint.v1beta1.GetSyncingResponse': GetSyncingResponse$json,
  '.cosmos.base.tendermint.v1beta1.GetLatestBlockRequest': GetLatestBlockRequest$json,
  '.cosmos.base.tendermint.v1beta1.GetLatestBlockResponse': GetLatestBlockResponse$json,
  '.tendermint.types.BlockID': $15.BlockID$json,
  '.tendermint.types.PartSetHeader': $15.PartSetHeader$json,
  '.tendermint.types.Block': $16.Block$json,
  '.tendermint.types.Header': $15.Header$json,
  '.tendermint.version.Consensus': $18.Consensus$json,
  '.google.protobuf.Timestamp': $4.Timestamp$json,
  '.tendermint.types.Data': $15.Data$json,
  '.tendermint.types.EvidenceList': $19.EvidenceList$json,
  '.tendermint.types.Evidence': $19.Evidence$json,
  '.tendermint.types.DuplicateVoteEvidence': $19.DuplicateVoteEvidence$json,
  '.tendermint.types.Vote': $15.Vote$json,
  '.tendermint.types.LightClientAttackEvidence': $19.LightClientAttackEvidence$json,
  '.tendermint.types.LightBlock': $15.LightBlock$json,
  '.tendermint.types.SignedHeader': $15.SignedHeader$json,
  '.tendermint.types.Commit': $15.Commit$json,
  '.tendermint.types.CommitSig': $15.CommitSig$json,
  '.tendermint.types.ValidatorSet': $20.ValidatorSet$json,
  '.tendermint.types.Validator': $20.Validator$json,
  '.tendermint.crypto.PublicKey': $21.PublicKey$json,
  '.cosmos.base.tendermint.v1beta1.GetBlockByHeightRequest': GetBlockByHeightRequest$json,
  '.cosmos.base.tendermint.v1beta1.GetBlockByHeightResponse': GetBlockByHeightResponse$json,
  '.cosmos.base.tendermint.v1beta1.GetLatestValidatorSetRequest': GetLatestValidatorSetRequest$json,
  '.cosmos.base.query.v1beta1.PageRequest': $2.PageRequest$json,
  '.cosmos.base.tendermint.v1beta1.GetLatestValidatorSetResponse': GetLatestValidatorSetResponse$json,
  '.cosmos.base.tendermint.v1beta1.Validator': Validator$json,
  '.google.protobuf.Any': $0.Any$json,
  '.cosmos.base.query.v1beta1.PageResponse': $2.PageResponse$json,
  '.cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightRequest': GetValidatorSetByHeightRequest$json,
  '.cosmos.base.tendermint.v1beta1.GetValidatorSetByHeightResponse': GetValidatorSetByHeightResponse$json,
};

/// Descriptor for `Service`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List serviceDescriptor = $convert.base64Decode('CgdTZXJ2aWNlEqkBCgtHZXROb2RlSW5mbxIyLmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5HZXROb2RlSW5mb1JlcXVlc3QaMy5jb3Ntb3MuYmFzZS50ZW5kZXJtaW50LnYxYmV0YTEuR2V0Tm9kZUluZm9SZXNwb25zZSIxgtPkkwIrEikvY29zbW9zL2Jhc2UvdGVuZGVybWludC92MWJldGExL25vZGVfaW5mbxKkAQoKR2V0U3luY2luZxIxLmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5HZXRTeW5jaW5nUmVxdWVzdBoyLmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5HZXRTeW5jaW5nUmVzcG9uc2UiL4LT5JMCKRInL2Nvc21vcy9iYXNlL3RlbmRlcm1pbnQvdjFiZXRhMS9zeW5jaW5nErYBCg5HZXRMYXRlc3RCbG9jaxI1LmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5HZXRMYXRlc3RCbG9ja1JlcXVlc3QaNi5jb3Ntb3MuYmFzZS50ZW5kZXJtaW50LnYxYmV0YTEuR2V0TGF0ZXN0QmxvY2tSZXNwb25zZSI1gtPkkwIvEi0vY29zbW9zL2Jhc2UvdGVuZGVybWludC92MWJldGExL2Jsb2Nrcy9sYXRlc3QSvgEKEEdldEJsb2NrQnlIZWlnaHQSNy5jb3Ntb3MuYmFzZS50ZW5kZXJtaW50LnYxYmV0YTEuR2V0QmxvY2tCeUhlaWdodFJlcXVlc3QaOC5jb3Ntb3MuYmFzZS50ZW5kZXJtaW50LnYxYmV0YTEuR2V0QmxvY2tCeUhlaWdodFJlc3BvbnNlIjeC0+STAjESLy9jb3Ntb3MvYmFzZS90ZW5kZXJtaW50L3YxYmV0YTEvYmxvY2tzL3toZWlnaHR9EtIBChVHZXRMYXRlc3RWYWxpZGF0b3JTZXQSPC5jb3Ntb3MuYmFzZS50ZW5kZXJtaW50LnYxYmV0YTEuR2V0TGF0ZXN0VmFsaWRhdG9yU2V0UmVxdWVzdBo9LmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5HZXRMYXRlc3RWYWxpZGF0b3JTZXRSZXNwb25zZSI8gtPkkwI2EjQvY29zbW9zL2Jhc2UvdGVuZGVybWludC92MWJldGExL3ZhbGlkYXRvcnNldHMvbGF0ZXN0EtoBChdHZXRWYWxpZGF0b3JTZXRCeUhlaWdodBI+LmNvc21vcy5iYXNlLnRlbmRlcm1pbnQudjFiZXRhMS5HZXRWYWxpZGF0b3JTZXRCeUhlaWdodFJlcXVlc3QaPy5jb3Ntb3MuYmFzZS50ZW5kZXJtaW50LnYxYmV0YTEuR2V0VmFsaWRhdG9yU2V0QnlIZWlnaHRSZXNwb25zZSI+gtPkkwI4EjYvY29zbW9zL2Jhc2UvdGVuZGVybWludC92MWJldGExL3ZhbGlkYXRvcnNldHMve2hlaWdodH0=');
