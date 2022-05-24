///
//  Generated code. Do not modify.
//  source: token/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'query.pb.dart' as $1;
export 'query.pb.dart';

class QueryClient extends $grpc.Client {
  static final _$token =
      $grpc.ClientMethod<$1.QueryTokenRequest, $1.QueryTokenResponse>(
          '/plugchain.token.Query/Token',
          ($1.QueryTokenRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryTokenResponse.fromBuffer(value));
  static final _$fees =
      $grpc.ClientMethod<$1.QueryFeesRequest, $1.QueryFeesResponse>(
          '/plugchain.token.Query/Fees',
          ($1.QueryFeesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryFeesResponse.fromBuffer(value));
  static final _$params =
      $grpc.ClientMethod<$1.QueryParamsRequest, $1.QueryParamsResponse>(
          '/plugchain.token.Query/Params',
          ($1.QueryParamsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryParamsResponse.fromBuffer(value));
  static final _$tokens =
      $grpc.ClientMethod<$1.QueryTokensRequest, $1.QueryTokensResponse>(
          '/plugchain.token.Query/Tokens',
          ($1.QueryTokensRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $1.QueryTokensResponse.fromBuffer(value));

  QueryClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.QueryTokenResponse> token(
      $1.QueryTokenRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$token, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryFeesResponse> fees($1.QueryFeesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$fees, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryParamsResponse> params(
      $1.QueryParamsRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$params, request, options: options);
  }

  $grpc.ResponseFuture<$1.QueryTokensResponse> tokens(
      $1.QueryTokensRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$tokens, request, options: options);
  }
}

abstract class QueryServiceBase extends $grpc.Service {
  $core.String get $name => 'plugchain.token.Query';

  QueryServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.QueryTokenRequest, $1.QueryTokenResponse>(
        'Token',
        token_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.QueryTokenRequest.fromBuffer(value),
        ($1.QueryTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.QueryFeesRequest, $1.QueryFeesResponse>(
        'Fees',
        fees_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.QueryFeesRequest.fromBuffer(value),
        ($1.QueryFeesResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.QueryParamsRequest, $1.QueryParamsResponse>(
            'Params',
            params_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.QueryParamsRequest.fromBuffer(value),
            ($1.QueryParamsResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$1.QueryTokensRequest, $1.QueryTokensResponse>(
            'Tokens',
            tokens_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $1.QueryTokensRequest.fromBuffer(value),
            ($1.QueryTokensResponse value) => value.writeToBuffer()));
  }

  $async.Future<$1.QueryTokenResponse> token_Pre($grpc.ServiceCall call,
      $async.Future<$1.QueryTokenRequest> request) async {
    return token(call, await request);
  }

  $async.Future<$1.QueryFeesResponse> fees_Pre($grpc.ServiceCall call,
      $async.Future<$1.QueryFeesRequest> request) async {
    return fees(call, await request);
  }

  $async.Future<$1.QueryParamsResponse> params_Pre($grpc.ServiceCall call,
      $async.Future<$1.QueryParamsRequest> request) async {
    return params(call, await request);
  }

  $async.Future<$1.QueryTokensResponse> tokens_Pre($grpc.ServiceCall call,
      $async.Future<$1.QueryTokensRequest> request) async {
    return tokens(call, await request);
  }

  $async.Future<$1.QueryTokenResponse> token(
      $grpc.ServiceCall call, $1.QueryTokenRequest request);
  $async.Future<$1.QueryFeesResponse> fees(
      $grpc.ServiceCall call, $1.QueryFeesRequest request);
  $async.Future<$1.QueryParamsResponse> params(
      $grpc.ServiceCall call, $1.QueryParamsRequest request);
  $async.Future<$1.QueryTokensResponse> tokens(
      $grpc.ServiceCall call, $1.QueryTokensRequest request);
}
