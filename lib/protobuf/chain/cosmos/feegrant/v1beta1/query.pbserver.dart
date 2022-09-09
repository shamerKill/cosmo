///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $32;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$32.QueryAllowanceResponse> allowance(
      $pb.ServerContext ctx, $32.QueryAllowanceRequest request);
  $async.Future<$32.QueryAllowancesResponse> allowances(
      $pb.ServerContext ctx, $32.QueryAllowancesRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Allowance':
        return $32.QueryAllowanceRequest();
      case 'Allowances':
        return $32.QueryAllowancesRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Allowance':
        return this.allowance(ctx, request as $32.QueryAllowanceRequest);
      case 'Allowances':
        return this.allowances(ctx, request as $32.QueryAllowancesRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => QueryServiceBase$messageJson;
}
