///
//  Generated code. Do not modify.
//  source: ethermint/evm/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'evm.pbjson.dart' as $55;
import 'tx.pbjson.dart' as $56;
import 'package:alan/proto/google/protobuf/any.pbjson.dart' as $0;
import 'package:alan/proto/google/protobuf/timestamp.pbjson.dart' as $4;

@$core.Deprecated('Use queryAccountRequestDescriptor instead')
const QueryAccountRequest$json = const {
  '1': 'QueryAccountRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
  '7': const {},
};

/// Descriptor for `QueryAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAccountRequestDescriptor = $convert.base64Decode(
    'ChNRdWVyeUFjY291bnRSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M6COigHwCIoB8A');
@$core.Deprecated('Use queryAccountResponseDescriptor instead')
const QueryAccountResponse$json = const {
  '1': 'QueryAccountResponse',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 9, '10': 'balance'},
    const {'1': 'code_hash', '3': 2, '4': 1, '5': 9, '10': 'codeHash'},
    const {'1': 'nonce', '3': 3, '4': 1, '5': 4, '10': 'nonce'},
  ],
};

/// Descriptor for `QueryAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryAccountResponseDescriptor = $convert.base64Decode(
    'ChRRdWVyeUFjY291bnRSZXNwb25zZRIYCgdiYWxhbmNlGAEgASgJUgdiYWxhbmNlEhsKCWNvZGVfaGFzaBgCIAEoCVIIY29kZUhhc2gSFAoFbm9uY2UYAyABKARSBW5vbmNl');
@$core.Deprecated('Use queryCosmosAccountRequestDescriptor instead')
const QueryCosmosAccountRequest$json = const {
  '1': 'QueryCosmosAccountRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
  '7': const {},
};

/// Descriptor for `QueryCosmosAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryCosmosAccountRequestDescriptor =
    $convert.base64Decode(
        'ChlRdWVyeUNvc21vc0FjY291bnRSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M6COigHwCIoB8A');
@$core.Deprecated('Use queryCosmosAccountResponseDescriptor instead')
const QueryCosmosAccountResponse$json = const {
  '1': 'QueryCosmosAccountResponse',
  '2': const [
    const {
      '1': 'cosmos_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'cosmosAddress'
    },
    const {'1': 'sequence', '3': 2, '4': 1, '5': 4, '10': 'sequence'},
    const {
      '1': 'account_number',
      '3': 3,
      '4': 1,
      '5': 4,
      '10': 'accountNumber'
    },
  ],
};

/// Descriptor for `QueryCosmosAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryCosmosAccountResponseDescriptor =
    $convert.base64Decode(
        'ChpRdWVyeUNvc21vc0FjY291bnRSZXNwb25zZRIlCg5jb3Ntb3NfYWRkcmVzcxgBIAEoCVINY29zbW9zQWRkcmVzcxIaCghzZXF1ZW5jZRgCIAEoBFIIc2VxdWVuY2USJQoOYWNjb3VudF9udW1iZXIYAyABKARSDWFjY291bnROdW1iZXI=');
@$core.Deprecated('Use queryValidatorAccountRequestDescriptor instead')
const QueryValidatorAccountRequest$json = const {
  '1': 'QueryValidatorAccountRequest',
  '2': const [
    const {'1': 'cons_address', '3': 1, '4': 1, '5': 9, '10': 'consAddress'},
  ],
  '7': const {},
};

/// Descriptor for `QueryValidatorAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValidatorAccountRequestDescriptor =
    $convert.base64Decode(
        'ChxRdWVyeVZhbGlkYXRvckFjY291bnRSZXF1ZXN0EiEKDGNvbnNfYWRkcmVzcxgBIAEoCVILY29uc0FkZHJlc3M6COigHwCIoB8A');
@$core.Deprecated('Use queryValidatorAccountResponseDescriptor instead')
const QueryValidatorAccountResponse$json = const {
  '1': 'QueryValidatorAccountResponse',
  '2': const [
    const {
      '1': 'account_address',
      '3': 1,
      '4': 1,
      '5': 9,
      '10': 'accountAddress'
    },
    const {'1': 'sequence', '3': 2, '4': 1, '5': 4, '10': 'sequence'},
    const {
      '1': 'account_number',
      '3': 3,
      '4': 1,
      '5': 4,
      '10': 'accountNumber'
    },
  ],
};

