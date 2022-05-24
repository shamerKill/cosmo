///
//  Generated code. Do not modify.
//  source: plug-proto/prc10/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $0;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$0.MsgIssueTokenResponse> issueToken($pb.ServerContext ctx, $0.MsgIssueToken request);
  $async.Future<$0.MsgMintTokenResponse> mintToken($pb.ServerContext ctx, $0.MsgMintToken request);
  $async.Future<$0.MsgEditTokenResponse> editToken($pb.ServerContext ctx, $0.MsgEditToken request);
  $async.Future<$0.MsgBurnTokenResponse> burnToken($pb.ServerContext ctx, $0.MsgBurnToken request);
  $async.Future<$0.MsgTransferOwnerTokenResponse> transferOwnerToken($pb.ServerContext ctx, $0.MsgTransferOwnerToken request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'IssueToken': return $0.MsgIssueToken();
      case 'MintToken': return $0.MsgMintToken();
      case 'EditToken': return $0.MsgEditToken();
      case 'BurnToken': return $0.MsgBurnToken();
      case 'TransferOwnerToken': return $0.MsgTransferOwnerToken();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'IssueToken': return this.issueToken(ctx, request as $0.MsgIssueToken);
      case 'MintToken': return this.mintToken(ctx, request as $0.MsgMintToken);
      case 'EditToken': return this.editToken(ctx, request as $0.MsgEditToken);
      case 'BurnToken': return this.burnToken(ctx, request as $0.MsgBurnToken);
      case 'TransferOwnerToken': return this.transferOwnerToken(ctx, request as $0.MsgTransferOwnerToken);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => MsgServiceBase$messageJson;
}

