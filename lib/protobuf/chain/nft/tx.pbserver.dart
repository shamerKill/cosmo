///
//  Generated code. Do not modify.
//  source: nft/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $65;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$65.MsgIssueClassResponse> issueClass($pb.ServerContext ctx, $65.MsgIssueClass request);
  $async.Future<$65.MsgIssueNFTResponse> issueNFT($pb.ServerContext ctx, $65.MsgIssueNFT request);
  $async.Future<$65.MsgEditNFTResponse> editNFT($pb.ServerContext ctx, $65.MsgEditNFT request);
  $async.Future<$65.MsgBurnNFTResponse> burnNFT($pb.ServerContext ctx, $65.MsgBurnNFT request);
  $async.Future<$65.MsgTransferNFTResponse> transferNFT($pb.ServerContext ctx, $65.MsgTransferNFT request);
  $async.Future<$65.MsgTransferClassResponse> transferClass($pb.ServerContext ctx, $65.MsgTransferClass request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'IssueClass': return $65.MsgIssueClass();
      case 'IssueNFT': return $65.MsgIssueNFT();
      case 'EditNFT': return $65.MsgEditNFT();
      case 'BurnNFT': return $65.MsgBurnNFT();
      case 'TransferNFT': return $65.MsgTransferNFT();
      case 'TransferClass': return $65.MsgTransferClass();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'IssueClass': return this.issueClass(ctx, request as $65.MsgIssueClass);
      case 'IssueNFT': return this.issueNFT(ctx, request as $65.MsgIssueNFT);
      case 'EditNFT': return this.editNFT(ctx, request as $65.MsgEditNFT);
      case 'BurnNFT': return this.burnNFT(ctx, request as $65.MsgBurnNFT);
      case 'TransferNFT': return this.transferNFT(ctx, request as $65.MsgTransferNFT);
      case 'TransferClass': return this.transferClass(ctx, request as $65.MsgTransferClass);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => MsgServiceBase$messageJson;
}

