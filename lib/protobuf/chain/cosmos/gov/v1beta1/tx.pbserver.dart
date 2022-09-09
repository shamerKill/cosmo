///
//  Generated code. Do not modify.
//  source: cosmos/gov/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $36;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$36.MsgSubmitProposalResponse> submitProposal(
      $pb.ServerContext ctx, $36.MsgSubmitProposal request);
  $async.Future<$36.MsgVoteResponse> vote(
      $pb.ServerContext ctx, $36.MsgVote request);
  $async.Future<$36.MsgVoteWeightedResponse> voteWeighted(
      $pb.ServerContext ctx, $36.MsgVoteWeighted request);
  $async.Future<$36.MsgDepositResponse> deposit(
      $pb.ServerContext ctx, $36.MsgDeposit request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'SubmitProposal':
        return $36.MsgSubmitProposal();
      case 'Vote':
        return $36.MsgVote();
      case 'VoteWeighted':
        return $36.MsgVoteWeighted();
      case 'Deposit':
        return $36.MsgDeposit();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'SubmitProposal':
        return this.submitProposal(ctx, request as $36.MsgSubmitProposal);
      case 'Vote':
        return this.vote(ctx, request as $36.MsgVote);
      case 'VoteWeighted':
        return this.voteWeighted(ctx, request as $36.MsgVoteWeighted);
      case 'Deposit':
        return this.deposit(ctx, request as $36.MsgDeposit);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => MsgServiceBase$messageJson;
}
