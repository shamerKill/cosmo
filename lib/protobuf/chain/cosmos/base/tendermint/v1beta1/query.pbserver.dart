///
//  Generated code. Do not modify.
//  source: cosmos/base/tendermint/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $22;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class ServiceBase extends $pb.GeneratedService {
  $async.Future<$22.GetNodeInfoResponse> getNodeInfo($pb.ServerContext ctx, $22.GetNodeInfoRequest request);
  $async.Future<$22.GetSyncingResponse> getSyncing($pb.ServerContext ctx, $22.GetSyncingRequest request);
  $async.Future<$22.GetLatestBlockResponse> getLatestBlock($pb.ServerContext ctx, $22.GetLatestBlockRequest request);
  $async.Future<$22.GetBlockByHeightResponse> getBlockByHeight($pb.ServerContext ctx, $22.GetBlockByHeightRequest request);
  $async.Future<$22.GetLatestValidatorSetResponse> getLatestValidatorSet($pb.ServerContext ctx, $22.GetLatestValidatorSetRequest request);
  $async.Future<$22.GetValidatorSetByHeightResponse> getValidatorSetByHeight($pb.ServerContext ctx, $22.GetValidatorSetByHeightRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'GetNodeInfo': return $22.GetNodeInfoRequest();
      case 'GetSyncing': return $22.GetSyncingRequest();
      case 'GetLatestBlock': return $22.GetLatestBlockRequest();
      case 'GetBlockByHeight': return $22.GetBlockByHeightRequest();
      case 'GetLatestValidatorSet': return $22.GetLatestValidatorSetRequest();
      case 'GetValidatorSetByHeight': return $22.GetValidatorSetByHeightRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'GetNodeInfo': return this.getNodeInfo(ctx, request as $22.GetNodeInfoRequest);
      case 'GetSyncing': return this.getSyncing(ctx, request as $22.GetSyncingRequest);
      case 'GetLatestBlock': return this.getLatestBlock(ctx, request as $22.GetLatestBlockRequest);
      case 'GetBlockByHeight': return this.getBlockByHeight(ctx, request as $22.GetBlockByHeightRequest);
      case 'GetLatestValidatorSet': return this.getLatestValidatorSet(ctx, request as $22.GetLatestValidatorSetRequest);
      case 'GetValidatorSetByHeight': return this.getValidatorSetByHeight(ctx, request as $22.GetValidatorSetByHeightRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ServiceBase$messageJson;
}

