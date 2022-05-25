///
//  Generated code. Do not modify.
//  source: nft/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'nft.pb.dart' as $63;
import '../cosmos/base/query/v1beta1/pagination.pb.dart' as $2;

class QueryClassRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryClassRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..hasRequiredFields = false
  ;

  QueryClassRequest._() : super();
  factory QueryClassRequest({
    $core.String? classId,
  }) {
    final _result = create();
    if (classId != null) {
      _result.classId = classId;
    }
    return _result;
  }
  factory QueryClassRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryClassRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryClassRequest clone() => QueryClassRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryClassRequest copyWith(void Function(QueryClassRequest) updates) => super.copyWith((message) => updates(message as QueryClassRequest)) as QueryClassRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryClassRequest create() => QueryClassRequest._();
  QueryClassRequest createEmptyInstance() => create();
  static $pb.PbList<QueryClassRequest> createRepeated() => $pb.PbList<QueryClassRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryClassRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryClassRequest>(create);
  static QueryClassRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get classId => $_getSZ(0);
  @$pb.TagNumber(1)
  set classId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClassId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClassId() => clearField(1);
}

class QueryClassResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryClassResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOM<$63.Class>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'class', subBuilder: $63.Class.create)
    ..hasRequiredFields = false
  ;

  QueryClassResponse._() : super();
  factory QueryClassResponse({
    $63.Class? class_1,
  }) {
    final _result = create();
    if (class_1 != null) {
      _result.class_1 = class_1;
    }
    return _result;
  }
  factory QueryClassResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryClassResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryClassResponse clone() => QueryClassResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryClassResponse copyWith(void Function(QueryClassResponse) updates) => super.copyWith((message) => updates(message as QueryClassResponse)) as QueryClassResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryClassResponse create() => QueryClassResponse._();
  QueryClassResponse createEmptyInstance() => create();
  static $pb.PbList<QueryClassResponse> createRepeated() => $pb.PbList<QueryClassResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryClassResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryClassResponse>(create);
  static QueryClassResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $63.Class get class_1 => $_getN(0);
  @$pb.TagNumber(1)
  set class_1($63.Class v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClass_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearClass_1() => clearField(1);
  @$pb.TagNumber(1)
  $63.Class ensureClass_1() => $_ensure(0);
}

class QueryClassesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryClassesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOM<$2.PageRequest>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryClassesRequest._() : super();
  factory QueryClassesRequest({
    $2.PageRequest? pagination,
  }) {
    final _result = create();
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryClassesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryClassesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryClassesRequest clone() => QueryClassesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryClassesRequest copyWith(void Function(QueryClassesRequest) updates) => super.copyWith((message) => updates(message as QueryClassesRequest)) as QueryClassesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryClassesRequest create() => QueryClassesRequest._();
  QueryClassesRequest createEmptyInstance() => create();
  static $pb.PbList<QueryClassesRequest> createRepeated() => $pb.PbList<QueryClassesRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryClassesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryClassesRequest>(create);
  static QueryClassesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $2.PageRequest get pagination => $_getN(0);
  @$pb.TagNumber(1)
  set pagination($2.PageRequest v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPagination() => $_has(0);
  @$pb.TagNumber(1)
  void clearPagination() => clearField(1);
  @$pb.TagNumber(1)
  $2.PageRequest ensurePagination() => $_ensure(0);
}

class QueryClassesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryClassesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..pc<$63.Class>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classes', $pb.PbFieldType.PM, subBuilder: $63.Class.create)
    ..aOM<$2.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryClassesResponse._() : super();
  factory QueryClassesResponse({
    $core.Iterable<$63.Class>? classes,
    $2.PageResponse? pagination,
  }) {
    final _result = create();
    if (classes != null) {
      _result.classes.addAll(classes);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryClassesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryClassesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryClassesResponse clone() => QueryClassesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryClassesResponse copyWith(void Function(QueryClassesResponse) updates) => super.copyWith((message) => updates(message as QueryClassesResponse)) as QueryClassesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryClassesResponse create() => QueryClassesResponse._();
  QueryClassesResponse createEmptyInstance() => create();
  static $pb.PbList<QueryClassesResponse> createRepeated() => $pb.PbList<QueryClassesResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryClassesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryClassesResponse>(create);
  static QueryClassesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$63.Class> get classes => $_getList(0);

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

class QueryNFTRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryNFTRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftId')
    ..hasRequiredFields = false
  ;

  QueryNFTRequest._() : super();
  factory QueryNFTRequest({
    $core.String? classId,
    $core.String? nftId,
  }) {
    final _result = create();
    if (classId != null) {
      _result.classId = classId;
    }
    if (nftId != null) {
      _result.nftId = nftId;
    }
    return _result;
  }
  factory QueryNFTRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryNFTRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryNFTRequest clone() => QueryNFTRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryNFTRequest copyWith(void Function(QueryNFTRequest) updates) => super.copyWith((message) => updates(message as QueryNFTRequest)) as QueryNFTRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryNFTRequest create() => QueryNFTRequest._();
  QueryNFTRequest createEmptyInstance() => create();
  static $pb.PbList<QueryNFTRequest> createRepeated() => $pb.PbList<QueryNFTRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryNFTRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryNFTRequest>(create);
  static QueryNFTRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get classId => $_getSZ(0);
  @$pb.TagNumber(1)
  set classId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClassId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClassId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nftId => $_getSZ(1);
  @$pb.TagNumber(2)
  set nftId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNftId() => $_has(1);
  @$pb.TagNumber(2)
  void clearNftId() => clearField(2);
}

class QueryNFTResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryNFTResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOM<$63.NFT>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nft', subBuilder: $63.NFT.create)
    ..hasRequiredFields = false
  ;

  QueryNFTResponse._() : super();
  factory QueryNFTResponse({
    $63.NFT? nft,
  }) {
    final _result = create();
    if (nft != null) {
      _result.nft = nft;
    }
    return _result;
  }
  factory QueryNFTResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryNFTResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryNFTResponse clone() => QueryNFTResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryNFTResponse copyWith(void Function(QueryNFTResponse) updates) => super.copyWith((message) => updates(message as QueryNFTResponse)) as QueryNFTResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryNFTResponse create() => QueryNFTResponse._();
  QueryNFTResponse createEmptyInstance() => create();
  static $pb.PbList<QueryNFTResponse> createRepeated() => $pb.PbList<QueryNFTResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryNFTResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryNFTResponse>(create);
  static QueryNFTResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $63.NFT get nft => $_getN(0);
  @$pb.TagNumber(1)
  set nft($63.NFT v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNft() => $_has(0);
  @$pb.TagNumber(1)
  void clearNft() => clearField(1);
  @$pb.TagNumber(1)
  $63.NFT ensureNft() => $_ensure(0);
}

class QueryNFTsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryNFTsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOM<$2.PageRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryNFTsRequest._() : super();
  factory QueryNFTsRequest({
    $core.String? classId,
    $core.String? owner,
    $2.PageRequest? pagination,
  }) {
    final _result = create();
    if (classId != null) {
      _result.classId = classId;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryNFTsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryNFTsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryNFTsRequest clone() => QueryNFTsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryNFTsRequest copyWith(void Function(QueryNFTsRequest) updates) => super.copyWith((message) => updates(message as QueryNFTsRequest)) as QueryNFTsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryNFTsRequest create() => QueryNFTsRequest._();
  QueryNFTsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryNFTsRequest> createRepeated() => $pb.PbList<QueryNFTsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryNFTsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryNFTsRequest>(create);
  static QueryNFTsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get classId => $_getSZ(0);
  @$pb.TagNumber(1)
  set classId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClassId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClassId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get owner => $_getSZ(1);
  @$pb.TagNumber(2)
  set owner($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwner() => clearField(2);

  @$pb.TagNumber(3)
  $2.PageRequest get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($2.PageRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $2.PageRequest ensurePagination() => $_ensure(2);
}

class QueryNFTsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryNFTsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..pc<$63.NFT>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nfts', $pb.PbFieldType.PM, subBuilder: $63.NFT.create)
    ..aOM<$2.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryNFTsResponse._() : super();
  factory QueryNFTsResponse({
    $core.Iterable<$63.NFT>? nfts,
    $2.PageResponse? pagination,
  }) {
    final _result = create();
    if (nfts != null) {
      _result.nfts.addAll(nfts);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryNFTsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryNFTsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryNFTsResponse clone() => QueryNFTsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryNFTsResponse copyWith(void Function(QueryNFTsResponse) updates) => super.copyWith((message) => updates(message as QueryNFTsResponse)) as QueryNFTsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryNFTsResponse create() => QueryNFTsResponse._();
  QueryNFTsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryNFTsResponse> createRepeated() => $pb.PbList<QueryNFTsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryNFTsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryNFTsResponse>(create);
  static QueryNFTsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$63.NFT> get nfts => $_getList(0);

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

class QuerySupplyRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QuerySupplyRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..hasRequiredFields = false
  ;

  QuerySupplyRequest._() : super();
  factory QuerySupplyRequest({
    $core.String? classId,
  }) {
    final _result = create();
    if (classId != null) {
      _result.classId = classId;
    }
    return _result;
  }
  factory QuerySupplyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QuerySupplyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QuerySupplyRequest clone() => QuerySupplyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QuerySupplyRequest copyWith(void Function(QuerySupplyRequest) updates) => super.copyWith((message) => updates(message as QuerySupplyRequest)) as QuerySupplyRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QuerySupplyRequest create() => QuerySupplyRequest._();
  QuerySupplyRequest createEmptyInstance() => create();
  static $pb.PbList<QuerySupplyRequest> createRepeated() => $pb.PbList<QuerySupplyRequest>();
  @$core.pragma('dart2js:noInline')
  static QuerySupplyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuerySupplyRequest>(create);
  static QuerySupplyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get classId => $_getSZ(0);
  @$pb.TagNumber(1)
  set classId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClassId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClassId() => clearField(1);
}

class QuerySupplyResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QuerySupplyResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QuerySupplyResponse._() : super();
  factory QuerySupplyResponse({
    $fixnum.Int64? amount,
  }) {
    final _result = create();
    if (amount != null) {
      _result.amount = amount;
    }
    return _result;
  }
  factory QuerySupplyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QuerySupplyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QuerySupplyResponse clone() => QuerySupplyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QuerySupplyResponse copyWith(void Function(QuerySupplyResponse) updates) => super.copyWith((message) => updates(message as QuerySupplyResponse)) as QuerySupplyResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QuerySupplyResponse create() => QuerySupplyResponse._();
  QuerySupplyResponse createEmptyInstance() => create();
  static $pb.PbList<QuerySupplyResponse> createRepeated() => $pb.PbList<QuerySupplyResponse>();
  @$core.pragma('dart2js:noInline')
  static QuerySupplyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuerySupplyResponse>(create);
  static QuerySupplyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(1)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => clearField(1);
}

class QueryOwnerRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryOwnerRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..aOM<$2.PageRequest>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryOwnerRequest._() : super();
  factory QueryOwnerRequest({
    $core.String? classId,
    $core.String? address,
    $2.PageRequest? pagination,
  }) {
    final _result = create();
    if (classId != null) {
      _result.classId = classId;
    }
    if (address != null) {
      _result.address = address;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryOwnerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryOwnerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryOwnerRequest clone() => QueryOwnerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryOwnerRequest copyWith(void Function(QueryOwnerRequest) updates) => super.copyWith((message) => updates(message as QueryOwnerRequest)) as QueryOwnerRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryOwnerRequest create() => QueryOwnerRequest._();
  QueryOwnerRequest createEmptyInstance() => create();
  static $pb.PbList<QueryOwnerRequest> createRepeated() => $pb.PbList<QueryOwnerRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryOwnerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryOwnerRequest>(create);
  static QueryOwnerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get classId => $_getSZ(0);
  @$pb.TagNumber(1)
  set classId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClassId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClassId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $2.PageRequest get pagination => $_getN(2);
  @$pb.TagNumber(3)
  set pagination($2.PageRequest v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPagination() => $_has(2);
  @$pb.TagNumber(3)
  void clearPagination() => clearField(3);
  @$pb.TagNumber(3)
  $2.PageRequest ensurePagination() => $_ensure(2);
}

class QueryOwnerResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryOwnerResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOM<$63.Owner>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner', subBuilder: $63.Owner.create)
    ..aOM<$2.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryOwnerResponse._() : super();
  factory QueryOwnerResponse({
    $63.Owner? owner,
    $2.PageResponse? pagination,
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
  factory QueryOwnerResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryOwnerResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryOwnerResponse clone() => QueryOwnerResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryOwnerResponse copyWith(void Function(QueryOwnerResponse) updates) => super.copyWith((message) => updates(message as QueryOwnerResponse)) as QueryOwnerResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryOwnerResponse create() => QueryOwnerResponse._();
  QueryOwnerResponse createEmptyInstance() => create();
  static $pb.PbList<QueryOwnerResponse> createRepeated() => $pb.PbList<QueryOwnerResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryOwnerResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryOwnerResponse>(create);
  static QueryOwnerResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $63.Owner get owner => $_getN(0);
  @$pb.TagNumber(1)
  set owner($63.Owner v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOwner() => $_has(0);
  @$pb.TagNumber(1)
  void clearOwner() => clearField(1);
  @$pb.TagNumber(1)
  $63.Owner ensureOwner() => $_ensure(0);

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

  $async.Future<QueryClassResponse> class_($pb.ClientContext? ctx, QueryClassRequest request) {
    var emptyResponse = QueryClassResponse();
    return _client.invoke<QueryClassResponse>(ctx, 'Query', 'Class', request, emptyResponse);
  }
  $async.Future<QueryClassesResponse> classes($pb.ClientContext? ctx, QueryClassesRequest request) {
    var emptyResponse = QueryClassesResponse();
    return _client.invoke<QueryClassesResponse>(ctx, 'Query', 'Classes', request, emptyResponse);
  }
  $async.Future<QueryNFTResponse> nFT($pb.ClientContext? ctx, QueryNFTRequest request) {
    var emptyResponse = QueryNFTResponse();
    return _client.invoke<QueryNFTResponse>(ctx, 'Query', 'NFT', request, emptyResponse);
  }
  $async.Future<QueryNFTsResponse> nFTs($pb.ClientContext? ctx, QueryNFTsRequest request) {
    var emptyResponse = QueryNFTsResponse();
    return _client.invoke<QueryNFTsResponse>(ctx, 'Query', 'NFTs', request, emptyResponse);
  }
  $async.Future<QuerySupplyResponse> supply($pb.ClientContext? ctx, QuerySupplyRequest request) {
    var emptyResponse = QuerySupplyResponse();
    return _client.invoke<QuerySupplyResponse>(ctx, 'Query', 'Supply', request, emptyResponse);
  }
  $async.Future<QueryOwnerResponse> owner($pb.ClientContext? ctx, QueryOwnerRequest request) {
    var emptyResponse = QueryOwnerResponse();
    return _client.invoke<QueryOwnerResponse>(ctx, 'Query', 'Owner', request, emptyResponse);
  }
}