/// Descriptor for `QueryValidatorAccountResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryValidatorAccountResponseDescriptor =
    $convert.base64Decode(
        'Ch1RdWVyeVZhbGlkYXRvckFjY291bnRSZXNwb25zZRInCg9hY2NvdW50X2FkZHJlc3MYASABKAlSDmFjY291bnRBZGRyZXNzEhoKCHNlcXVlbmNlGAIgASgEUghzZXF1ZW5jZRIlCg5hY2NvdW50X251bWJlchgDIAEoBFINYWNjb3VudE51bWJlcg==');
@$core.Deprecated('Use queryBalanceRequestDescriptor instead')
const QueryBalanceRequest$json = const {
  '1': 'QueryBalanceRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
  '7': const {},
};

/// Descriptor for `QueryBalanceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBalanceRequestDescriptor = $convert.base64Decode(
    'ChNRdWVyeUJhbGFuY2VSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M6COigHwCIoB8A');
@$core.Deprecated('Use queryBalanceResponseDescriptor instead')
const QueryBalanceResponse$json = const {
  '1': 'QueryBalanceResponse',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 9, '10': 'balance'},
  ],
};

/// Descriptor for `QueryBalanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryBalanceResponseDescriptor =
    $convert.base64Decode(
        'ChRRdWVyeUJhbGFuY2VSZXNwb25zZRIYCgdiYWxhbmNlGAEgASgJUgdiYWxhbmNl');
@$core.Deprecated('Use queryStorageRequestDescriptor instead')
const QueryStorageRequest$json = const {
  '1': 'QueryStorageRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'key', '3': 2, '4': 1, '5': 9, '10': 'key'},
  ],
  '7': const {},
};

/// Descriptor for `QueryStorageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryStorageRequestDescriptor = $convert.base64Decode(
    'ChNRdWVyeVN0b3JhZ2VSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3MSEAoDa2V5GAIgASgJUgNrZXk6COigHwCIoB8A');
@$core.Deprecated('Use queryStorageResponseDescriptor instead')
const QueryStorageResponse$json = const {
  '1': 'QueryStorageResponse',
  '2': const [
    const {'1': 'value', '3': 1, '4': 1, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `QueryStorageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryStorageResponseDescriptor =
    $convert.base64Decode(
        'ChRRdWVyeVN0b3JhZ2VSZXNwb25zZRIUCgV2YWx1ZRgBIAEoCVIFdmFsdWU=');
@$core.Deprecated('Use queryCodeRequestDescriptor instead')
const QueryCodeRequest$json = const {
  '1': 'QueryCodeRequest',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
  '7': const {},
};

/// Descriptor for `QueryCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryCodeRequestDescriptor = $convert.base64Decode(
    'ChBRdWVyeUNvZGVSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M6COigHwCIoB8A');
@$core.Deprecated('Use queryCodeResponseDescriptor instead')
const QueryCodeResponse$json = const {
  '1': 'QueryCodeResponse',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 12, '10': 'code'},
  ],
};

/// Descriptor for `QueryCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryCodeResponseDescriptor = $convert
    .base64Decode('ChFRdWVyeUNvZGVSZXNwb25zZRISCgRjb2RlGAEgASgMUgRjb2Rl');
@$core.Deprecated('Use queryTxLogsRequestDescriptor instead')
const QueryTxLogsRequest$json = const {
  '1': 'QueryTxLogsRequest',
  '2': const [
    const {'1': 'hash', '3': 1, '4': 1, '5': 9, '10': 'hash'},
    const {
      '1': 'pagination',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.cosmos.base.query.v1beta1.PageRequest',
      '10': 'pagination'
    },
  ],
  '7': const {},
};

/// Descriptor for `QueryTxLogsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTxLogsRequestDescriptor = $convert.base64Decode(
    'ChJRdWVyeVR4TG9nc1JlcXVlc3QSEgoEaGFzaBgBIAEoCVIEaGFzaBJGCgpwYWdpbmF0aW9uGAIgASgLMiYuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVxdWVzdFIKcGFnaW5hdGlvbjoI6KAfAIigHwA=');
