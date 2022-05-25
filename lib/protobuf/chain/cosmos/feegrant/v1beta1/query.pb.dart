///
//  Generated code. Do not modify.
//  source: cosmos/feegrant/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'feegrant.pb.dart' as $31;
import '../../base/query/v1beta1/pagination.pb.dart' as $2;

class QueryAllowanceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllowanceRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'granter')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..hasRequiredFields = false
  ;

  QueryAllowanceRequest._() : super();
  factory QueryAllowanceRequest({
    $core.String? granter,
    $core.String? grantee,
  }) {
    final _result = create();
    if (granter != null) {
      _result.granter = granter;
    }
    if (grantee != null) {
      _result.grantee = grantee;
    }
    return _result;
  }
  factory QueryAllowanceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllowanceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllowanceRequest clone() => QueryAllowanceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllowanceRequest copyWith(void Function(QueryAllowanceRequest) updates) => super.copyWith((message) => updates(message as QueryAllowanceRequest)) as QueryAllowanceRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllowanceRequest create() => QueryAllowanceRequest._();
  QueryAllowanceRequest createEmptyInstance() => create();
  static $pb.PbList<QueryAllowanceRequest> createRepeated() => $pb.PbList<QueryAllowanceRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryAllowanceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllowanceRequest>(create);
  static QueryAllowanceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get granter => $_getSZ(0);
  @$pb.TagNumber(1)
  set granter($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGranter() => $_has(0);
  @$pb.TagNumber(1)
  void clearGranter() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get grantee => $_getSZ(1);
  @$pb.TagNumber(2)
  set grantee($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGrantee() => $_has(1);
  @$pb.TagNumber(2)
  void clearGrantee() => clearField(2);
}

class QueryAllowanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllowanceResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..aOM<$31.Grant>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowance', subBuilder: $31.Grant.create)
    ..hasRequiredFields = false
  ;

  QueryAllowanceResponse._() : super();
  factory QueryAllowanceResponse({
    $31.Grant? allowance,
  }) {
    final _result = create();
    if (allowance != null) {
      _result.allowance = allowance;
    }
    return _result;
  }
  factory QueryAllowanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllowanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllowanceResponse clone() => QueryAllowanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllowanceResponse copyWith(void Function(QueryAllowanceResponse) updates) => super.copyWith((message) => updates(message as QueryAllowanceResponse)) as QueryAllowanceResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllowanceResponse create() => QueryAllowanceResponse._();
  QueryAllowanceResponse createEmptyInstance() => create();
  static $pb.PbList<QueryAllowanceResponse> createRepeated() => $pb.PbList<QueryAllowanceResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryAllowanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllowanceResponse>(create);
  static QueryAllowanceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $31.Grant get allowance => $_getN(0);
  @$pb.TagNumber(1)
  set allowance($31.Grant v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAllowance() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllowance() => clearField(1);
  @$pb.TagNumber(1)
  $31.Grant ensureAllowance() => $_ensure(0);
}

class QueryAllowancesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllowancesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'grantee')
    ..aOM<$2.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryAllowancesRequest._() : super();
  factory QueryAllowancesRequest({
    $core.String? grantee,
    $2.PageRequest? pagination,
  }) {
    final _result = create();
    if (grantee != null) {
      _result.grantee = grantee;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryAllowancesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllowancesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllowancesRequest clone() => QueryAllowancesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllowancesRequest copyWith(void Function(QueryAllowancesRequest) updates) => super.copyWith((message) => updates(message as QueryAllowancesRequest)) as QueryAllowancesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllowancesRequest create() => QueryAllowancesRequest._();
  QueryAllowancesRequest createEmptyInstance() => create();
  static $pb.PbList<QueryAllowancesRequest> createRepeated() => $pb.PbList<QueryAllowancesRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryAllowancesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllowancesRequest>(create);
  static QueryAllowancesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get grantee => $_getSZ(0);
  @$pb.TagNumber(1)
  set grantee($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGrantee() => $_has(0);
  @$pb.TagNumber(1)
  void clearGrantee() => clearField(1);

  @$pb.TagNumber(2)
  $2.PageRequest get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($2.PageRequest v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $2.PageRequest ensurePagination() => $_ensure(1);
}

class QueryAllowancesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryAllowancesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.feegrant.v1beta1'), createEmptyInstance: create)
    ..pc<$31.Grant>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'allowances', $pb.PbFieldType.PM, subBuilder: $31.Grant.create)
    ..aOM<$2.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryAllowancesResponse._() : super();
  factory QueryAllowancesResponse({
    $core.Iterable<$31.Grant>? allowances,
    $2.PageResponse? pagination,
  }) {
    final _result = create();
    if (allowances != null) {
      _result.allowances.addAll(allowances);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryAllowancesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryAllowancesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryAllowancesResponse clone() => QueryAllowancesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryAllowancesResponse copyWith(void Function(QueryAllowancesResponse) updates) => super.copyWith((message) => updates(message as QueryAllowancesResponse)) as QueryAllowancesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryAllowancesResponse create() => QueryAllowancesResponse._();
  QueryAllowancesResponse createEmptyInstance() => create();
  static $pb.PbList<QueryAllowancesResponse> createRepeated() => $pb.PbList<QueryAllowancesResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryAllowancesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryAllowancesResponse>(create);
  static QueryAllowancesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$31.Grant> get allowances => $_getList(0);

  @$pb.TagNumber(2)
  $2.PageResponse get pagination => $_getN(1);
  @$pb.TagNumber(2)
  set pagination($2.PageResponse v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPagination() => $_has(1);
  @$pb.TagNumber(2)
  void clearPagination() => clearField(2);
  @$pb.TagNumber(2)
  $2.PageResponse ensurePagination() => $_ensure(1);
}

class QueryApi {
  $pb.RpcClient _client;
  QueryApi(this._client);

  $async.Future<QueryAllowanceResponse> allowance($pb.ClientContext? ctx, QueryAllowanceRequest request) {
    var emptyResponse = QueryAllowanceResponse();
    return _client.invoke<QueryAllowanceResponse>(ctx, 'Query', 'Allowance', request, emptyResponse);
  }
  $async.Future<QueryAllowancesResponse> allowances($pb.ClientContext? ctx, QueryAllowancesRequest request) {
    var emptyResponse = QueryAllowancesResponse();
    return _client.invoke<QueryAllowancesResponse>(ctx, 'Query', 'Allowances', request, emptyResponse);
  }
}

