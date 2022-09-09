///
//  Generated code. Do not modify.
//  source: cosmos/tx/v1beta1/service.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'service.pb.dart' as $51;
import 'service.pbjson.dart';

export 'service.pb.dart';

abstract class ServiceBase extends $pb.GeneratedService {
  $async.Future<$51.SimulateResponse> simulate(
      $pb.ServerContext ctx, $51.SimulateRequest request);
  $async.Future<$51.GetTxResponse> getTx(
      $pb.ServerContext ctx, $51.GetTxRequest request);
  $async.Future<$51.BroadcastTxResponse> broadcastTx(
      $pb.ServerContext ctx, $51.BroadcastTxRequest request);
  $async.Future<$51.GetTxsEventResponse> getTxsEvent(
      $pb.ServerContext ctx, $51.GetTxsEventRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Simulate':
        return $51.SimulateRequest();
      case 'GetTx':
        return $51.GetTxRequest();
      case 'BroadcastTx':
        return $51.BroadcastTxRequest();
      case 'GetTxsEvent':
        return $51.GetTxsEventRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Simulate':
        return this.simulate(ctx, request as $51.SimulateRequest);
      case 'GetTx':
        return this.getTx(ctx, request as $51.GetTxRequest);
      case 'BroadcastTx':
        return this.broadcastTx(ctx, request as $51.BroadcastTxRequest);
      case 'GetTxsEvent':
        return this.getTxsEvent(ctx, request as $51.GetTxsEventRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => ServiceBase$messageJson;
}
