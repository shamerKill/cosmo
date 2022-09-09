///
//  Generated code. Do not modify.
//  source: cosmos/bank/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $12;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$12.MsgSendResponse> send(
      $pb.ServerContext ctx, $12.MsgSend request);
  $async.Future<$12.MsgMultiSendResponse> multiSend(
      $pb.ServerContext ctx, $12.MsgMultiSend request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Send':
        return $12.MsgSend();
      case 'MultiSend':
        return $12.MsgMultiSend();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Send':
        return this.send(ctx, request as $12.MsgSend);
      case 'MultiSend':
        return this.multiSend(ctx, request as $12.MsgMultiSend);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => MsgServiceBase$messageJson;
}
