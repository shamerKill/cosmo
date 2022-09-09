///
//  Generated code. Do not modify.
//  source: plug-proto/prc10/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use msgIssueTokenDescriptor instead')
const MsgIssueToken$json = const {
  '1': 'MsgIssueToken',
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
};

/// Descriptor for `MsgIssueToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgIssueTokenDescriptor = $convert.base64Decode(
    'Cg1Nc2dJc3N1ZVRva2VuEhYKBnN5bWJvbBgBIAEoCVIGc3ltYm9sEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFc2NhbGUYAyABKA1SBXNjYWxlEhkKCG1pbl91bml0GAQgASgJUgdtaW5Vbml0EiUKDmluaXRpYWxfc3VwcGx5GAUgASgEUg1pbml0aWFsU3VwcGx5Eh0KCm1heF9zdXBwbHkYBiABKARSCW1heFN1cHBseRIaCghtaW50YWJsZRgHIAEoCFIIbWludGFibGUSFAoFb3duZXIYCCABKAlSBW93bmVy');
@$core.Deprecated('Use msgIssueTokenResponseDescriptor instead')
const MsgIssueTokenResponse$json = const {
  '1': 'MsgIssueTokenResponse',
};

/// Descriptor for `MsgIssueTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgIssueTokenResponseDescriptor =
    $convert.base64Decode('ChVNc2dJc3N1ZVRva2VuUmVzcG9uc2U=');
@$core.Deprecated('Use msgMintTokenDescriptor instead')
const MsgMintToken$json = const {
  '1': 'MsgMintToken',
  '2': const [
    const {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'to', '3': 2, '4': 1, '5': 9, '10': 'to'},
    const {'1': 'amount', '3': 3, '4': 1, '5': 4, '10': 'amount'},
    const {'1': 'owner', '3': 4, '4': 1, '5': 9, '10': 'owner'},
  ],
};

/// Descriptor for `MsgMintToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgMintTokenDescriptor = $convert.base64Decode(
    'CgxNc2dNaW50VG9rZW4SFgoGc3ltYm9sGAEgASgJUgZzeW1ib2wSDgoCdG8YAiABKAlSAnRvEhYKBmFtb3VudBgDIAEoBFIGYW1vdW50EhQKBW93bmVyGAQgASgJUgVvd25lcg==');
@$core.Deprecated('Use msgMintTokenResponseDescriptor instead')
const MsgMintTokenResponse$json = const {
  '1': 'MsgMintTokenResponse',
};

/// Descriptor for `MsgMintTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgMintTokenResponseDescriptor =
    $convert.base64Decode('ChRNc2dNaW50VG9rZW5SZXNwb25zZQ==');
@$core.Deprecated('Use msgEditTokenDescriptor instead')
const MsgEditToken$json = const {
  '1': 'MsgEditToken',
  '2': const [
    const {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'max_supply', '3': 3, '4': 1, '5': 4, '10': 'maxSupply'},
    const {'1': 'owner', '3': 4, '4': 1, '5': 9, '10': 'owner'},
  ],
};

/// Descriptor for `MsgEditToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgEditTokenDescriptor = $convert.base64Decode(
    'CgxNc2dFZGl0VG9rZW4SFgoGc3ltYm9sGAEgASgJUgZzeW1ib2wSEgoEbmFtZRgCIAEoCVIEbmFtZRIdCgptYXhfc3VwcGx5GAMgASgEUgltYXhTdXBwbHkSFAoFb3duZXIYBCABKAlSBW93bmVy');
@$core.Deprecated('Use msgEditTokenResponseDescriptor instead')
const MsgEditTokenResponse$json = const {
  '1': 'MsgEditTokenResponse',
};

/// Descriptor for `MsgEditTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgEditTokenResponseDescriptor =
    $convert.base64Decode('ChRNc2dFZGl0VG9rZW5SZXNwb25zZQ==');
@$core.Deprecated('Use msgBurnTokenDescriptor instead')
const MsgBurnToken$json = const {
  '1': 'MsgBurnToken',
  '2': const [
    const {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'amount', '3': 2, '4': 1, '5': 4, '10': 'amount'},
    const {'1': 'owner', '3': 3, '4': 1, '5': 9, '10': 'owner'},
  ],
};

/// Descriptor for `MsgBurnToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBurnTokenDescriptor = $convert.base64Decode(
    'CgxNc2dCdXJuVG9rZW4SFgoGc3ltYm9sGAEgASgJUgZzeW1ib2wSFgoGYW1vdW50GAIgASgEUgZhbW91bnQSFAoFb3duZXIYAyABKAlSBW93bmVy');
@$core.Deprecated('Use msgBurnTokenResponseDescriptor instead')
const MsgBurnTokenResponse$json = const {
  '1': 'MsgBurnTokenResponse',
};

