///
//  Generated code. Do not modify.
//  source: nft/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use msgIssueClassDescriptor instead')
const MsgIssueClass$json = const {
  '1': 'MsgIssueClass',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'schema', '3': 3, '4': 1, '5': 9, '10': 'schema'},
    const {'1': 'owner', '3': 4, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'symbol', '3': 5, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'mint_restricted', '3': 6, '4': 1, '5': 8, '10': 'mintRestricted'},
    const {'1': 'edit_restricted', '3': 7, '4': 1, '5': 8, '10': 'editRestricted'},
  ],
  '7': const {},
};

/// Descriptor for `MsgIssueClass`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgIssueClassDescriptor = $convert.base64Decode('Cg1Nc2dJc3N1ZUNsYXNzEhYKAmlkGAEgASgJQgbi3h8CSURSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFgoGc2NoZW1hGAMgASgJUgZzY2hlbWESFAoFb3duZXIYBCABKAlSBW93bmVyEhYKBnN5bWJvbBgFIAEoCVIGc3ltYm9sEicKD21pbnRfcmVzdHJpY3RlZBgGIAEoCFIObWludFJlc3RyaWN0ZWQSJwoPZWRpdF9yZXN0cmljdGVkGAcgASgIUg5lZGl0UmVzdHJpY3RlZDoE6KAfAQ==');
@$core.Deprecated('Use msgIssueClassResponseDescriptor instead')
const MsgIssueClassResponse$json = const {
  '1': 'MsgIssueClassResponse',
};

/// Descriptor for `MsgIssueClassResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgIssueClassResponseDescriptor = $convert.base64Decode('ChVNc2dJc3N1ZUNsYXNzUmVzcG9uc2U=');
@$core.Deprecated('Use msgIssueNFTDescriptor instead')
const MsgIssueNFT$json = const {
  '1': 'MsgIssueNFT',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'class_id', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'classId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uri', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'uri'},
    const {'1': 'data', '3': 5, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'owner', '3': 6, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'recipient', '3': 7, '4': 1, '5': 9, '10': 'recipient'},
  ],
  '7': const {},
};

/// Descriptor for `MsgIssueNFT`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgIssueNFTDescriptor = $convert.base64Decode('CgtNc2dJc3N1ZU5GVBIWCgJpZBgBIAEoCUIG4t4fAklEUgJpZBImCghjbGFzc19pZBgCIAEoCUIL4t4fB0NsYXNzSURSB2NsYXNzSWQSEgoEbmFtZRgDIAEoCVIEbmFtZRIZCgN1cmkYBCABKAlCB+LeHwNVUklSA3VyaRISCgRkYXRhGAUgASgJUgRkYXRhEhQKBW93bmVyGAYgASgJUgVvd25lchIcCglyZWNpcGllbnQYByABKAlSCXJlY2lwaWVudDoE6KAfAQ==');
@$core.Deprecated('Use msgIssueNFTResponseDescriptor instead')
const MsgIssueNFTResponse$json = const {
  '1': 'MsgIssueNFTResponse',
};

/// Descriptor for `MsgIssueNFTResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgIssueNFTResponseDescriptor = $convert.base64Decode('ChNNc2dJc3N1ZU5GVFJlc3BvbnNl');
@$core.Deprecated('Use msgEditNFTDescriptor instead')
const MsgEditNFT$json = const {
  '1': 'MsgEditNFT',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'class_id', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'classId'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uri', '3': 4, '4': 1, '5': 9, '8': const {}, '10': 'uri'},
    const {'1': 'data', '3': 5, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'owner', '3': 6, '4': 1, '5': 9, '10': 'owner'},
  ],
  '7': const {},
};

