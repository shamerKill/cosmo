///
//  Generated code. Do not modify.
//  source: cosmos/upgrade/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $53;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$53.QueryCurrentPlanResponse> currentPlan($pb.ServerContext ctx, $53.QueryCurrentPlanRequest request);
  $async.Future<$53.QueryAppliedPlanResponse> appliedPlan($pb.ServerContext ctx, $53.QueryAppliedPlanRequest request);
  $async.Future<$53.QueryUpgradedConsensusStateResponse> upgradedConsensusState($pb.ServerContext ctx, $53.QueryUpgradedConsensusStateRequest request);
  $async.Future<$53.QueryModuleVersionsResponse> moduleVersions($pb.ServerContext ctx, $53.QueryModuleVersionsRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'CurrentPlan': return $53.QueryCurrentPlanRequest();
      case 'AppliedPlan': return $53.QueryAppliedPlanRequest();
      case 'UpgradedConsensusState': return $53.QueryUpgradedConsensusStateRequest();
      case 'ModuleVersions': return $53.QueryModuleVersionsRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'CurrentPlan': return this.currentPlan(ctx, request as $53.QueryCurrentPlanRequest);
      case 'AppliedPlan': return this.appliedPlan(ctx, request as $53.QueryAppliedPlanRequest);
      case 'UpgradedConsensusState': return this.upgradedConsensusState(ctx, request as $53.QueryUpgradedConsensusStateRequest);
      case 'ModuleVersions': return this.moduleVersions(ctx, request as $53.QueryModuleVersionsRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => QueryServiceBase$messageJson;
}

