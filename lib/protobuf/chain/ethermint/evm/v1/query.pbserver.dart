///
//  Generated code. Do not modify.
//  source: ethermint/evm/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $57;
import 'tx.pb.dart' as $56;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$57.QueryAccountResponse> account(
      $pb.ServerContext ctx, $57.QueryAccountRequest request);
  $async.Future<$57.QueryCosmosAccountResponse> cosmosAccount(
      $pb.ServerContext ctx, $57.QueryCosmosAccountRequest request);
  $async.Future<$57.QueryValidatorAccountResponse> validatorAccount(
      $pb.ServerContext ctx, $57.QueryValidatorAccountRequest request);
  $async.Future<$57.QueryBalanceResponse> balance(
      $pb.ServerContext ctx, $57.QueryBalanceRequest request);
  $async.Future<$57.QueryStorageResponse> storage(
      $pb.ServerContext ctx, $57.QueryStorageRequest request);
  $async.Future<$57.QueryCodeResponse> code(
      $pb.ServerContext ctx, $57.QueryCodeRequest request);
  $async.Future<$57.QueryParamsResponse> params(
      $pb.ServerContext ctx, $57.QueryParamsRequest request);
  $async.Future<$56.MsgEthereumTxResponse> ethCall(
      $pb.ServerContext ctx, $57.EthCallRequest request);
  $async.Future<$57.EstimateGasResponse> estimateGas(
      $pb.ServerContext ctx, $57.EthCallRequest request);
  $async.Future<$57.QueryTraceTxResponse> traceTx(
      $pb.ServerContext ctx, $57.QueryTraceTxRequest request);
  $async.Future<$57.QueryTraceBlockResponse> traceBlock(
      $pb.ServerContext ctx, $57.QueryTraceBlockRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Account':
        return $57.QueryAccountRequest();
      case 'CosmosAccount':
        return $57.QueryCosmosAccountRequest();
      case 'ValidatorAccount':
        return $57.QueryValidatorAccountRequest();
      case 'Balance':
        return $57.QueryBalanceRequest();
      case 'Storage':
        return $57.QueryStorageRequest();
      case 'Code':
        return $57.QueryCodeRequest();
      case 'Params':
        return $57.QueryParamsRequest();
      case 'EthCall':
        return $57.EthCallRequest();
      case 'EstimateGas':
        return $57.EthCallRequest();
      case 'TraceTx':
        return $57.QueryTraceTxRequest();
      case 'TraceBlock':
        return $57.QueryTraceBlockRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Account':
        return this.account(ctx, request as $57.QueryAccountRequest);
      case 'CosmosAccount':
        return this
            .cosmosAccount(ctx, request as $57.QueryCosmosAccountRequest);
      case 'ValidatorAccount':
        return this
            .validatorAccount(ctx, request as $57.QueryValidatorAccountRequest);
      case 'Balance':
        return this.balance(ctx, request as $57.QueryBalanceRequest);
      case 'Storage':
        return this.storage(ctx, request as $57.QueryStorageRequest);
      case 'Code':
        return this.code(ctx, request as $57.QueryCodeRequest);
      case 'Params':
        return this.params(ctx, request as $57.QueryParamsRequest);
      case 'EthCall':
        return this.ethCall(ctx, request as $57.EthCallRequest);
      case 'EstimateGas':
        return this.estimateGas(ctx, request as $57.EthCallRequest);
      case 'TraceTx':
        return this.traceTx(ctx, request as $57.QueryTraceTxRequest);
      case 'TraceBlock':
        return this.traceBlock(ctx, request as $57.QueryTraceBlockRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => QueryServiceBase$messageJson;
}