/// Descriptor for `MsgEditNFT`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgEditNFTDescriptor = $convert.base64Decode('CgpNc2dFZGl0TkZUEhYKAmlkGAEgASgJQgbi3h8CSURSAmlkEiYKCGNsYXNzX2lkGAIgASgJQgvi3h8HQ2xhc3NJRFIHY2xhc3NJZBISCgRuYW1lGAMgASgJUgRuYW1lEhkKA3VyaRgEIAEoCUIH4t4fA1VSSVIDdXJpEhIKBGRhdGEYBSABKAlSBGRhdGESFAoFb3duZXIYBiABKAlSBW93bmVyOgTooB8B');
@$core.Deprecated('Use msgEditNFTResponseDescriptor instead')
const MsgEditNFTResponse$json = const {
  '1': 'MsgEditNFTResponse',
};

/// Descriptor for `MsgEditNFTResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgEditNFTResponseDescriptor = $convert.base64Decode('ChJNc2dFZGl0TkZUUmVzcG9uc2U=');
@$core.Deprecated('Use msgBurnNFTDescriptor instead')
const MsgBurnNFT$json = const {
  '1': 'MsgBurnNFT',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'class_id', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'classId'},
    const {'1': 'owner', '3': 3, '4': 1, '5': 9, '10': 'owner'},
  ],
  '7': const {},
};

/// Descriptor for `MsgBurnNFT`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBurnNFTDescriptor = $convert.base64Decode('CgpNc2dCdXJuTkZUEhYKAmlkGAEgASgJQgbi3h8CSURSAmlkEiYKCGNsYXNzX2lkGAIgASgJQgvi3h8HQ2xhc3NJRFIHY2xhc3NJZBIUCgVvd25lchgDIAEoCVIFb3duZXI6BOigHwE=');
@$core.Deprecated('Use msgBurnNFTResponseDescriptor instead')
const MsgBurnNFTResponse$json = const {
  '1': 'MsgBurnNFTResponse',
};

/// Descriptor for `MsgBurnNFTResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBurnNFTResponseDescriptor = $convert.base64Decode('ChJNc2dCdXJuTkZUUmVzcG9uc2U=');
@$core.Deprecated('Use msgTransferNFTDescriptor instead')
const MsgTransferNFT$json = const {
  '1': 'MsgTransferNFT',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'class_id', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'classId'},
    const {'1': 'recipient', '3': 3, '4': 1, '5': 9, '10': 'recipient'},
    const {'1': 'owner', '3': 4, '4': 1, '5': 9, '10': 'owner'},
  ],
  '7': const {},
};

/// Descriptor for `MsgTransferNFT`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferNFTDescriptor = $convert.base64Decode('Cg5Nc2dUcmFuc2Zlck5GVBIWCgJpZBgBIAEoCUIG4t4fAklEUgJpZBImCghjbGFzc19pZBgCIAEoCUIL4t4fB0NsYXNzSURSB2NsYXNzSWQSHAoJcmVjaXBpZW50GAMgASgJUglyZWNpcGllbnQSFAoFb3duZXIYBCABKAlSBW93bmVyOgTooB8B');
@$core.Deprecated('Use msgTransferNFTResponseDescriptor instead')
const MsgTransferNFTResponse$json = const {
  '1': 'MsgTransferNFTResponse',
};

/// Descriptor for `MsgTransferNFTResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferNFTResponseDescriptor = $convert.base64Decode('ChZNc2dUcmFuc2Zlck5GVFJlc3BvbnNl');
@$core.Deprecated('Use msgTransferClassDescriptor instead')
const MsgTransferClass$json = const {
  '1': 'MsgTransferClass',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'owner', '3': 2, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'recipient', '3': 3, '4': 1, '5': 9, '10': 'recipient'},
  ],
  '7': const {},
};

/// Descriptor for `MsgTransferClass`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferClassDescriptor = $convert.base64Decode('ChBNc2dUcmFuc2ZlckNsYXNzEhYKAmlkGAEgASgJQgbi3h8CSURSAmlkEhQKBW93bmVyGAIgASgJUgVvd25lchIcCglyZWNpcGllbnQYAyABKAlSCXJlY2lwaWVudDoE6KAfAQ==');
@$core.Deprecated('Use msgTransferClassResponseDescriptor instead')
const MsgTransferClassResponse$json = const {
  '1': 'MsgTransferClassResponse',
};

