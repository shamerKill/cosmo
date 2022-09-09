///
//  Generated code. Do not modify.
//  source: cosmos/authz/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $8;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$8.MsgGrantResponse> grant(
      $pb.ServerContext ctx, $8.MsgGrant request);
  $async.Future<$8.MsgExecResponse> exec(
      $pb.ServerContext ctx, $8.MsgExec request);
  $async.Future<$8.MsgRevokeResponse> revoke(
      $pb.ServerContext ctx, $8.MsgRevoke request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Grant':
        return $8.MsgGrant();
      case 'Exec':
        return $8.MsgExec();
      case 'Revoke':
        return $8.MsgRevoke();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Grant':
        return this.grant(ctx, request as $8.MsgGrant);
      case 'Exec':
        return this.exec(ctx, request as $8.MsgExec);
      case 'Revoke':
        return this.revoke(ctx, request as $8.MsgRevoke);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => MsgServiceBase$messageJson;
}
