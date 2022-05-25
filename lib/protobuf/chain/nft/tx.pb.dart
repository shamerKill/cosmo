///
//  Generated code. Do not modify.
//  source: nft/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MsgIssueClass extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgIssueClass', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schema')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mintRestricted')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'editRestricted')
    ..hasRequiredFields = false
  ;

  MsgIssueClass._() : super();
  factory MsgIssueClass({
    $core.String? id,
    $core.String? name,
    $core.String? schema,
    $core.String? owner,
    $core.String? symbol,
    $core.bool? mintRestricted,
    $core.bool? editRestricted,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (schema != null) {
      _result.schema = schema;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (mintRestricted != null) {
      _result.mintRestricted = mintRestricted;
    }
    if (editRestricted != null) {
      _result.editRestricted = editRestricted;
    }
    return _result;
  }
  factory MsgIssueClass.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgIssueClass.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgIssueClass clone() => MsgIssueClass()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgIssueClass copyWith(void Function(MsgIssueClass) updates) => super.copyWith((message) => updates(message as MsgIssueClass)) as MsgIssueClass; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgIssueClass create() => MsgIssueClass._();
  MsgIssueClass createEmptyInstance() => create();
  static $pb.PbList<MsgIssueClass> createRepeated() => $pb.PbList<MsgIssueClass>();
  @$core.pragma('dart2js:noInline')
  static MsgIssueClass getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgIssueClass>(create);
  static MsgIssueClass? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get schema => $_getSZ(2);
  @$pb.TagNumber(3)
  set schema($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSchema() => $_has(2);
  @$pb.TagNumber(3)
  void clearSchema() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get owner => $_getSZ(3);
  @$pb.TagNumber(4)
  set owner($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOwner() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwner() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get symbol => $_getSZ(4);
  @$pb.TagNumber(5)
  set symbol($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSymbol() => $_has(4);
  @$pb.TagNumber(5)
  void clearSymbol() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get mintRestricted => $_getBF(5);
  @$pb.TagNumber(6)
  set mintRestricted($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMintRestricted() => $_has(5);
  @$pb.TagNumber(6)
  void clearMintRestricted() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get editRestricted => $_getBF(6);
  @$pb.TagNumber(7)
  set editRestricted($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEditRestricted() => $_has(6);
  @$pb.TagNumber(7)
  void clearEditRestricted() => clearField(7);
}

class MsgIssueClassResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgIssueClassResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgIssueClassResponse._() : super();
  factory MsgIssueClassResponse() => create();
  factory MsgIssueClassResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgIssueClassResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgIssueClassResponse clone() => MsgIssueClassResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgIssueClassResponse copyWith(void Function(MsgIssueClassResponse) updates) => super.copyWith((message) => updates(message as MsgIssueClassResponse)) as MsgIssueClassResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgIssueClassResponse create() => MsgIssueClassResponse._();
  MsgIssueClassResponse createEmptyInstance() => create();
  static $pb.PbList<MsgIssueClassResponse> createRepeated() => $pb.PbList<MsgIssueClassResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgIssueClassResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgIssueClassResponse>(create);
  static MsgIssueClassResponse? _defaultInstance;
}

class MsgIssueNFT extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgIssueNFT', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uri')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recipient')
    ..hasRequiredFields = false
  ;

  MsgIssueNFT._() : super();
  factory MsgIssueNFT({
    $core.String? id,
    $core.String? classId,
    $core.String? name,
    $core.String? uri,
    $core.String? data,
    $core.String? owner,
    $core.String? recipient,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (classId != null) {
      _result.classId = classId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uri != null) {
      _result.uri = uri;
    }
    if (data != null) {
      _result.data = data;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (recipient != null) {
      _result.recipient = recipient;
    }
    return _result;
  }
  factory MsgIssueNFT.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgIssueNFT.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgIssueNFT clone() => MsgIssueNFT()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgIssueNFT copyWith(void Function(MsgIssueNFT) updates) => super.copyWith((message) => updates(message as MsgIssueNFT)) as MsgIssueNFT; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgIssueNFT create() => MsgIssueNFT._();
  MsgIssueNFT createEmptyInstance() => create();
  static $pb.PbList<MsgIssueNFT> createRepeated() => $pb.PbList<MsgIssueNFT>();
  @$core.pragma('dart2js:noInline')
  static MsgIssueNFT getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgIssueNFT>(create);
  static MsgIssueNFT? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get classId => $_getSZ(1);
  @$pb.TagNumber(2)
  set classId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClassId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uri => $_getSZ(3);
  @$pb.TagNumber(4)
  set uri($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUri() => $_has(3);
  @$pb.TagNumber(4)
  void clearUri() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get data => $_getSZ(4);
  @$pb.TagNumber(5)
  set data($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get owner => $_getSZ(5);
  @$pb.TagNumber(6)
  set owner($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOwner() => $_has(5);
  @$pb.TagNumber(6)
  void clearOwner() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get recipient => $_getSZ(6);
  @$pb.TagNumber(7)
  set recipient($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRecipient() => $_has(6);
  @$pb.TagNumber(7)
  void clearRecipient() => clearField(7);
}

class MsgIssueNFTResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgIssueNFTResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgIssueNFTResponse._() : super();
  factory MsgIssueNFTResponse() => create();
  factory MsgIssueNFTResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgIssueNFTResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgIssueNFTResponse clone() => MsgIssueNFTResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgIssueNFTResponse copyWith(void Function(MsgIssueNFTResponse) updates) => super.copyWith((message) => updates(message as MsgIssueNFTResponse)) as MsgIssueNFTResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgIssueNFTResponse create() => MsgIssueNFTResponse._();
  MsgIssueNFTResponse createEmptyInstance() => create();
  static $pb.PbList<MsgIssueNFTResponse> createRepeated() => $pb.PbList<MsgIssueNFTResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgIssueNFTResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgIssueNFTResponse>(create);
  static MsgIssueNFTResponse? _defaultInstance;
}

class MsgEditNFT extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgEditNFT', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uri')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  MsgEditNFT._() : super();
  factory MsgEditNFT({
    $core.String? id,
    $core.String? classId,
    $core.String? name,
    $core.String? uri,
    $core.String? data,
    $core.String? owner,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (classId != null) {
      _result.classId = classId;
    }
    if (name != null) {
      _result.name = name;
    }
    if (uri != null) {
      _result.uri = uri;
    }
    if (data != null) {
      _result.data = data;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    return _result;
  }
  factory MsgEditNFT.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgEditNFT.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgEditNFT clone() => MsgEditNFT()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgEditNFT copyWith(void Function(MsgEditNFT) updates) => super.copyWith((message) => updates(message as MsgEditNFT)) as MsgEditNFT; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgEditNFT create() => MsgEditNFT._();
  MsgEditNFT createEmptyInstance() => create();
  static $pb.PbList<MsgEditNFT> createRepeated() => $pb.PbList<MsgEditNFT>();
  @$core.pragma('dart2js:noInline')
  static MsgEditNFT getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgEditNFT>(create);
  static MsgEditNFT? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get classId => $_getSZ(1);
  @$pb.TagNumber(2)
  set classId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClassId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get uri => $_getSZ(3);
  @$pb.TagNumber(4)
  set uri($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUri() => $_has(3);
  @$pb.TagNumber(4)
  void clearUri() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get data => $_getSZ(4);
  @$pb.TagNumber(5)
  set data($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasData() => $_has(4);
  @$pb.TagNumber(5)
  void clearData() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get owner => $_getSZ(5);
  @$pb.TagNumber(6)
  set owner($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOwner() => $_has(5);
  @$pb.TagNumber(6)
  void clearOwner() => clearField(6);
}

class MsgEditNFTResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgEditNFTResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgEditNFTResponse._() : super();
  factory MsgEditNFTResponse() => create();
  factory MsgEditNFTResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgEditNFTResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgEditNFTResponse clone() => MsgEditNFTResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgEditNFTResponse copyWith(void Function(MsgEditNFTResponse) updates) => super.copyWith((message) => updates(message as MsgEditNFTResponse)) as MsgEditNFTResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgEditNFTResponse create() => MsgEditNFTResponse._();
  MsgEditNFTResponse createEmptyInstance() => create();
  static $pb.PbList<MsgEditNFTResponse> createRepeated() => $pb.PbList<MsgEditNFTResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgEditNFTResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgEditNFTResponse>(create);
  static MsgEditNFTResponse? _defaultInstance;
}

class MsgBurnNFT extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgBurnNFT', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  MsgBurnNFT._() : super();
  factory MsgBurnNFT({
    $core.String? id,
    $core.String? classId,
    $core.String? owner,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (classId != null) {
      _result.classId = classId;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    return _result;
  }
  factory MsgBurnNFT.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgBurnNFT.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgBurnNFT clone() => MsgBurnNFT()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgBurnNFT copyWith(void Function(MsgBurnNFT) updates) => super.copyWith((message) => updates(message as MsgBurnNFT)) as MsgBurnNFT; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgBurnNFT create() => MsgBurnNFT._();
  MsgBurnNFT createEmptyInstance() => create();
  static $pb.PbList<MsgBurnNFT> createRepeated() => $pb.PbList<MsgBurnNFT>();
  @$core.pragma('dart2js:noInline')
  static MsgBurnNFT getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgBurnNFT>(create);
  static MsgBurnNFT? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get classId => $_getSZ(1);
  @$pb.TagNumber(2)
  set classId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClassId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get owner => $_getSZ(2);
  @$pb.TagNumber(3)
  set owner($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOwner() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwner() => clearField(3);
}

class MsgBurnNFTResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgBurnNFTResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgBurnNFTResponse._() : super();
  factory MsgBurnNFTResponse() => create();
  factory MsgBurnNFTResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgBurnNFTResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgBurnNFTResponse clone() => MsgBurnNFTResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgBurnNFTResponse copyWith(void Function(MsgBurnNFTResponse) updates) => super.copyWith((message) => updates(message as MsgBurnNFTResponse)) as MsgBurnNFTResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgBurnNFTResponse create() => MsgBurnNFTResponse._();
  MsgBurnNFTResponse createEmptyInstance() => create();
  static $pb.PbList<MsgBurnNFTResponse> createRepeated() => $pb.PbList<MsgBurnNFTResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgBurnNFTResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgBurnNFTResponse>(create);
  static MsgBurnNFTResponse? _defaultInstance;
}

class MsgTransferNFT extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgTransferNFT', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'classId')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recipient')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  MsgTransferNFT._() : super();
  factory MsgTransferNFT({
    $core.String? id,
    $core.String? classId,
    $core.String? recipient,
    $core.String? owner,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (classId != null) {
      _result.classId = classId;
    }
    if (recipient != null) {
      _result.recipient = recipient;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    return _result;
  }
  factory MsgTransferNFT.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgTransferNFT.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgTransferNFT clone() => MsgTransferNFT()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgTransferNFT copyWith(void Function(MsgTransferNFT) updates) => super.copyWith((message) => updates(message as MsgTransferNFT)) as MsgTransferNFT; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgTransferNFT create() => MsgTransferNFT._();
  MsgTransferNFT createEmptyInstance() => create();
  static $pb.PbList<MsgTransferNFT> createRepeated() => $pb.PbList<MsgTransferNFT>();
  @$core.pragma('dart2js:noInline')
  static MsgTransferNFT getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgTransferNFT>(create);
  static MsgTransferNFT? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get classId => $_getSZ(1);
  @$pb.TagNumber(2)
  set classId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasClassId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClassId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get recipient => $_getSZ(2);
  @$pb.TagNumber(3)
  set recipient($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRecipient() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecipient() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get owner => $_getSZ(3);
  @$pb.TagNumber(4)
  set owner($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOwner() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwner() => clearField(4);
}

class MsgTransferNFTResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgTransferNFTResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgTransferNFTResponse._() : super();
  factory MsgTransferNFTResponse() => create();
  factory MsgTransferNFTResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgTransferNFTResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgTransferNFTResponse clone() => MsgTransferNFTResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgTransferNFTResponse copyWith(void Function(MsgTransferNFTResponse) updates) => super.copyWith((message) => updates(message as MsgTransferNFTResponse)) as MsgTransferNFTResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgTransferNFTResponse create() => MsgTransferNFTResponse._();
  MsgTransferNFTResponse createEmptyInstance() => create();
  static $pb.PbList<MsgTransferNFTResponse> createRepeated() => $pb.PbList<MsgTransferNFTResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgTransferNFTResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgTransferNFTResponse>(create);
  static MsgTransferNFTResponse? _defaultInstance;
}

class MsgTransferClass extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgTransferClass', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'recipient')
    ..hasRequiredFields = false
  ;

  MsgTransferClass._() : super();
  factory MsgTransferClass({
    $core.String? id,
    $core.String? owner,
    $core.String? recipient,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (recipient != null) {
      _result.recipient = recipient;
    }
    return _result;
  }
  factory MsgTransferClass.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgTransferClass.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgTransferClass clone() => MsgTransferClass()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgTransferClass copyWith(void Function(MsgTransferClass) updates) => super.copyWith((message) => updates(message as MsgTransferClass)) as MsgTransferClass; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgTransferClass create() => MsgTransferClass._();
  MsgTransferClass createEmptyInstance() => create();
  static $pb.PbList<MsgTransferClass> createRepeated() => $pb.PbList<MsgTransferClass>();
  @$core.pragma('dart2js:noInline')
  static MsgTransferClass getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgTransferClass>(create);
  static MsgTransferClass? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get owner => $_getSZ(1);
  @$pb.TagNumber(2)
  set owner($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwner() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get recipient => $_getSZ(2);
  @$pb.TagNumber(3)
  set recipient($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRecipient() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecipient() => clearField(3);
}

class MsgTransferClassResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgTransferClassResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgTransferClassResponse._() : super();
  factory MsgTransferClassResponse() => create();
  factory MsgTransferClassResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgTransferClassResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgTransferClassResponse clone() => MsgTransferClassResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgTransferClassResponse copyWith(void Function(MsgTransferClassResponse) updates) => super.copyWith((message) => updates(message as MsgTransferClassResponse)) as MsgTransferClassResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgTransferClassResponse create() => MsgTransferClassResponse._();
  MsgTransferClassResponse createEmptyInstance() => create();
  static $pb.PbList<MsgTransferClassResponse> createRepeated() => $pb.PbList<MsgTransferClassResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgTransferClassResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgTransferClassResponse>(create);
  static MsgTransferClassResponse? _defaultInstance;
}

class MsgApi {
  $pb.RpcClient _client;
  MsgApi(this._client);

  $async.Future<MsgIssueClassResponse> issueClass($pb.ClientContext? ctx, MsgIssueClass request) {
    var emptyResponse = MsgIssueClassResponse();
    return _client.invoke<MsgIssueClassResponse>(ctx, 'Msg', 'IssueClass', request, emptyResponse);
  }
  $async.Future<MsgIssueNFTResponse> issueNFT($pb.ClientContext? ctx, MsgIssueNFT request) {
    var emptyResponse = MsgIssueNFTResponse();
    return _client.invoke<MsgIssueNFTResponse>(ctx, 'Msg', 'IssueNFT', request, emptyResponse);
  }
  $async.Future<MsgEditNFTResponse> editNFT($pb.ClientContext? ctx, MsgEditNFT request) {
    var emptyResponse = MsgEditNFTResponse();
    return _client.invoke<MsgEditNFTResponse>(ctx, 'Msg', 'EditNFT', request, emptyResponse);
  }
  $async.Future<MsgBurnNFTResponse> burnNFT($pb.ClientContext? ctx, MsgBurnNFT request) {
    var emptyResponse = MsgBurnNFTResponse();
    return _client.invoke<MsgBurnNFTResponse>(ctx, 'Msg', 'BurnNFT', request, emptyResponse);
  }
  $async.Future<MsgTransferNFTResponse> transferNFT($pb.ClientContext? ctx, MsgTransferNFT request) {
    var emptyResponse = MsgTransferNFTResponse();
    return _client.invoke<MsgTransferNFTResponse>(ctx, 'Msg', 'TransferNFT', request, emptyResponse);
  }
  $async.Future<MsgTransferClassResponse> transferClass($pb.ClientContext? ctx, MsgTransferClass request) {
    var emptyResponse = MsgTransferClassResponse();
    return _client.invoke<MsgTransferClassResponse>(ctx, 'Msg', 'TransferClass', request, emptyResponse);
  }
}

