///
//  Generated code. Do not modify.
//  source: cosmos/gov/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $35;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$35.QueryProposalResponse> proposal($pb.ServerContext ctx, $35.QueryProposalRequest request);
  $async.Future<$35.QueryProposalsResponse> proposals($pb.ServerContext ctx, $35.QueryProposalsRequest request);
  $async.Future<$35.QueryVoteResponse> vote($pb.ServerContext ctx, $35.QueryVoteRequest request);
  $async.Future<$35.QueryVotesResponse> votes($pb.ServerContext ctx, $35.QueryVotesRequest request);
  $async.Future<$35.QueryParamsResponse> params($pb.ServerContext ctx, $35.QueryParamsRequest request);
  $async.Future<$35.QueryDepositResponse> deposit($pb.ServerContext ctx, $35.QueryDepositRequest request);
  $async.Future<$35.QueryDepositsResponse> deposits($pb.ServerContext ctx, $35.QueryDepositsRequest request);
  $async.Future<$35.QueryTallyResultResponse> tallyResult($pb.ServerContext ctx, $35.QueryTallyResultRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Proposal': return $35.QueryProposalRequest();
      case 'Proposals': return $35.QueryProposalsRequest();
      case 'Vote': return $35.QueryVoteRequest();
      case 'Votes': return $35.QueryVotesRequest();
      case 'Params': return $35.QueryParamsRequest();
      case 'Deposit': return $35.QueryDepositRequest();
      case 'Deposits': return $35.QueryDepositsRequest();
      case 'TallyResult': return $35.QueryTallyResultRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Proposal': return this.proposal(ctx, request as $35.QueryProposalRequest);
      case 'Proposals': return this.proposals(ctx, request as $35.QueryProposalsRequest);
      case 'Vote': return this.vote(ctx, request as $35.QueryVoteRequest);
      case 'Votes': return this.votes(ctx, request as $35.QueryVotesRequest);
      case 'Params': return this.params(ctx, request as $35.QueryParamsRequest);
      case 'Deposit': return this.deposit(ctx, request as $35.QueryDepositRequest);
      case 'Deposits': return this.deposits(ctx, request as $35.QueryDepositsRequest);
      case 'TallyResult': return this.tallyResult(ctx, request as $35.QueryTallyResultRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => QueryServiceBase$messageJson;
}

