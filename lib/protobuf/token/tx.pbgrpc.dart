///
//  Generated code. Do not modify.
//  source: token/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'tx.pb.dart' as $0;
export 'tx.pb.dart';

class MsgClient extends $grpc.Client {
  static final _$issueToken =
      $grpc.ClientMethod<$0.MsgIssueToken, $0.MsgIssueTokenResponse>(
          '/plugchain.token.Msg/IssueToken',
          ($0.MsgIssueToken value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgIssueTokenResponse.fromBuffer(value));
  static final _$mintToken =
      $grpc.ClientMethod<$0.MsgMintToken, $0.MsgMintTokenResponse>(
          '/plugchain.token.Msg/MintToken',
          ($0.MsgMintToken value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgMintTokenResponse.fromBuffer(value));
  static final _$editToken =
      $grpc.ClientMethod<$0.MsgEditToken, $0.MsgEditTokenResponse>(
          '/plugchain.token.Msg/EditToken',
          ($0.MsgEditToken value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgEditTokenResponse.fromBuffer(value));
  static final _$burnToken =
      $grpc.ClientMethod<$0.MsgBurnToken, $0.MsgBurnTokenResponse>(
          '/plugchain.token.Msg/BurnToken',
          ($0.MsgBurnToken value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MsgBurnTokenResponse.fromBuffer(value));
  static final _$transferOwnerToken = $grpc.ClientMethod<
          $0.MsgTransferOwnerToken, $0.MsgTransferOwnerTokenResponse>(
      '/plugchain.token.Msg/TransferOwnerToken',
      ($0.MsgTransferOwnerToken value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.MsgTransferOwnerTokenResponse.fromBuffer(value));

  MsgClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.MsgIssueTokenResponse> issueToken(
      $0.MsgIssueToken request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$issueToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgMintTokenResponse> mintToken(
      $0.MsgMintToken request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$mintToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgEditTokenResponse> editToken(
      $0.MsgEditToken request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgBurnTokenResponse> burnToken(
      $0.MsgBurnToken request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$burnToken, request, options: options);
  }

  $grpc.ResponseFuture<$0.MsgTransferOwnerTokenResponse> transferOwnerToken(
      $0.MsgTransferOwnerToken request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$transferOwnerToken, request, options: options);
  }
}

abstract class MsgServiceBase extends $grpc.Service {
  $core.String get $name => 'plugchain.token.Msg';

  MsgServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MsgIssueToken, $0.MsgIssueTokenResponse>(
        'IssueToken',
        issueToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MsgIssueToken.fromBuffer(value),
        ($0.MsgIssueTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgMintToken, $0.MsgMintTokenResponse>(
        'MintToken',
        mintToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MsgMintToken.fromBuffer(value),
        ($0.MsgMintTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgEditToken, $0.MsgEditTokenResponse>(
        'EditToken',
        editToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MsgEditToken.fromBuffer(value),
        ($0.MsgEditTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgBurnToken, $0.MsgBurnTokenResponse>(
        'BurnToken',
        burnToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MsgBurnToken.fromBuffer(value),
        ($0.MsgBurnTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MsgTransferOwnerToken,
            $0.MsgTransferOwnerTokenResponse>(
        'TransferOwnerToken',
        transferOwnerToken_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MsgTransferOwnerToken.fromBuffer(value),
        ($0.MsgTransferOwnerTokenResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.MsgIssueTokenResponse> issueToken_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgIssueToken> request) async {
    return issueToken(call, await request);
  }

  $async.Future<$0.MsgMintTokenResponse> mintToken_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgMintToken> request) async {
    return mintToken(call, await request);
  }

  $async.Future<$0.MsgEditTokenResponse> editToken_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgEditToken> request) async {
    return editToken(call, await request);
  }

  $async.Future<$0.MsgBurnTokenResponse> burnToken_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MsgBurnToken> request) async {
    return burnToken(call, await request);
  }

  $async.Future<$0.MsgTransferOwnerTokenResponse> transferOwnerToken_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.MsgTransferOwnerToken> request) async {
    return transferOwnerToken(call, await request);
  }

  $async.Future<$0.MsgIssueTokenResponse> issueToken(
      $grpc.ServiceCall call, $0.MsgIssueToken request);
  $async.Future<$0.MsgMintTokenResponse> mintToken(
      $grpc.ServiceCall call, $0.MsgMintToken request);
  $async.Future<$0.MsgEditTokenResponse> editToken(
      $grpc.ServiceCall call, $0.MsgEditToken request);
  $async.Future<$0.MsgBurnTokenResponse> burnToken(
      $grpc.ServiceCall call, $0.MsgBurnToken request);
  $async.Future<$0.MsgTransferOwnerTokenResponse> transferOwnerToken(
      $grpc.ServiceCall call, $0.MsgTransferOwnerToken request);
}
