///
//  Generated code. Do not modify.
//  source: token/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:alan/proto/google/protobuf/any.pb.dart' as $3;
import 'token.pb.dart' as $4;
import 'package:alan/proto/cosmos/base/query/v1beta1/pagination.pb.dart' as $5;
import 'package:alan/proto/cosmos/base/v1beta1/coin.pb.dart' as $2;

class QueryTokenRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTokenRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'denom')
    ..hasRequiredFields = false
  ;

  QueryTokenRequest._() : super();
  factory QueryTokenRequest({
    $core.String? denom,
  }) {
    final _result = create();
    if (denom != null) {
      _result.denom = denom;
    }
    return _result;
  }
  factory QueryTokenRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTokenRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTokenRequest clone() => QueryTokenRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTokenRequest copyWith(void Function(QueryTokenRequest) updates) => super.copyWith((message) => updates(message as QueryTokenRequest)) as QueryTokenRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTokenRequest create() => QueryTokenRequest._();
  QueryTokenRequest createEmptyInstance() => create();
  static $pb.PbList<QueryTokenRequest> createRepeated() => $pb.PbList<QueryTokenRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryTokenRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTokenRequest>(create);
  static QueryTokenRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get denom => $_getSZ(0);
  @$pb.TagNumber(1)
  set denom($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDenom() => $_has(0);
  @$pb.TagNumber(1)
  void clearDenom() => clearField(1);
}

class QueryTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOM<$3.Any>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Token', protoName: 'Token', subBuilder: $3.Any.create)
    ..hasRequiredFields = false
  ;

  QueryTokenResponse._() : super();
  factory QueryTokenResponse({
    $3.Any? token,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    return _result;
  }
  factory QueryTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTokenResponse clone() => QueryTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTokenResponse copyWith(void Function(QueryTokenResponse) updates) => super.copyWith((message) => updates(message as QueryTokenResponse)) as QueryTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTokenResponse create() => QueryTokenResponse._();
  QueryTokenResponse createEmptyInstance() => create();
  static $pb.PbList<QueryTokenResponse> createRepeated() => $pb.PbList<QueryTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTokenResponse>(create);
  static QueryTokenResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Any get token => $_getN(0);
  @$pb.TagNumber(1)
  set token($3.Any v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
  @$pb.TagNumber(1)
  $3.Any ensureToken() => $_ensure(0);
}

class QueryParamsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  QueryParamsRequest._() : super();
  factory QueryParamsRequest() => create();
  factory QueryParamsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsRequest clone() => QueryParamsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsRequest copyWith(void Function(QueryParamsRequest) updates) => super.copyWith((message) => updates(message as QueryParamsRequest)) as QueryParamsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest create() => QueryParamsRequest._();
  QueryParamsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryParamsRequest> createRepeated() => $pb.PbList<QueryParamsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsRequest>(create);
  static QueryParamsRequest? _defaultInstance;
}

class QueryParamsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOM<$4.Params>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'params', subBuilder: $4.Params.create)
    ..aOM<$5.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'res', subBuilder: $5.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryParamsResponse._() : super();
  factory QueryParamsResponse({
    $4.Params? params,
    $5.PageResponse? res,
  }) {
    final _result = create();
    if (params != null) {
      _result.params = params;
    }
    if (res != null) {
      _result.res = res;
    }
    return _result;
  }
  factory QueryParamsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryParamsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryParamsResponse clone() => QueryParamsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryParamsResponse copyWith(void Function(QueryParamsResponse) updates) => super.copyWith((message) => updates(message as QueryParamsResponse)) as QueryParamsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse create() => QueryParamsResponse._();
  QueryParamsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryParamsResponse> createRepeated() => $pb.PbList<QueryParamsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryParamsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryParamsResponse>(create);
  static QueryParamsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $4.Params get params => $_getN(0);
  @$pb.TagNumber(1)
  set params($4.Params v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => clearField(1);
  @$pb.TagNumber(1)
  $4.Params ensureParams() => $_ensure(0);

  @$pb.TagNumber(2)
  $5.PageResponse get res => $_getN(1);
  @$pb.TagNumber(2)
  set res($5.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasRes() => $_has(1);
  @$pb.TagNumber(2)
  void clearRes() => clearField(2);
  @$pb.TagNumber(2)
  $5.PageResponse ensureRes() => $_ensure(1);
}

class QueryTokensRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTokensRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOM<$5.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $5.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryTokensRequest._() : super();
  factory QueryTokensRequest({
    $core.String? owner,
    $5.PageRequest? pagination,
  }) {
    final _result = create();
    if (owner != null) {
      _result.owner = owner;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryTokensRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTokensRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTokensRequest clone() => QueryTokensRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTokensRequest copyWith(void Function(QueryTokensRequest) updates) => super.copyWith((message) => updates(message as QueryTokensRequest)) as QueryTokensRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTokensRequest create() => QueryTokensRequest._();
  QueryTokensRequest createEmptyInstance() => create();
  static $pb.PbList<QueryTokensRequest> createRepeated() => $pb.PbList<QueryTokensRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryTokensRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTokensRequest>(create);
  static QueryTokensRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get owner => $_getSZ(0);
  @$pb.TagNumber(1)
  set owner($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwner() => clearField(1);

  @$pb.TagNumber(2)
  $5.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($5.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $5.PageRequest ensurePagination() => $_ensure(1);
}

class QueryTokensResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTokensResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..pc<$3.Any>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Tokens', $pb.PbFieldType.PM, protoName: 'Tokens', subBuilder: $3.Any.create)
    ..aOM<$5.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $5.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryTokensResponse._() : super();
  factory QueryTokensResponse({
    $core.Iterable<$3.Any>? tokens,
    $5.PageResponse? pagination,
  }) {
    final _result = create();
    if (tokens != null) {
      _result.tokens.addAll(tokens);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryTokensResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTokensResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTokensResponse clone() => QueryTokensResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTokensResponse copyWith(void Function(QueryTokensResponse) updates) => super.copyWith((message) => updates(message as QueryTokensResponse)) as QueryTokensResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTokensResponse create() => QueryTokensResponse._();
  QueryTokensResponse createEmptyInstance() => create();
  static $pb.PbList<QueryTokensResponse> createRepeated() => $pb.PbList<QueryTokensResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryTokensResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTokensResponse>(create);
  static QueryTokensResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$3.Any> get tokens => $_getList(0);

  @$pb.TagNumber(2)
  $5.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($5.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $5.PageResponse ensurePagination() => $_ensure(1);
}

class QueryFeesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryFeesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..hasRequiredFields = false
  ;

  QueryFeesRequest._() : super();
  factory QueryFeesRequest({
    $core.String? symbol,
  }) {
    final _result = create();
    if (symbol != null) {
      _result.symbol = symbol;
    }
    return _result;
  }
  factory QueryFeesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryFeesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryFeesRequest clone() => QueryFeesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryFeesRequest copyWith(void Function(QueryFeesRequest) updates) => super.copyWith((message) => updates(message as QueryFeesRequest)) as QueryFeesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryFeesRequest create() => QueryFeesRequest._();
  QueryFeesRequest createEmptyInstance() => create();
  static $pb.PbList<QueryFeesRequest> createRepeated() => $pb.PbList<QueryFeesRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryFeesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryFeesRequest>(create);
  static QueryFeesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);
}

class QueryFeesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryFeesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'exist')
    ..aOM<$2.Coin>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'issueFee', subBuilder: $2.Coin.create)
    ..aOM<$2.Coin>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'operateFee', subBuilder: $2.Coin.create)
    ..hasRequiredFields = false
  ;

  QueryFeesResponse._() : super();
  factory QueryFeesResponse({
    $core.bool? exist,
    $2.Coin? issueFee,
    $2.Coin? operateFee,
  }) {
    final _result = create();
    if (exist != null) {
      _result.exist = exist;
    }
    if (issueFee != null) {
      _result.issueFee = issueFee;
    }
    if (operateFee != null) {
      _result.operateFee = operateFee;
    }
    return _result;
  }
  factory QueryFeesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryFeesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryFeesResponse clone() => QueryFeesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryFeesResponse copyWith(void Function(QueryFeesResponse) updates) => super.copyWith((message) => updates(message as QueryFeesResponse)) as QueryFeesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryFeesResponse create() => QueryFeesResponse._();
  QueryFeesResponse createEmptyInstance() => create();
  static $pb.PbList<QueryFeesResponse> createRepeated() => $pb.PbList<QueryFeesResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryFeesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryFeesResponse>(create);
  static QueryFeesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get exist => $_getBF(0);
  @$pb.TagNumber(1)
  set exist($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExist() => $_has(0);
  @$pb.TagNumber(1)
  void clearExist() => clearField(1);

  @$pb.TagNumber(2)
  $2.Coin get issueFee => $_getN(1);
  @$pb.TagNumber(2)
  set issueFee($2.Coin v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasIssueFee() => $_has(1);
  @$pb.TagNumber(2)
  void clearIssueFee() => clearField(2);
  @$pb.TagNumber(2)
  $2.Coin ensureIssueFee() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.Coin get operateFee => $_getN(2);
  @$pb.TagNumber(3)
  set operateFee($2.Coin v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasOperateFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearOperateFee() => clearField(3);
  @$pb.TagNumber(3)
  $2.Coin ensureOperateFee() => $_ensure(2);
}

