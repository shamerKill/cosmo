///
//  Generated code. Do not modify.
//  source: cosmos/slashing/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $42;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$42.QueryParamsResponse> params($pb.ServerContext ctx, $42.QueryParamsRequest request);
  $async.Future<$42.QuerySigningInfoResponse> signingInfo($pb.ServerContext ctx, $42.QuerySigningInfoRequest request);
  $async.Future<$42.QuerySigningInfosResponse> signingInfos($pb.ServerContext ctx, $42.QuerySigningInfosRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Params': return $42.QueryParamsRequest();
      case 'SigningInfo': return $42.QuerySigningInfoRequest();
      case 'SigningInfos': return $42.QuerySigningInfosRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Params': return this.params(ctx, request as $42.QueryParamsRequest);
      case 'SigningInfo': return this.signingInfo(ctx, request as $42.QuerySigningInfoRequest);
      case 'SigningInfos': return this.signingInfos(ctx, request as $42.QuerySigningInfosRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => QueryServiceBase$messageJson;
}

