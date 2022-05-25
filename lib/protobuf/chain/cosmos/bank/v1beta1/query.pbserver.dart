///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $11;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$11.QueryBalanceResponse> balance($pb.ServerContext ctx, $11.QueryBalanceRequest request);
  $async.Future<$11.QueryAllBalancesResponse> allBalances($pb.ServerContext ctx, $11.QueryAllBalancesRequest request);
  $async.Future<$11.QueryTotalSupplyResponse> totalSupply($pb.ServerContext ctx, $11.QueryTotalSupplyRequest request);
  $async.Future<$11.QuerySupplyOfResponse> supplyOf($pb.ServerContext ctx, $11.QuerySupplyOfRequest request);
  $async.Future<$11.QueryParamsResponse> params($pb.ServerContext ctx, $11.QueryParamsRequest request);
  $async.Future<$11.QueryDenomMetadataResponse> denomMetadata($pb.ServerContext ctx, $11.QueryDenomMetadataRequest request);
  $async.Future<$11.QueryDenomsMetadataResponse> denomsMetadata($pb.ServerContext ctx, $11.QueryDenomsMetadataRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Balance': return $11.QueryBalanceRequest();
      case 'AllBalances': return $11.QueryAllBalancesRequest();
      case 'TotalSupply': return $11.QueryTotalSupplyRequest();
      case 'SupplyOf': return $11.QuerySupplyOfRequest();
      case 'Params': return $11.QueryParamsRequest();
      case 'DenomMetadata': return $11.QueryDenomMetadataRequest();
      case 'DenomsMetadata': return $11.QueryDenomsMetadataRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Balance': return this.balance(ctx, request as $11.QueryBalanceRequest);
      case 'AllBalances': return this.allBalances(ctx, request as $11.QueryAllBalancesRequest);
      case 'TotalSupply': return this.totalSupply(ctx, request as $11.QueryTotalSupplyRequest);
      case 'SupplyOf': return this.supplyOf(ctx, request as $11.QuerySupplyOfRequest);
      case 'Params': return this.params(ctx, request as $11.QueryParamsRequest);
      case 'DenomMetadata': return this.denomMetadata(ctx, request as $11.QueryDenomMetadataRequest);
      case 'DenomsMetadata': return this.denomsMetadata(ctx, request as $11.QueryDenomsMetadataRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => QueryServiceBase$messageJson;
}

