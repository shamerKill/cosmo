///
//  Generated code. Do not modify.
//  source: nft/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'nft.pbjson.dart' as $63;
import '../cosmos/base/query/v1beta1/pagination.pbjson.dart' as $2;

@$core.Deprecated('Use queryClassRequestDescriptor instead')
const QueryClassRequest$json = const {
  '1': 'QueryClassRequest',
  '2': const [
    const {
      '1': 'class_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'classId'
    },
  ],
};

/// Descriptor for `QueryClassRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryClassRequestDescriptor = $convert.base64Decode(
    'ChFRdWVyeUNsYXNzUmVxdWVzdBIuCghjbGFzc19pZBgBIAEoCUIT8t4fD3lhbWw6ImNsYXNzX2lkIlIHY2xhc3NJZA==');
@$core.Deprecated('Use queryClassResponseDescriptor instead')
const QueryClassResponse$json = const {
  '1': 'QueryClassResponse',
  '2': const [
    const {
      '1': 'class',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.plugchain.nft.Class',
      '10': 'class'
    },
  ],
};

/// Descriptor for `QueryClassResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryClassResponseDescriptor = $convert.base64Decode(
    'ChJRdWVyeUNsYXNzUmVzcG9uc2USKgoFY2xhc3MYASABKAsyFC5wbHVnY2hhaW4ubmZ0LkNsYXNzUgVjbGFzcw==');
@$core.Deprecated('Use queryClassesRequestDescriptor instead')
const QueryClassesRequest$json = const {
  '1': 'QueryClassesRequest',
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

/// Descriptor for `QueryClassesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryClassesRequestDescriptor = $convert.base64Decode(
    'ChNRdWVyeUNsYXNzZXNSZXF1ZXN0EkYKCnBhZ2luYXRpb24YASABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryClassesResponseDescriptor instead')
