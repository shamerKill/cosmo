///
//  Generated code. Do not modify.
//  source: nft/nft.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use nFTDescriptor instead')
const NFT$json = const {
  '1': 'NFT',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'uri', '3': 3, '4': 1, '5': 9, '8': const {}, '10': 'uri'},
    const {'1': 'data', '3': 4, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'owner', '3': 5, '4': 1, '5': 9, '10': 'owner'},
  ],
};

/// Descriptor for `NFT`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nFTDescriptor = $convert.base64Decode('CgNORlQSFgoCaWQYASABKAlCBuLeHwJJRFICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZRIZCgN1cmkYAyABKAlCB+LeHwNVUklSA3VyaRISCgRkYXRhGAQgASgJUgRkYXRhEhQKBW93bmVyGAUgASgJUgVvd25lcg==');
@$core.Deprecated('Use classDescriptor instead')
const Class$json = const {
  '1': 'Class',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'schema', '3': 3, '4': 1, '5': 9, '10': 'schema'},
    const {'1': 'symbol', '3': 4, '4': 1, '5': 9, '10': 'symbol'},
    const {'1': 'owner', '3': 5, '4': 1, '5': 9, '10': 'owner'},
    const {'1': 'mint_restricted', '3': 6, '4': 1, '5': 8, '10': 'mintRestricted'},
    const {'1': 'edit_restricted', '3': 7, '4': 1, '5': 8, '10': 'editRestricted'},
  ],
};

/// Descriptor for `Class`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List classDescriptor = $convert.base64Decode('CgVDbGFzcxIWCgJpZBgBIAEoCUIG4t4fAklEUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhYKBnNjaGVtYRgDIAEoCVIGc2NoZW1hEhYKBnN5bWJvbBgEIAEoCVIGc3ltYm9sEhQKBW93bmVyGAUgASgJUgVvd25lchInCg9taW50X3Jlc3RyaWN0ZWQYBiABKAhSDm1pbnRSZXN0cmljdGVkEicKD2VkaXRfcmVzdHJpY3RlZBgHIAEoCFIOZWRpdFJlc3RyaWN0ZWQ=');
@$core.Deprecated('Use collectionDescriptor instead')
const Collection$json = const {
  '1': 'Collection',
  '2': const [
    const {'1': 'class', '3': 1, '4': 1, '5': 11, '6': '.plugchain.nft.Class', '8': const {}, '10': 'class'},
    const {'1': 'nfts', '3': 2, '4': 3, '5': 11, '6': '.plugchain.nft.NFT', '8': const {}, '10': 'nfts'},
  ],
};

/// Descriptor for `Collection`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List collectionDescriptor = $convert.base64Decode('CgpDb2xsZWN0aW9uEjAKBWNsYXNzGAEgASgLMhQucGx1Z2NoYWluLm5mdC5DbGFzc0IEyN4fAFIFY2xhc3MSNAoEbmZ0cxgCIAMoCzISLnBsdWdjaGFpbi5uZnQuTkZUQgzi3h8ETkZUc8jeHwBSBG5mdHM=');
@$core.Deprecated('Use collectionIDDescriptor instead')
const CollectionID$json = const {
  '1': 'CollectionID',
  '2': const [
    const {'1': 'Class_id', '3': 1, '4': 1, '5': 9, '8': const {}, '10': 'ClassId'},
    const {'1': 'nft_ids', '3': 2, '4': 3, '5': 9, '8': const {}, '10': 'nftIds'},
  ],
};

/// Descriptor for `CollectionID`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List collectionIDDescriptor = $convert.base64Decode('CgxDb2xsZWN0aW9uSUQSJgoIQ2xhc3NfaWQYASABKAlCC+LeHwdDbGFzc0lEUgdDbGFzc0lkEiMKB25mdF9pZHMYAiADKAlCCuLeHwZORlRJRHNSBm5mdElkcw==');
@$core.Deprecated('Use ownerDescriptor instead')
const Owner$json = const {
  '1': 'Owner',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'collection_ids', '3': 2, '4': 3, '5': 11, '6': '.plugchain.nft.CollectionID', '8': const {}, '10': 'collectionIds'},
  ],
};

/// Descriptor for `Owner`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ownerDescriptor = $convert.base64Decode('CgVPd25lchIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEmgKDmNvbGxlY3Rpb25faWRzGAIgAygLMhsucGx1Z2NoYWluLm5mdC5Db2xsZWN0aW9uSURCJPLeHwt5YW1sOiJjaWRzIuLeHw1Db2xsZWN0aW9uSURzyN4fAFINY29sbGVjdGlvbklkcw==');
