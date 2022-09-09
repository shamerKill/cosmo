///
//  Generated code. Do not modify.
//  source: cosmos/staking/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $45;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$45.QueryValidatorsResponse> validators(
      $pb.ServerContext ctx, $45.QueryValidatorsRequest request);
  $async.Future<$45.QueryValidatorResponse> validator(
      $pb.ServerContext ctx, $45.QueryValidatorRequest request);
  $async.Future<$45.QueryValidatorDelegationsResponse> validatorDelegations(
      $pb.ServerContext ctx, $45.QueryValidatorDelegationsRequest request);
  $async.Future<$45.QueryValidatorUnbondingDelegationsResponse>
      validatorUnbondingDelegations($pb.ServerContext ctx,
          $45.QueryValidatorUnbondingDelegationsRequest request);
  $async.Future<$45.QueryDelegationResponse> delegation(
      $pb.ServerContext ctx, $45.QueryDelegationRequest request);
  $async.Future<$45.QueryUnbondingDelegationResponse> unbondingDelegation(
      $pb.ServerContext ctx, $45.QueryUnbondingDelegationRequest request);
  $async.Future<$45.QueryDelegatorDelegationsResponse> delegatorDelegations(
      $pb.ServerContext ctx, $45.QueryDelegatorDelegationsRequest request);
  $async.Future<$45.QueryDelegatorUnbondingDelegationsResponse>
      delegatorUnbondingDelegations($pb.ServerContext ctx,
          $45.QueryDelegatorUnbondingDelegationsRequest request);
  $async.Future<$45.QueryRedelegationsResponse> redelegations(
      $pb.ServerContext ctx, $45.QueryRedelegationsRequest request);
  $async.Future<$45.QueryDelegatorValidatorsResponse> delegatorValidators(
      $pb.ServerContext ctx, $45.QueryDelegatorValidatorsRequest request);
  $async.Future<$45.QueryDelegatorValidatorResponse> delegatorValidator(
      $pb.ServerContext ctx, $45.QueryDelegatorValidatorRequest request);
  $async.Future<$45.QueryHistoricalInfoResponse> historicalInfo(
      $pb.ServerContext ctx, $45.QueryHistoricalInfoRequest request);
  $async.Future<$45.QueryPoolResponse> pool(
      $pb.ServerContext ctx, $45.QueryPoolRequest request);
  $async.Future<$45.QueryParamsResponse> params(
      $pb.ServerContext ctx, $45.QueryParamsRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Validators':
        return $45.QueryValidatorsRequest();
      case 'Validator':
        return $45.QueryValidatorRequest();
      case 'ValidatorDelegations':
        return $45.QueryValidatorDelegationsRequest();
      case 'ValidatorUnbondingDelegations':
        return $45.QueryValidatorUnbondingDelegationsRequest();
      case 'Delegation':
        return $45.QueryDelegationRequest();
      case 'UnbondingDelegation':
        return $45.QueryUnbondingDelegationRequest();
      case 'DelegatorDelegations':
        return $45.QueryDelegatorDelegationsRequest();
      case 'DelegatorUnbondingDelegations':
        return $45.QueryDelegatorUnbondingDelegationsRequest();
      case 'Redelegations':
        return $45.QueryRedelegationsRequest();
      case 'DelegatorValidators':
        return $45.QueryDelegatorValidatorsRequest();
      case 'DelegatorValidator':
        return $45.QueryDelegatorValidatorRequest();
      case 'HistoricalInfo':
        return $45.QueryHistoricalInfoRequest();
      case 'Pool':
        return $45.QueryPoolRequest();
      case 'Params':
        return $45.QueryParamsRequest();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Validators':
        return this.validators(ctx, request as $45.QueryValidatorsRequest);
      case 'Validator':
        return this.validator(ctx, request as $45.QueryValidatorRequest);
      case 'ValidatorDelegations':
        return this.validatorDelegations(
            ctx, request as $45.QueryValidatorDelegationsRequest);
      case 'ValidatorUnbondingDelegations':
        return this.validatorUnbondingDelegations(
            ctx, request as $45.QueryValidatorUnbondingDelegationsRequest);
      case 'Delegation':
        return this.delegation(ctx, request as $45.QueryDelegationRequest);
      case 'UnbondingDelegation':
        return this.unbondingDelegation(
            ctx, request as $45.QueryUnbondingDelegationRequest);
      case 'DelegatorDelegations':
        return this.delegatorDelegations(
            ctx, request as $45.QueryDelegatorDelegationsRequest);
      case 'DelegatorUnbondingDelegations':
        return this.delegatorUnbondingDelegations(
            ctx, request as $45.QueryDelegatorUnbondingDelegationsRequest);
      case 'Redelegations':
        return this
            .redelegations(ctx, request as $45.QueryRedelegationsRequest);
      case 'DelegatorValidators':
        return this.delegatorValidators(
            ctx, request as $45.QueryDelegatorValidatorsRequest);
      case 'DelegatorValidator':
        return this.delegatorValidator(
            ctx, request as $45.QueryDelegatorValidatorRequest);
      case 'HistoricalInfo':
        return this
            .historicalInfo(ctx, request as $45.QueryHistoricalInfoRequest);
      case 'Pool':
        return this.pool(ctx, request as $45.QueryPoolRequest);
      case 'Params':
        return this.params(ctx, request as $45.QueryParamsRequest);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => QueryServiceBase$messageJson;
}