const QueryClassesResponse$json = const {
  '1': 'QueryClassesResponse',
  '2': const [
    const {
      '1': 'classes',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.plugchain.nft.Class',
      '8': const {},
      '10': 'classes'
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

/// Descriptor for `QueryClassesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryClassesResponseDescriptor = $convert.base64Decode(
    'ChRRdWVyeUNsYXNzZXNSZXNwb25zZRI0CgdjbGFzc2VzGAEgAygLMhQucGx1Z2NoYWluLm5mdC5DbGFzc0IEyN4fAFIHY2xhc3NlcxJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
@$core.Deprecated('Use queryNFTRequestDescriptor instead')
const QueryNFTRequest$json = const {
  '1': 'QueryNFTRequest',
  '2': const [
    const {
      '1': 'class_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'classId'
    },
    const {'1': 'nft_id', '3': 2, '4': 1, '5': 9, '8': const {}, '10': 'nftId'},
  ],
};

/// Descriptor for `QueryNFTRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNFTRequestDescriptor = $convert.base64Decode(
    'Cg9RdWVyeU5GVFJlcXVlc3QSLgoIY2xhc3NfaWQYASABKAlCE/LeHw95YW1sOiJjbGFzc19pZCJSB2NsYXNzSWQSKAoGbmZ0X2lkGAIgASgJQhHy3h8NeWFtbDoibmZ0X2lkIlIFbmZ0SWQ=');
@$core.Deprecated('Use queryNFTResponseDescriptor instead')
const QueryNFTResponse$json = const {
  '1': 'QueryNFTResponse',
  '2': const [
    const {
      '1': 'nft',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.plugchain.nft.NFT',
      '10': 'nft'
    },
  ],
};

/// Descriptor for `QueryNFTResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNFTResponseDescriptor = $convert.base64Decode(
    'ChBRdWVyeU5GVFJlc3BvbnNlEiQKA25mdBgBIAEoCzISLnBsdWdjaGFpbi5uZnQuTkZUUgNuZnQ=');
@$core.Deprecated('Use queryNFTsRequestDescriptor instead')
const QueryNFTsRequest$json = const {
  '1': 'QueryNFTsRequest',
  '2': const [
    const {'1': 'class_id', '3': 1, '4': 1, '5': 9, '10': 'classId'},
    const {'1': 'owner', '3': 2, '4': 1, '5': 9, '10': 'owner'},
    const {
      '1': 'pagination',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryNFTsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNFTsRequestDescriptor = $convert.base64Decode(
    'ChBRdWVyeU5GVHNSZXF1ZXN0EhkKCGNsYXNzX2lkGAEgASgJUgdjbGFzc0lkEhQKBW93bmVyGAIgASgJUgVvd25lchJGCgpwYWdpbmF0aW9uGAMgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbg==');
@$core.Deprecated('Use queryNFTsResponseDescriptor instead')
const QueryNFTsResponse$json = const {
  '1': 'QueryNFTsResponse',
  '2': const [
    const {
      '1': 'nfts',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.plugchain.nft.NFT',
      '10': 'nfts'
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

/// Descriptor for `QueryNFTsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryNFTsResponseDescriptor = $convert.base64Decode(
    'ChFRdWVyeU5GVHNSZXNwb25zZRImCgRuZnRzGAEgAygLMhIucGx1Z2NoYWluLm5mdC5ORlRSBG5mdHMSRwoKcGFnaW5hdGlvbhgCIAEoCzInLmNvc21vcy5iYXNlLnF1ZXJ5LnYxYmV0YTEuUGFnZVJlc3BvbnNlUgpwYWdpbmF0aW9u');
@$core.Deprecated('Use querySupplyRequestDescriptor instead')
const QuerySupplyRequest$json = const {
  '1': 'QuerySupplyRequest',
  '2': const [
    const {
      '1': 'class_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'classId'
    },
  ],
};

/// Descriptor for `QuerySupplyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySupplyRequestDescriptor = $convert.base64Decode(
    'ChJRdWVyeVN1cHBseVJlcXVlc3QSLgoIY2xhc3NfaWQYASABKAlCE/LeHw95YW1sOiJjbGFzc19pZCJSB2NsYXNzSWQ=');
@$core.Deprecated('Use querySupplyResponseDescriptor instead')
const QuerySupplyResponse$json = const {
  '1': 'QuerySupplyResponse',
  '2': const [
    const {'1': 'amount', '3': 1, '4': 1, '5': 4, '10': 'amount'},
  ],
};

/// Descriptor for `QuerySupplyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List querySupplyResponseDescriptor =
    $convert.base64Decode(
        'ChNRdWVyeVN1cHBseVJlc3BvbnNlEhYKBmFtb3VudBgBIAEoBFIGYW1vdW50');
@$core.Deprecated('Use queryOwnerRequestDescriptor instead')
const QueryOwnerRequest$json = const {
  '1': 'QueryOwnerRequest',
  '2': const [
    const {
      '1': 'class_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': const {},
      '10': 'classId'
    },
    const {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    const {
      '1': 'pagination',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
};

/// Descriptor for `QueryOwnerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryOwnerRequestDescriptor = $convert.base64Decode(
    'ChFRdWVyeU93bmVyUmVxdWVzdBIuCghjbGFzc19pZBgBIAEoCUIT8t4fD3lhbWw6ImNsYXNzX2lkIlIHY2xhc3NJZBIYCgdhZGRyZXNzGAIgASgJUgdhZGRyZXNzEkYKCnBhZ2luYXRpb24YAyABKAsyJi5jb3Ntb3MuYmFzZS5xdWVyeS52MWJldGExLlBhZ2VSZXF1ZXN0UgpwYWdpbmF0aW9u');
@$core.Deprecated('Use queryOwnerResponseDescriptor instead')
const QueryOwnerResponse$json = const {
  '1': 'QueryOwnerResponse',
  '2': const [
    const {
      '1': 'owner',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.plugchain.nft.Owner',
      '10': 'owner'
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

/// Descriptor for `QueryOwnerResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryOwnerResponseDescriptor = $convert.base64Decode(
    'ChJRdWVyeU93bmVyUmVzcG9uc2USKgoFb3duZXIYASABKAsyFC5wbHVnY2hhaW4ubmZ0Lk93bmVyUgVvd25lchJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
const $core.Map<$core.String, $core.dynamic> QueryServiceBase$json = const {
  '1': 'Query',
  '2': const [
    const {
      '1': 'Class',
      '2': '.plugchain.nft.QueryClassRequest',
      '3': '.plugchain.nft.QueryClassResponse',
      '4': const {}
    },
    const {
      '1': 'Classes',
      '2': '.plugchain.nft.QueryClassesRequest',
      '3': '.plugchain.nft.QueryClassesResponse',
      '4': const {}
    },
    const {
      '1': 'NFT',
      '2': '.plugchain.nft.QueryNFTRequest',
      '3': '.plugchain.nft.QueryNFTResponse',
      '4': const {}
    },
    const {
      '1': 'NFTs',
      '2': '.plugchain.nft.QueryNFTsRequest',
      '3': '.plugchain.nft.QueryNFTsResponse',
      '4': const {}
    },
    const {
      '1': 'Supply',
      '2': '.plugchain.nft.QuerySupplyRequest',
      '3': '.plugchain.nft.QuerySupplyResponse',
      '4': const {}
    },
    const {
      '1': 'Owner',
      '2': '.plugchain.nft.QueryOwnerRequest',
      '3': '.plugchain.nft.QueryOwnerResponse',
      '4': const {}
    },
  ],
};

@$core.Deprecated('Use queryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    QueryServiceBase$messageJson = const {
  '.plugchain.nft.QueryClassRequest': QueryClassRequest$json,
  '.plugchain.nft.QueryClassResponse': QueryClassResponse$json,
  '.plugchain.nft.Class': $63.Class$json,
  '.plugchain.nft.QueryClassesRequest': QueryClassesRequest$json,
  '.cosmos.base.query.v1beta1.PageRequest': $2.PageRequest$json,
  '.plugchain.nft.QueryClassesResponse': QueryClassesResponse$json,
  '.cosmos.base.query.v1beta1.PageResponse': $2.PageResponse$json,
  '.plugchain.nft.QueryNFTRequest': QueryNFTRequest$json,
  '.plugchain.nft.QueryNFTResponse': QueryNFTResponse$json,
  '.plugchain.nft.NFT': $63.NFT$json,
  '.plugchain.nft.QueryNFTsRequest': QueryNFTsRequest$json,
  '.plugchain.nft.QueryNFTsResponse': QueryNFTsResponse$json,
  '.plugchain.nft.QuerySupplyRequest': QuerySupplyRequest$json,
  '.plugchain.nft.QuerySupplyResponse': QuerySupplyResponse$json,
  '.plugchain.nft.QueryOwnerRequest': QueryOwnerRequest$json,
  '.plugchain.nft.QueryOwnerResponse': QueryOwnerResponse$json,
  '.plugchain.nft.Owner': $63.Owner$json,
  '.plugchain.nft.CollectionID': $63.CollectionID$json,
};

/// Descriptor for `Query`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List queryServiceDescriptor = $convert.base64Decode(
    'CgVRdWVyeRJtCgVDbGFzcxIgLnBsdWdjaGFpbi5uZnQuUXVlcnlDbGFzc1JlcXVlc3QaIS5wbHVnY2hhaW4ubmZ0LlF1ZXJ5Q2xhc3NSZXNwb25zZSIfgtPkkwIZEhcvbmZ0L2NsYXNzZXMve2NsYXNzX2lkfRJoCgdDbGFzc2VzEiIucGx1Z2NoYWluLm5mdC5RdWVyeUNsYXNzZXNSZXF1ZXN0GiMucGx1Z2NoYWluLm5mdC5RdWVyeUNsYXNzZXNSZXNwb25zZSIUgtPkkwIOEgwvbmZ0L2NsYXNzZXMSbQoDTkZUEh4ucGx1Z2NoYWluLm5mdC5RdWVyeU5GVFJlcXVlc3QaHy5wbHVnY2hhaW4ubmZ0LlF1ZXJ5TkZUUmVzcG9uc2UiJYLT5JMCHxIdL25mdC9uZnRzL3tjbGFzc19pZH0ve25mdF9pZH0SXAoETkZUcxIfLnBsdWdjaGFpbi5uZnQuUXVlcnlORlRzUmVxdWVzdBogLnBsdWdjaGFpbi5uZnQuUXVlcnlORlRzUmVzcG9uc2UiEYLT5JMCCxIJL25mdC9uZnRzEm8KBlN1cHBseRIhLnBsdWdjaGFpbi5uZnQuUXVlcnlTdXBwbHlSZXF1ZXN0GiIucGx1Z2NoYWluLm5mdC5RdWVyeVN1cHBseVJlc3BvbnNlIh6C0+STAhgSFi9uZnQvc3VwcGx5L3tjbGFzc19pZH0SbwoFT3duZXISIC5wbHVnY2hhaW4ubmZ0LlF1ZXJ5T3duZXJSZXF1ZXN0GiEucGx1Z2NoYWluLm5mdC5RdWVyeU93bmVyUmVzcG9uc2UiIYLT5JMCGxIZL25mdC97YWRkcmVzc30ve2NsYXNzX2lkfQ==');