@$core.Deprecated('Use queryTxLogsResponseDescriptor instead')
const QueryTxLogsResponse$json = const {
  '1': 'QueryTxLogsResponse',
  '2': const [
    const {
      '1': 'logs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ethermint.evm.v1.Log',
      '10': 'logs'
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

/// Descriptor for `QueryTxLogsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTxLogsResponseDescriptor = $convert.base64Decode(
    'ChNRdWVyeVR4TG9nc1Jlc3BvbnNlEikKBGxvZ3MYASADKAsyFS5ldGhlcm1pbnQuZXZtLnYxLkxvZ1IEbG9ncxJHCgpwYWdpbmF0aW9uGAIgASgLMicuY29zbW9zLmJhc2UucXVlcnkudjFiZXRhMS5QYWdlUmVzcG9uc2VSCnBhZ2luYXRpb24=');
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
      '6': '.ethermint.evm.v1.Params',
      '8': const {},
      '10': 'params'
    },
  ],
};

/// Descriptor for `QueryParamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryParamsResponseDescriptor = $convert.base64Decode(
    'ChNRdWVyeVBhcmFtc1Jlc3BvbnNlEjYKBnBhcmFtcxgBIAEoCzIYLmV0aGVybWludC5ldm0udjEuUGFyYW1zQgTI3h8AUgZwYXJhbXM=');
@$core.Deprecated('Use ethCallRequestDescriptor instead')
const EthCallRequest$json = const {
  '1': 'EthCallRequest',
  '2': const [
    const {'1': 'args', '3': 1, '4': 1, '5': 12, '10': 'args'},
    const {'1': 'gas_cap', '3': 2, '4': 1, '5': 4, '10': 'gasCap'},
  ],
};

/// Descriptor for `EthCallRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ethCallRequestDescriptor = $convert.base64Decode(
    'Cg5FdGhDYWxsUmVxdWVzdBISCgRhcmdzGAEgASgMUgRhcmdzEhcKB2dhc19jYXAYAiABKARSBmdhc0NhcA==');
@$core.Deprecated('Use estimateGasResponseDescriptor instead')
const EstimateGasResponse$json = const {
  '1': 'EstimateGasResponse',
  '2': const [
    const {'1': 'gas', '3': 1, '4': 1, '5': 4, '10': 'gas'},
  ],
};

/// Descriptor for `EstimateGasResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List estimateGasResponseDescriptor = $convert
    .base64Decode('ChNFc3RpbWF0ZUdhc1Jlc3BvbnNlEhAKA2dhcxgBIAEoBFIDZ2Fz');
@$core.Deprecated('Use queryTraceTxRequestDescriptor instead')
const QueryTraceTxRequest$json = const {
  '1': 'QueryTraceTxRequest',
  '2': const [
    const {
      '1': 'msg',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ethermint.evm.v1.MsgEthereumTx',
      '10': 'msg'
    },
    const {'1': 'tx_index', '3': 2, '4': 1, '5': 4, '10': 'txIndex'},
    const {
      '1': 'trace_config',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ethermint.evm.v1.TraceConfig',
      '10': 'traceConfig'
    },
    const {
      '1': 'predecessors',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.ethermint.evm.v1.MsgEthereumTx',
      '10': 'predecessors'
    },
    const {'1': 'block_number', '3': 5, '4': 1, '5': 3, '10': 'blockNumber'},
    const {'1': 'block_hash', '3': 6, '4': 1, '5': 9, '10': 'blockHash'},
    const {
      '1': 'block_time',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': const {},
      '10': 'blockTime'
    },
  ],
};

/// Descriptor for `QueryTraceTxRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTraceTxRequestDescriptor = $convert.base64Decode(
    'ChNRdWVyeVRyYWNlVHhSZXF1ZXN0EjEKA21zZxgBIAEoCzIfLmV0aGVybWludC5ldm0udjEuTXNnRXRoZXJldW1UeFIDbXNnEhkKCHR4X2luZGV4GAIgASgEUgd0eEluZGV4EkAKDHRyYWNlX2NvbmZpZxgDIAEoCzIdLmV0aGVybWludC5ldm0udjEuVHJhY2VDb25maWdSC3RyYWNlQ29uZmlnEkMKDHByZWRlY2Vzc29ycxgEIAMoCzIfLmV0aGVybWludC5ldm0udjEuTXNnRXRoZXJldW1UeFIMcHJlZGVjZXNzb3JzEiEKDGJsb2NrX251bWJlchgFIAEoA1ILYmxvY2tOdW1iZXISHQoKYmxvY2tfaGFzaBgGIAEoCVIJYmxvY2tIYXNoEkMKCmJsb2NrX3RpbWUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgjI3h8AkN8fAVIJYmxvY2tUaW1l');