/// Descriptor for `MsgBurnTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBurnTokenResponseDescriptor =
    $convert.base64Decode('ChRNc2dCdXJuVG9rZW5SZXNwb25zZQ==');
@$core.Deprecated('Use msgTransferOwnerTokenDescriptor instead')
const MsgTransferOwnerToken$json = const {
  '1': 'MsgTransferOwnerToken',
  '2': const [
    const {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'owner', '3': 2, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'to', '3': 3, '4': 1, '5': 9, '10': 'to'},
  ],
};

/// Descriptor for `MsgTransferOwnerToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferOwnerTokenDescriptor = $convert.base64Decode(
    'ChVNc2dUcmFuc2Zlck93bmVyVG9rZW4SFgoGc3ltYm9sGAEgASgJUgZzeW1ib2wSFAoFb3duZXIYAiABKAlSBW93bmVyEg4KAnRvGAMgASgJUgJ0bw==');
@$core.Deprecated('Use msgTransferOwnerTokenResponseDescriptor instead')
const MsgTransferOwnerTokenResponse$json = const {
  '1': 'MsgTransferOwnerTokenResponse',
};

/// Descriptor for `MsgTransferOwnerTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferOwnerTokenResponseDescriptor =
    $convert.base64Decode('Ch1Nc2dUcmFuc2Zlck93bmVyVG9rZW5SZXNwb25zZQ==');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {
      '1': 'IssueToken',
      '2': '.plugchain.prc10.MsgIssueToken',
      '3': '.plugchain.prc10.MsgIssueTokenResponse'
    },
    const {
      '1': 'MintToken',
      '2': '.plugchain.prc10.MsgMintToken',
      '3': '.plugchain.prc10.MsgMintTokenResponse'
    },
    const {
      '1': 'EditToken',
      '2': '.plugchain.prc10.MsgEditToken',
      '3': '.plugchain.prc10.MsgEditTokenResponse'
    },
    const {
      '1': 'BurnToken',
      '2': '.plugchain.prc10.MsgBurnToken',
      '3': '.plugchain.prc10.MsgBurnTokenResponse'
    },
    const {
      '1': 'TransferOwnerToken',
      '2': '.plugchain.prc10.MsgTransferOwnerToken',
      '3': '.plugchain.prc10.MsgTransferOwnerTokenResponse'
    },
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    MsgServiceBase$messageJson = const {
  '.plugchain.prc10.MsgIssueToken': MsgIssueToken$json,
  '.plugchain.prc10.MsgIssueTokenResponse': MsgIssueTokenResponse$json,
  '.plugchain.prc10.MsgMintToken': MsgMintToken$json,
  '.plugchain.prc10.MsgMintTokenResponse': MsgMintTokenResponse$json,
  '.plugchain.prc10.MsgEditToken': MsgEditToken$json,
  '.plugchain.prc10.MsgEditTokenResponse': MsgEditTokenResponse$json,
  '.plugchain.prc10.MsgBurnToken': MsgBurnToken$json,
  '.plugchain.prc10.MsgBurnTokenResponse': MsgBurnTokenResponse$json,
  '.plugchain.prc10.MsgTransferOwnerToken': MsgTransferOwnerToken$json,
  '.plugchain.prc10.MsgTransferOwnerTokenResponse':
      MsgTransferOwnerTokenResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode(
    'CgNNc2cSVAoKSXNzdWVUb2tlbhIeLnBsdWdjaGFpbi5wcmMxMC5Nc2dJc3N1ZVRva2VuGiYucGx1Z2NoYWluLnByYzEwLk1zZ0lzc3VlVG9rZW5SZXNwb25zZRJRCglNaW50VG9rZW4SHS5wbHVnY2hhaW4ucHJjMTAuTXNnTWludFRva2VuGiUucGx1Z2NoYWluLnByYzEwLk1zZ01pbnRUb2tlblJlc3BvbnNlElEKCUVkaXRUb2tlbhIdLnBsdWdjaGFpbi5wcmMxMC5Nc2dFZGl0VG9rZW4aJS5wbHVnY2hhaW4ucHJjMTAuTXNnRWRpdFRva2VuUmVzcG9uc2USUQoJQnVyblRva2VuEh0ucGx1Z2NoYWluLnByYzEwLk1zZ0J1cm5Ub2tlbholLnBsdWdjaGFpbi5wcmMxMC5Nc2dCdXJuVG9rZW5SZXNwb25zZRJsChJUcmFuc2Zlck93bmVyVG9rZW4SJi5wbHVnY2hhaW4ucHJjMTAuTXNnVHJhbnNmZXJPd25lclRva2VuGi4ucGx1Z2NoYWluLnByYzEwLk1zZ1RyYW5zZmVyT3duZXJUb2tlblJlc3BvbnNl');
