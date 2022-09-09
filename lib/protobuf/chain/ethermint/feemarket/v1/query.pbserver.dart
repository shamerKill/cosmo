///
//  Generated code. Do not modify.
//  source: ethermint/feemarket/v1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $59;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$59.QueryParamsResponse> params(
      $pb.ServerContext ctx, $59.QueryParamsRequest request);
  $async.Future<$59.QueryBaseFeeResponse> baseFee(
      $pb.ServerContext ctx, $59.QueryBaseFeeRequest request);
  $async.Future<$59.QueryBlockGasResponse> blockGas(
      $pb.ServerContext ctx, $59.QueryBlockGasRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Params':
        return $59.QueryParamsRequest();
      case 'BaseFee':
        return $59.QueryBaseFeeRequest();
      case 'BlockGas':
        return $59.QueryBlockGasRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Params':
        return this.params(ctx, request as $59.QueryParamsRequest);
      case 'BaseFee':
        return this.baseFee(ctx, request as $59.QueryBaseFeeRequest);
      case 'BlockGas':
        return this.blockGas(ctx, request as $59.QueryBlockGasRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => QueryServiceBase$messageJson;
}
