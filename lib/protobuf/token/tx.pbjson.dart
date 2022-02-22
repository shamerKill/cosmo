///
//  Generated code. Do not modify.
//  source: token/tx.proto
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
    const {'1': 'initial_supply', '3': 5, '4': 1, '5': 4, '10': 'initialSupply'},
    const {'1': 'max_supply', '3': 6, '4': 1, '5': 4, '10': 'maxSupply'},
    const {'1': 'mintable', '3': 7, '4': 1, '5': 8, '10': 'mintable'},
    const {'1': 'owner', '3': 8, '4': 1, '5': 9, '10': 'owner'},
  ],
};

/// Descriptor for `MsgIssueToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgIssueTokenDescriptor = $convert.base64Decode('Cg1Nc2dJc3N1ZVRva2VuEhYKBnN5bWJvbBgBIAEoCVIGc3ltYm9sEhIKBG5hbWUYAiABKAlSBG5hbWUSFAoFc2NhbGUYAyABKA1SBXNjYWxlEhkKCG1pbl91bml0GAQgASgJUgdtaW5Vbml0EiUKDmluaXRpYWxfc3VwcGx5GAUgASgEUg1pbml0aWFsU3VwcGx5Eh0KCm1heF9zdXBwbHkYBiABKARSCW1heFN1cHBseRIaCghtaW50YWJsZRgHIAEoCFIIbWludGFibGUSFAoFb3duZXIYCCABKAlSBW93bmVy');
@$core.Deprecated('Use msgIssueTokenResponseDescriptor instead')
const MsgIssueTokenResponse$json = const {
  '1': 'MsgIssueTokenResponse',
};

/// Descriptor for `MsgIssueTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgIssueTokenResponseDescriptor = $convert.base64Decode('ChVNc2dJc3N1ZVRva2VuUmVzcG9uc2U=');
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
final $typed_data.Uint8List msgMintTokenDescriptor = $convert.base64Decode('CgxNc2dNaW50VG9rZW4SFgoGc3ltYm9sGAEgASgJUgZzeW1ib2wSDgoCdG8YAiABKAlSAnRvEhYKBmFtb3VudBgDIAEoBFIGYW1vdW50EhQKBW93bmVyGAQgASgJUgVvd25lcg==');
@$core.Deprecated('Use msgMintTokenResponseDescriptor instead')
const MsgMintTokenResponse$json = const {
  '1': 'MsgMintTokenResponse',
};

/// Descriptor for `MsgMintTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgMintTokenResponseDescriptor = $convert.base64Decode('ChRNc2dNaW50VG9rZW5SZXNwb25zZQ==');
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
final $typed_data.Uint8List msgEditTokenDescriptor = $convert.base64Decode('CgxNc2dFZGl0VG9rZW4SFgoGc3ltYm9sGAEgASgJUgZzeW1ib2wSEgoEbmFtZRgCIAEoCVIEbmFtZRIdCgptYXhfc3VwcGx5GAMgASgEUgltYXhTdXBwbHkSFAoFb3duZXIYBCABKAlSBW93bmVy');
@$core.Deprecated('Use msgEditTokenResponseDescriptor instead')
const MsgEditTokenResponse$json = const {
  '1': 'MsgEditTokenResponse',
};

/// Descriptor for `MsgEditTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgEditTokenResponseDescriptor = $convert.base64Decode('ChRNc2dFZGl0VG9rZW5SZXNwb25zZQ==');
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
final $typed_data.Uint8List msgBurnTokenDescriptor = $convert.base64Decode('CgxNc2dCdXJuVG9rZW4SFgoGc3ltYm9sGAEgASgJUgZzeW1ib2wSFgoGYW1vdW50GAIgASgEUgZhbW91bnQSFAoFb3duZXIYAyABKAlSBW93bmVy');
@$core.Deprecated('Use msgBurnTokenResponseDescriptor instead')
const MsgBurnTokenResponse$json = const {
  '1': 'MsgBurnTokenResponse',
};

/// Descriptor for `MsgBurnTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgBurnTokenResponseDescriptor = $convert.base64Decode('ChRNc2dCdXJuVG9rZW5SZXNwb25zZQ==');
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
final $typed_data.Uint8List msgTransferOwnerTokenDescriptor = $convert.base64Decode('ChVNc2dUcmFuc2Zlck93bmVyVG9rZW4SFgoGc3ltYm9sGAEgASgJUgZzeW1ib2wSFAoFb3duZXIYAiABKAlSBW93bmVyEg4KAnRvGAMgASgJUgJ0bw==');
@$core.Deprecated('Use msgTransferOwnerTokenResponseDescriptor instead')
const MsgTransferOwnerTokenResponse$json = const {
  '1': 'MsgTransferOwnerTokenResponse',
};

/// Descriptor for `MsgTransferOwnerTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgTransferOwnerTokenResponseDescriptor = $convert.base64Decode('Ch1Nc2dUcmFuc2Zlck93bmVyVG9rZW5SZXNwb25zZQ==');