/// Descriptor for `MsgTransferClassResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferClassResponseDescriptor = $convert.base64Decode('ChhNc2dUcmFuc2ZlckNsYXNzUmVzcG9uc2U=');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {'1': 'IssueClass', '2': '.plugchain.nft.MsgIssueClass', '3': '.plugchain.nft.MsgIssueClassResponse'},
    const {'1': 'IssueNFT', '2': '.plugchain.nft.MsgIssueNFT', '3': '.plugchain.nft.MsgIssueNFTResponse'},
    const {'1': 'EditNFT', '2': '.plugchain.nft.MsgEditNFT', '3': '.plugchain.nft.MsgEditNFTResponse'},
    const {'1': 'BurnNFT', '2': '.plugchain.nft.MsgBurnNFT', '3': '.plugchain.nft.MsgBurnNFTResponse'},
    const {'1': 'TransferNFT', '2': '.plugchain.nft.MsgTransferNFT', '3': '.plugchain.nft.MsgTransferNFTResponse'},
    const {'1': 'TransferClass', '2': '.plugchain.nft.MsgTransferClass', '3': '.plugchain.nft.MsgTransferClassResponse'},
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> MsgServiceBase$messageJson = const {
  '.plugchain.nft.MsgIssueClass': MsgIssueClass$json,
  '.plugchain.nft.MsgIssueClassResponse': MsgIssueClassResponse$json,
  '.plugchain.nft.MsgIssueNFT': MsgIssueNFT$json,
  '.plugchain.nft.MsgIssueNFTResponse': MsgIssueNFTResponse$json,
  '.plugchain.nft.MsgEditNFT': MsgEditNFT$json,
  '.plugchain.nft.MsgEditNFTResponse': MsgEditNFTResponse$json,
  '.plugchain.nft.MsgBurnNFT': MsgBurnNFT$json,
  '.plugchain.nft.MsgBurnNFTResponse': MsgBurnNFTResponse$json,
  '.plugchain.nft.MsgTransferNFT': MsgTransferNFT$json,
  '.plugchain.nft.MsgTransferNFTResponse': MsgTransferNFTResponse$json,
  '.plugchain.nft.MsgTransferClass': MsgTransferClass$json,
  '.plugchain.nft.MsgTransferClassResponse': MsgTransferClassResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode('CgNNc2cSUAoKSXNzdWVDbGFzcxIcLnBsdWdjaGFpbi5uZnQuTXNnSXNzdWVDbGFzcxokLnBsdWdjaGFpbi5uZnQuTXNnSXNzdWVDbGFzc1Jlc3BvbnNlEkoKCElzc3VlTkZUEhoucGx1Z2NoYWluLm5mdC5Nc2dJc3N1ZU5GVBoiLnBsdWdjaGFpbi5uZnQuTXNnSXNzdWVORlRSZXNwb25zZRJHCgdFZGl0TkZUEhkucGx1Z2NoYWluLm5mdC5Nc2dFZGl0TkZUGiEucGx1Z2NoYWluLm5mdC5Nc2dFZGl0TkZUUmVzcG9uc2USRwoHQnVybk5GVBIZLnBsdWdjaGFpbi5uZnQuTXNnQnVybk5GVBohLnBsdWdjaGFpbi5uZnQuTXNnQnVybk5GVFJlc3BvbnNlElMKC1RyYW5zZmVyTkZUEh0ucGx1Z2NoYWluLm5mdC5Nc2dUcmFuc2Zlck5GVBolLnBsdWdjaGFpbi5uZnQuTXNnVHJhbnNmZXJORlRSZXNwb25zZRJZCg1UcmFuc2ZlckNsYXNzEh8ucGx1Z2NoYWluLm5mdC5Nc2dUcmFuc2ZlckNsYXNzGicucGx1Z2NoYWluLm5mdC5Nc2dUcmFuc2ZlckNsYXNzUmVzcG9uc2U=');
