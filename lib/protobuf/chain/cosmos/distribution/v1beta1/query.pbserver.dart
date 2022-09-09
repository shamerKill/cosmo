///
//  Generated code. Do not modify.
//  source: cosmos/distribution/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $26;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$26.QueryParamsResponse> params(
      $pb.ServerContext ctx, $26.QueryParamsRequest request);
  $async.Future<$26.QueryValidatorOutstandingRewardsResponse>
      validatorOutstandingRewards($pb.ServerContext ctx,
          $26.QueryValidatorOutstandingRewardsRequest request);
  $async.Future<$26.QueryValidatorCommissionResponse> validatorCommission(
      $pb.ServerContext ctx, $26.QueryValidatorCommissionRequest request);
  $async.Future<$26.QueryValidatorSlashesResponse> validatorSlashes(
      $pb.ServerContext ctx, $26.QueryValidatorSlashesRequest request);
  $async.Future<$26.QueryDelegationRewardsResponse> delegationRewards(
      $pb.ServerContext ctx, $26.QueryDelegationRewardsRequest request);
  $async.Future<$26.QueryDelegationTotalRewardsResponse> delegationTotalRewards(
      $pb.ServerContext ctx, $26.QueryDelegationTotalRewardsRequest request);
  $async.Future<$26.QueryDelegatorValidatorsResponse> delegatorValidators(
      $pb.ServerContext ctx, $26.QueryDelegatorValidatorsRequest request);
  $async.Future<$26.QueryDelegatorWithdrawAddressResponse>
      delegatorWithdrawAddress($pb.ServerContext ctx,
          $26.QueryDelegatorWithdrawAddressRequest request);
  $async.Future<$26.QueryCommunityPoolResponse> communityPool(
      $pb.ServerContext ctx, $26.QueryCommunityPoolRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Params':
        return $26.QueryParamsRequest();
      case 'ValidatorOutstandingRewards':
        return $26.QueryValidatorOutstandingRewardsRequest();
      case 'ValidatorCommission':
        return $26.QueryValidatorCommissionRequest();
      case 'ValidatorSlashes':
        return $26.QueryValidatorSlashesRequest();
      case 'DelegationRewards':
        return $26.QueryDelegationRewardsRequest();
      case 'DelegationTotalRewards':
        return $26.QueryDelegationTotalRewardsRequest();
      case 'DelegatorValidators':
        return $26.QueryDelegatorValidatorsRequest();
      case 'DelegatorWithdrawAddress':
        return $26.QueryDelegatorWithdrawAddressRequest();
      case 'CommunityPool':
        return $26.QueryCommunityPoolRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Params':
        return this.params(ctx, request as $26.QueryParamsRequest);
      case 'ValidatorOutstandingRewards':
        return this.validatorOutstandingRewards(
            ctx, request as $26.QueryValidatorOutstandingRewardsRequest);
      case 'ValidatorCommission':
        return this.validatorCommission(
            ctx, request as $26.QueryValidatorCommissionRequest);
      case 'ValidatorSlashes':
        return this
            .validatorSlashes(ctx, request as $26.QueryValidatorSlashesRequest);
      case 'DelegationRewards':
        return this.delegationRewards(
            ctx, request as $26.QueryDelegationRewardsRequest);
      case 'DelegationTotalRewards':
        return this.delegationTotalRewards(
            ctx, request as $26.QueryDelegationTotalRewardsRequest);
      case 'DelegatorValidators':
        return this.delegatorValidators(
            ctx, request as $26.QueryDelegatorValidatorsRequest);
      case 'DelegatorWithdrawAddress':
        return this.delegatorWithdrawAddress(
            ctx, request as $26.QueryDelegatorWithdrawAddressRequest);
      case 'CommunityPool':
        return this
            .communityPool(ctx, request as $26.QueryCommunityPoolRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => QueryServiceBase$messageJson;
}
