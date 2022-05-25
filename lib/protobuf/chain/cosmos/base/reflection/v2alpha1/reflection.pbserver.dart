///
//  Generated code. Do not modify.
//  source: cosmos/base/reflection/v2alpha1/reflection.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'reflection.pb.dart' as $14;
import 'reflection.pbjson.dart';

export 'reflection.pb.dart';

abstract class ReflectionServiceBase extends $pb.GeneratedService {
  $async.Future<$14.GetAuthnDescriptorResponse> getAuthnDescriptor($pb.ServerContext ctx, $14.GetAuthnDescriptorRequest request);
  $async.Future<$14.GetChainDescriptorResponse> getChainDescriptor($pb.ServerContext ctx, $14.GetChainDescriptorRequest request);
  $async.Future<$14.GetCodecDescriptorResponse> getCodecDescriptor($pb.ServerContext ctx, $14.GetCodecDescriptorRequest request);
  $async.Future<$14.GetConfigurationDescriptorResponse> getConfigurationDescriptor($pb.ServerContext ctx, $14.GetConfigurationDescriptorRequest request);
  $async.Future<$14.GetQueryServicesDescriptorResponse> getQueryServicesDescriptor($pb.ServerContext ctx, $14.GetQueryServicesDescriptorRequest request);
  $async.Future<$14.GetTxDescriptorResponse> getTxDescriptor($pb.ServerContext ctx, $14.GetTxDescriptorRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'GetAuthnDescriptor': return $14.GetAuthnDescriptorRequest();
      case 'GetChainDescriptor': return $14.GetChainDescriptorRequest();
      case 'GetCodecDescriptor': return $14.GetCodecDescriptorRequest();
      case 'GetConfigurationDescriptor': return $14.GetConfigurationDescriptorRequest();
      case 'GetQueryServicesDescriptor': return $14.GetQueryServicesDescriptorRequest();
      case 'GetTxDescriptor': return $14.GetTxDescriptorRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'GetAuthnDescriptor': return this.getAuthnDescriptor(ctx, request as $14.GetAuthnDescriptorRequest);
      case 'GetChainDescriptor': return this.getChainDescriptor(ctx, request as $14.GetChainDescriptorRequest);
      case 'GetCodecDescriptor': return this.getCodecDescriptor(ctx, request as $14.GetCodecDescriptorRequest);
      case 'GetConfigurationDescriptor': return this.getConfigurationDescriptor(ctx, request as $14.GetConfigurationDescriptorRequest);
      case 'GetQueryServicesDescriptor': return this.getQueryServicesDescriptor(ctx, request as $14.GetQueryServicesDescriptorRequest);
      case 'GetTxDescriptor': return this.getTxDescriptor(ctx, request as $14.GetTxDescriptorRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ReflectionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ReflectionServiceBase$messageJson;
}

