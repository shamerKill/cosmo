///
//  Generated code. Do not modify.
//  source: cosmos/base/reflection/v1beta1/reflection.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'reflection.pb.dart' as $13;
import 'reflection.pbjson.dart';

export 'reflection.pb.dart';

abstract class ReflectionServiceBase extends $pb.GeneratedService {
  $async.Future<$13.ListAllInterfacesResponse> listAllInterfaces($pb.ServerContext ctx, $13.ListAllInterfacesRequest request);
  $async.Future<$13.ListImplementationsResponse> listImplementations($pb.ServerContext ctx, $13.ListImplementationsRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'ListAllInterfaces': return $13.ListAllInterfacesRequest();
      case 'ListImplementations': return $13.ListImplementationsRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'ListAllInterfaces': return this.listAllInterfaces(ctx, request as $13.ListAllInterfacesRequest);
      case 'ListImplementations': return this.listImplementations(ctx, request as $13.ListImplementationsRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ReflectionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ReflectionServiceBase$messageJson;
}

