///
//  Generated code. Do not modify.
//  source: cosmos/staking/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'tx.pb.dart' as $46;
import 'tx.pbjson.dart';

export 'tx.pb.dart';

abstract class MsgServiceBase extends $pb.GeneratedService {
  $async.Future<$46.MsgCreateValidatorResponse> createValidator($pb.ServerContext ctx, $46.MsgCreateValidator request);
  $async.Future<$46.MsgEditValidatorResponse> editValidator($pb.ServerContext ctx, $46.MsgEditValidator request);
  $async.Future<$46.MsgDelegateResponse> delegate($pb.ServerContext ctx, $46.MsgDelegate request);
  $async.Future<$46.MsgBeginRedelegateResponse> beginRedelegate($pb.ServerContext ctx, $46.MsgBeginRedelegate request);
  $async.Future<$46.MsgUndelegateResponse> undelegate($pb.ServerContext ctx, $46.MsgUndelegate request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'CreateValidator': return $46.MsgCreateValidator();
      case 'EditValidator': return $46.MsgEditValidator();
      case 'Delegate': return $46.MsgDelegate();
      case 'BeginRedelegate': return $46.MsgBeginRedelegate();
      case 'Undelegate': return $46.MsgUndelegate();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'CreateValidator': return this.createValidator(ctx, request as $46.MsgCreateValidator);
      case 'EditValidator': return this.editValidator(ctx, request as $46.MsgEditValidator);
      case 'Delegate': return this.delegate(ctx, request as $46.MsgDelegate);
      case 'BeginRedelegate': return this.beginRedelegate(ctx, request as $46.MsgBeginRedelegate);
      case 'Undelegate': return this.undelegate(ctx, request as $46.MsgUndelegate);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MsgServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => MsgServiceBase$messageJson;
}

