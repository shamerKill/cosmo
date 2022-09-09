///
//  Generated code. Do not modify.
//  source: cosmos/distribution/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $27;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$27.MsgSetWithdrawAddressResponse> setWithdrawAddress(
      $pb.ServerContext ctx, $27.MsgSetWithdrawAddress request);
  $async.Future<$27.MsgWithdrawDelegatorRewardResponse> withdrawDelegatorReward(
      $pb.ServerContext ctx, $27.MsgWithdrawDelegatorReward request);
  $async.Future<$27.MsgWithdrawValidatorCommissionResponse>
      withdrawValidatorCommission(
          $pb.ServerContext ctx, $27.MsgWithdrawValidatorCommission request);
  $async.Future<$27.MsgFundCommunityPoolResponse> fundCommunityPool(
      $pb.ServerContext ctx, $27.MsgFundCommunityPool request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'SetWithdrawAddress':
        return $27.MsgSetWithdrawAddress();
      case 'WithdrawDelegatorReward':
        return $27.MsgWithdrawDelegatorReward();
      case 'WithdrawValidatorCommission':
        return $27.MsgWithdrawValidatorCommission();
      case 'FundCommunityPool':
        return $27.MsgFundCommunityPool();
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'SetWithdrawAddress':
        return this
            .setWithdrawAddress(ctx, request as $27.MsgSetWithdrawAddress);
      case 'WithdrawDelegatorReward':
        return this.withdrawDelegatorReward(
            ctx, request as $27.MsgWithdrawDelegatorReward);
      case 'WithdrawValidatorCommission':
        return this.withdrawValidatorCommission(
            ctx, request as $27.MsgWithdrawValidatorCommission);
      case 'FundCommunityPool':
        return this.fundCommunityPool(ctx, request as $27.MsgFundCommunityPool);
      default:
        throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => MsgServiceBase$messageJson;
}
