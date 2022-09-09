///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $33;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$33.MsgGrantAllowanceResponse> grantAllowance(
      $pb.ServerContext ctx, $33.MsgGrantAllowance request);
  $async.Future<$33.MsgRevokeAllowanceResponse> revokeAllowance(
      $pb.ServerContext ctx, $33.MsgRevokeAllowance request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'GrantAllowance':
        return $33.MsgGrantAllowance();
      case 'RevokeAllowance':
        return $33.MsgRevokeAllowance();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'GrantAllowance':
        return this.grantAllowance(ctx, request as $33.MsgGrantAllowance);
      case 'RevokeAllowance':
        return this.revokeAllowance(ctx, request as $33.MsgRevokeAllowance);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => MsgServiceBase$messageJson;
}