@$core.Deprecated('Use queryTraceTxResponseDescriptor instead')
const QueryTraceTxResponse$json = const {
  '1': 'QueryTraceTxResponse',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `QueryTraceTxResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTraceTxResponseDescriptor = $convert
    .base64Decode('ChRRdWVyeVRyYWNlVHhSZXNwb25zZRISCgRkYXRhGAEgASgMUgRkYXRh');
@$core.Deprecated('Use queryTraceBlockRequestDescriptor instead')
const QueryTraceBlockRequest$json = const {
  '1': 'QueryTraceBlockRequest',
  '2': const [
    const {
      '1': 'txs',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.ethermint.evm.v1.MsgEthereumTx',
      '10': 'txs'
    },
    const {
      '1': 'trace_config',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.ethermint.evm.v1.TraceConfig',
      '10': 'traceConfig'
    },
    const {'1': 'block_number', '3': 5, '4': 1, '5': 3, '10': 'blockNumber'},
    const {'1': 'block_hash', '3': 6, '4': 1, '5': 9, '10': 'blockHash'},
    const {
      '1': 'block_time',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': const {},
      '10': 'blockTime'
    },
  ],
};

/// Descriptor for `QueryTraceBlockRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTraceBlockRequestDescriptor =
    $convert.base64Decode(
        'ChZRdWVyeVRyYWNlQmxvY2tSZXF1ZXN0EjEKA3R4cxgBIAMoCzIfLmV0aGVybWludC5ldm0udjEuTXNnRXRoZXJldW1UeFIDdHhzEkAKDHRyYWNlX2NvbmZpZxgDIAEoCzIdLmV0aGVybWludC5ldm0udjEuVHJhY2VDb25maWdSC3RyYWNlQ29uZmlnEiEKDGJsb2NrX251bWJlchgFIAEoA1ILYmxvY2tOdW1iZXISHQoKYmxvY2tfaGFzaBgGIAEoCVIJYmxvY2tIYXNoEkMKCmJsb2NrX3RpbWUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wQgjI3h8AkN8fAVIJYmxvY2tUaW1l');
@$core.Deprecated('Use queryTraceBlockResponseDescriptor instead')
const QueryTraceBlockResponse$json = const {
  '1': 'QueryTraceBlockResponse',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `QueryTraceBlockResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryTraceBlockResponseDescriptor =
    $convert.base64Decode(
        'ChdRdWVyeVRyYWNlQmxvY2tSZXNwb25zZRISCgRkYXRhGAEgASgMUgRkYXRh');
const $core.Map<$core.String, $core.dynamic> QueryServiceBase$json = const {
  '1': 'Query',
  '2': const [
    const {
      '1': 'Account',
      '2': '.ethermint.evm.v1.QueryAccountRequest',
      '3': '.ethermint.evm.v1.QueryAccountResponse',
      '4': const {}
    },
    const {
      '1': 'CosmosAccount',
      '2': '.ethermint.evm.v1.QueryCosmosAccountRequest',
      '3': '.ethermint.evm.v1.QueryCosmosAccountResponse',
      '4': const {}
    },
    const {
      '1': 'ValidatorAccount',
      '2': '.ethermint.evm.v1.QueryValidatorAccountRequest',
      '3': '.ethermint.evm.v1.QueryValidatorAccountResponse',
      '4': const {}
    },
    const {
      '1': 'Balance',
      '2': '.ethermint.evm.v1.QueryBalanceRequest',
      '3': '.ethermint.evm.v1.QueryBalanceResponse',
      '4': const {}
    },
    const {
      '1': 'Storage',
      '2': '.ethermint.evm.v1.QueryStorageRequest',
      '3': '.ethermint.evm.v1.QueryStorageResponse',
      '4': const {}
    },
    const {
      '1': 'Code',
      '2': '.ethermint.evm.v1.QueryCodeRequest',
      '3': '.ethermint.evm.v1.QueryCodeResponse',
      '4': const {}
    },
    const {
      '1': 'Params',
      '2': '.ethermint.evm.v1.QueryParamsRequest',
      '3': '.ethermint.evm.v1.QueryParamsResponse',
      '4': const {}
    },
    const {
      '1': 'EthCall',
      '2': '.ethermint.evm.v1.EthCallRequest',
      '3': '.ethermint.evm.v1.MsgEthereumTxResponse',
      '4': const {}
    },
    const {
      '1': 'EstimateGas',
      '2': '.ethermint.evm.v1.EthCallRequest',
      '3': '.ethermint.evm.v1.EstimateGasResponse',
      '4': const {}
    },
    const {
      '1': 'TraceTx',
      '2': '.ethermint.evm.v1.QueryTraceTxRequest',
      '3': '.ethermint.evm.v1.QueryTraceTxResponse',
      '4': const {}
    },
    const {
      '1': 'TraceBlock',
      '2': '.ethermint.evm.v1.QueryTraceBlockRequest',
      '3': '.ethermint.evm.v1.QueryTraceBlockResponse',
      '4': const {}
    },
  ],
};

@$core.Deprecated('Use queryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    QueryServiceBase$messageJson = const {
  '.ethermint.evm.v1.QueryAccountRequest': QueryAccountRequest$json,
  '.ethermint.evm.v1.QueryAccountResponse': QueryAccountResponse$json,
  '.ethermint.evm.v1.QueryCosmosAccountRequest': QueryCosmosAccountRequest$json,
  '.ethermint.evm.v1.QueryCosmosAccountResponse':
      QueryCosmosAccountResponse$json,
  '.ethermint.evm.v1.QueryValidatorAccountRequest':
      QueryValidatorAccountRequest$json,
  '.ethermint.evm.v1.QueryValidatorAccountResponse':
      QueryValidatorAccountResponse$json,
  '.ethermint.evm.v1.QueryBalanceRequest': QueryBalanceRequest$json,
  '.ethermint.evm.v1.QueryBalanceResponse': QueryBalanceResponse$json,
  '.ethermint.evm.v1.QueryStorageRequest': QueryStorageRequest$json,
  '.ethermint.evm.v1.QueryStorageResponse': QueryStorageResponse$json,
  '.ethermint.evm.v1.QueryCodeRequest': QueryCodeRequest$json,
  '.ethermint.evm.v1.QueryCodeResponse': QueryCodeResponse$json,
  '.ethermint.evm.v1.QueryParamsRequest': QueryParamsRequest$json,
  '.ethermint.evm.v1.QueryParamsResponse': QueryParamsResponse$json,
  '.ethermint.evm.v1.Params': $55.Params$json,
  '.ethermint.evm.v1.ChainConfig': $55.ChainConfig$json,
  '.ethermint.evm.v1.EthCallRequest': EthCallRequest$json,
  '.ethermint.evm.v1.MsgEthereumTxResponse': $56.MsgEthereumTxResponse$json,
  '.ethermint.evm.v1.Log': $55.Log$json,
  '.ethermint.evm.v1.EstimateGasResponse': EstimateGasResponse$json,
  '.ethermint.evm.v1.QueryTraceTxRequest': QueryTraceTxRequest$json,
  '.ethermint.evm.v1.MsgEthereumTx': $56.MsgEthereumTx$json,
  '.google.protobuf.Any': $0.Any$json,
  '.ethermint.evm.v1.TraceConfig': $55.TraceConfig$json,
  '.google.protobuf.Timestamp': $4.Timestamp$json,
  '.ethermint.evm.v1.QueryTraceTxResponse': QueryTraceTxResponse$json,
  '.ethermint.evm.v1.QueryTraceBlockRequest': QueryTraceBlockRequest$json,
  '.ethermint.evm.v1.QueryTraceBlockResponse': QueryTraceBlockResponse$json,
};

/// Descriptor for `Query`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List queryServiceDescriptor = $convert.base64Decode(
    'CgVRdWVyeRKFAQoHQWNjb3VudBIlLmV0aGVybWludC5ldm0udjEuUXVlcnlBY2NvdW50UmVxdWVzdBomLmV0aGVybWludC5ldm0udjEuUXVlcnlBY2NvdW50UmVzcG9uc2UiK4LT5JMCJRIjL2V0aGVybWludC9ldm0vdjEvYWNjb3VudC97YWRkcmVzc30SngEKDUNvc21vc0FjY291bnQSKy5ldGhlcm1pbnQuZXZtLnYxLlF1ZXJ5Q29zbW9zQWNjb3VudFJlcXVlc3QaLC5ldGhlcm1pbnQuZXZtLnYxLlF1ZXJ5Q29zbW9zQWNjb3VudFJlc3BvbnNlIjKC0+STAiwSKi9ldGhlcm1pbnQvZXZtL3YxL2Nvc21vc19hY2NvdW50L3thZGRyZXNzfRKvAQoQVmFsaWRhdG9yQWNjb3VudBIuLmV0aGVybWludC5ldm0udjEuUXVlcnlWYWxpZGF0b3JBY2NvdW50UmVxdWVzdBovLmV0aGVybWludC5ldm0udjEuUXVlcnlWYWxpZGF0b3JBY2NvdW50UmVzcG9uc2UiOoLT5JMCNBIyL2V0aGVybWludC9ldm0vdjEvdmFsaWRhdG9yX2FjY291bnQve2NvbnNfYWRkcmVzc30ShgEKB0JhbGFuY2USJS5ldGhlcm1pbnQuZXZtLnYxLlF1ZXJ5QmFsYW5jZVJlcXVlc3QaJi5ldGhlcm1pbnQuZXZtLnYxLlF1ZXJ5QmFsYW5jZVJlc3BvbnNlIiyC0+STAiYSJC9ldGhlcm1pbnQvZXZtL3YxL2JhbGFuY2VzL3thZGRyZXNzfRKLAQoHU3RvcmFnZRIlLmV0aGVybWludC5ldm0udjEuUXVlcnlTdG9yYWdlUmVxdWVzdBomLmV0aGVybWludC5ldm0udjEuUXVlcnlTdG9yYWdlUmVzcG9uc2UiMYLT5JMCKxIpL2V0aGVybWludC9ldm0vdjEvc3RvcmFnZS97YWRkcmVzc30ve2tleX0SegoEQ29kZRIiLmV0aGVybWludC5ldm0udjEuUXVlcnlDb2RlUmVxdWVzdBojLmV0aGVybWludC5ldm0udjEuUXVlcnlDb2RlUmVzcG9uc2UiKYLT5JMCIxIhL2V0aGVybWludC9ldm0vdjEvY29kZXMve2FkZHJlc3N9EncKBlBhcmFtcxIkLmV0aGVybWludC5ldm0udjEuUXVlcnlQYXJhbXNSZXF1ZXN0GiUuZXRoZXJtaW50LmV2bS52MS5RdWVyeVBhcmFtc1Jlc3BvbnNlIiCC0+STAhoSGC9ldGhlcm1pbnQvZXZtL3YxL3BhcmFtcxJ4CgdFdGhDYWxsEiAuZXRoZXJtaW50LmV2bS52MS5FdGhDYWxsUmVxdWVzdBonLmV0aGVybWludC5ldm0udjEuTXNnRXRoZXJldW1UeFJlc3BvbnNlIiKC0+STAhwSGi9ldGhlcm1pbnQvZXZtL3YxL2V0aF9jYWxsEn4KC0VzdGltYXRlR2FzEiAuZXRoZXJtaW50LmV2bS52MS5FdGhDYWxsUmVxdWVzdBolLmV0aGVybWludC5ldm0udjEuRXN0aW1hdGVHYXNSZXNwb25zZSImgtPkkwIgEh4vZXRoZXJtaW50L2V2bS92MS9lc3RpbWF0ZV9nYXMSfAoHVHJhY2VUeBIlLmV0aGVybWludC5ldm0udjEuUXVlcnlUcmFjZVR4UmVxdWVzdBomLmV0aGVybWludC5ldm0udjEuUXVlcnlUcmFjZVR4UmVzcG9uc2UiIoLT5JMCHBIaL2V0aGVybWludC9ldm0vdjEvdHJhY2VfdHgSiAEKClRyYWNlQmxvY2sSKC5ldGhlcm1pbnQuZXZtLnYxLlF1ZXJ5VHJhY2VCbG9ja1JlcXVlc3QaKS5ldGhlcm1pbnQuZXZtLnYxLlF1ZXJ5VHJhY2VCbG9ja1Jlc3BvbnNlIiWC0+STAh8SHS9ldGhlcm1pbnQvZXZtL3YxL3RyYWNlX2Jsb2Nr');
