///
//  Generated code. Do not modify.
//  source: token/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class MsgIssueToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgIssueToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scale', $pb.PbFieldType.OU3)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'minUnit')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'initialSupply', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxSupply', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mintable')
    ..aOS(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  MsgIssueToken._() : super();
  factory MsgIssueToken({
    $core.String? symbol,
    $core.String? name,
    $core.int? scale,
    $core.String? minUnit,
    $fixnum.Int64? initialSupply,
    $fixnum.Int64? maxSupply,
    $core.bool? mintable,
    $core.String? owner,
  }) {
    final _result = create();
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (name != null) {
      _result.name = name;
    }
    if (scale != null) {
      _result.scale = scale;
    }
    if (minUnit != null) {
      _result.minUnit = minUnit;
    }
    if (initialSupply != null) {
      _result.initialSupply = initialSupply;
    }
    if (maxSupply != null) {
      _result.maxSupply = maxSupply;
    }
    if (mintable != null) {
      _result.mintable = mintable;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    return _result;
  }
  factory MsgIssueToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgIssueToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgIssueToken clone() => MsgIssueToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgIssueToken copyWith(void Function(MsgIssueToken) updates) => super.copyWith((message) => updates(message as MsgIssueToken)) as MsgIssueToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgIssueToken create() => MsgIssueToken._();
  MsgIssueToken createEmptyInstance() => create();
  static $pb.PbList<MsgIssueToken> createRepeated() => $pb.PbList<MsgIssueToken>();
  @$core.pragma('dart2js:noInline')
  static MsgIssueToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgIssueToken>(create);
  static MsgIssueToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get scale => $_getIZ(2);
  @$pb.TagNumber(3)
  set scale($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasScale() => $_has(2);
  @$pb.TagNumber(3)
  void clearScale() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get minUnit => $_getSZ(3);
  @$pb.TagNumber(4)
  set minUnit($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMinUnit() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinUnit() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get initialSupply => $_getI64(4);
  @$pb.TagNumber(5)
  set initialSupply($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasInitialSupply() => $_has(4);
  @$pb.TagNumber(5)
  void clearInitialSupply() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get maxSupply => $_getI64(5);
  @$pb.TagNumber(6)
  set maxSupply($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMaxSupply() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxSupply() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get mintable => $_getBF(6);
  @$pb.TagNumber(7)
  set mintable($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMintable() => $_has(6);
  @$pb.TagNumber(7)
  void clearMintable() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get owner => $_getSZ(7);
  @$pb.TagNumber(8)
  set owner($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOwner() => $_has(7);
  @$pb.TagNumber(8)
  void clearOwner() => clearField(8);
}

class MsgIssueTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgIssueTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgIssueTokenResponse._() : super();
  factory MsgIssueTokenResponse() => create();
  factory MsgIssueTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgIssueTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgIssueTokenResponse clone() => MsgIssueTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgIssueTokenResponse copyWith(void Function(MsgIssueTokenResponse) updates) => super.copyWith((message) => updates(message as MsgIssueTokenResponse)) as MsgIssueTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgIssueTokenResponse create() => MsgIssueTokenResponse._();
  MsgIssueTokenResponse createEmptyInstance() => create();
  static $pb.PbList<MsgIssueTokenResponse> createRepeated() => $pb.PbList<MsgIssueTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgIssueTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgIssueTokenResponse>(create);
  static MsgIssueTokenResponse? _defaultInstance;
}

class MsgMintToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgMintToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  MsgMintToken._() : super();
  factory MsgMintToken({
    $core.String? symbol,
    $core.String? to,
    $fixnum.Int64? amount,
    $core.String? owner,
  }) {
    final _result = create();
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (to != null) {
      _result.to = to;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    return _result;
  }
  factory MsgMintToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgMintToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgMintToken clone() => MsgMintToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgMintToken copyWith(void Function(MsgMintToken) updates) => super.copyWith((message) => updates(message as MsgMintToken)) as MsgMintToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgMintToken create() => MsgMintToken._();
  MsgMintToken createEmptyInstance() => create();
  static $pb.PbList<MsgMintToken> createRepeated() => $pb.PbList<MsgMintToken>();
  @$core.pragma('dart2js:noInline')
  static MsgMintToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgMintToken>(create);
  static MsgMintToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(2)
  set to($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(2)
  void clearTo() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get owner => $_getSZ(3);
  @$pb.TagNumber(4)
  set owner($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOwner() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwner() => clearField(4);
}

class MsgMintTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgMintTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgMintTokenResponse._() : super();
  factory MsgMintTokenResponse() => create();
  factory MsgMintTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgMintTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgMintTokenResponse clone() => MsgMintTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgMintTokenResponse copyWith(void Function(MsgMintTokenResponse) updates) => super.copyWith((message) => updates(message as MsgMintTokenResponse)) as MsgMintTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgMintTokenResponse create() => MsgMintTokenResponse._();
  MsgMintTokenResponse createEmptyInstance() => create();
  static $pb.PbList<MsgMintTokenResponse> createRepeated() => $pb.PbList<MsgMintTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgMintTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgMintTokenResponse>(create);
  static MsgMintTokenResponse? _defaultInstance;
}

class MsgEditToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgEditToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maxSupply', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  MsgEditToken._() : super();
  factory MsgEditToken({
    $core.String? symbol,
    $core.String? name,
    $fixnum.Int64? maxSupply,
    $core.String? owner,
  }) {
    final _result = create();
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (name != null) {
      _result.name = name;
    }
    if (maxSupply != null) {
      _result.maxSupply = maxSupply;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    return _result;
  }
  factory MsgEditToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgEditToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgEditToken clone() => MsgEditToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgEditToken copyWith(void Function(MsgEditToken) updates) => super.copyWith((message) => updates(message as MsgEditToken)) as MsgEditToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgEditToken create() => MsgEditToken._();
  MsgEditToken createEmptyInstance() => create();
  static $pb.PbList<MsgEditToken> createRepeated() => $pb.PbList<MsgEditToken>();
  @$core.pragma('dart2js:noInline')
  static MsgEditToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgEditToken>(create);
  static MsgEditToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get maxSupply => $_getI64(2);
  @$pb.TagNumber(3)
  set maxSupply($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxSupply() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxSupply() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get owner => $_getSZ(3);
  @$pb.TagNumber(4)
  set owner($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOwner() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwner() => clearField(4);
}

class MsgEditTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgEditTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgEditTokenResponse._() : super();
  factory MsgEditTokenResponse() => create();
  factory MsgEditTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgEditTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgEditTokenResponse clone() => MsgEditTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgEditTokenResponse copyWith(void Function(MsgEditTokenResponse) updates) => super.copyWith((message) => updates(message as MsgEditTokenResponse)) as MsgEditTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgEditTokenResponse create() => MsgEditTokenResponse._();
  MsgEditTokenResponse createEmptyInstance() => create();
  static $pb.PbList<MsgEditTokenResponse> createRepeated() => $pb.PbList<MsgEditTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgEditTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgEditTokenResponse>(create);
  static MsgEditTokenResponse? _defaultInstance;
}

class MsgBurnToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgBurnToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  MsgBurnToken._() : super();
  factory MsgBurnToken({
    $core.String? symbol,
    $fixnum.Int64? amount,
    $core.String? owner,
  }) {
    final _result = create();
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    return _result;
  }
  factory MsgBurnToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgBurnToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgBurnToken clone() => MsgBurnToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgBurnToken copyWith(void Function(MsgBurnToken) updates) => super.copyWith((message) => updates(message as MsgBurnToken)) as MsgBurnToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgBurnToken create() => MsgBurnToken._();
  MsgBurnToken createEmptyInstance() => create();
  static $pb.PbList<MsgBurnToken> createRepeated() => $pb.PbList<MsgBurnToken>();
  @$core.pragma('dart2js:noInline')
  static MsgBurnToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgBurnToken>(create);
  static MsgBurnToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get owner => $_getSZ(2);
  @$pb.TagNumber(3)
  set owner($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOwner() => $_has(2);
  @$pb.TagNumber(3)
  void clearOwner() => clearField(3);
}

class MsgBurnTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgBurnTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgBurnTokenResponse._() : super();
  factory MsgBurnTokenResponse() => create();
  factory MsgBurnTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgBurnTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgBurnTokenResponse clone() => MsgBurnTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgBurnTokenResponse copyWith(void Function(MsgBurnTokenResponse) updates) => super.copyWith((message) => updates(message as MsgBurnTokenResponse)) as MsgBurnTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgBurnTokenResponse create() => MsgBurnTokenResponse._();
  MsgBurnTokenResponse createEmptyInstance() => create();
  static $pb.PbList<MsgBurnTokenResponse> createRepeated() => $pb.PbList<MsgBurnTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgBurnTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgBurnTokenResponse>(create);
  static MsgBurnTokenResponse? _defaultInstance;
}

class MsgTransferOwnerToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgTransferOwnerToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'to')
    ..hasRequiredFields = false
  ;

  MsgTransferOwnerToken._() : super();
  factory MsgTransferOwnerToken({
    $core.String? symbol,
    $core.String? owner,
    $core.String? to,
  }) {
    final _result = create();
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (to != null) {
      _result.to = to;
    }
    return _result;
  }
  factory MsgTransferOwnerToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgTransferOwnerToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgTransferOwnerToken clone() => MsgTransferOwnerToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgTransferOwnerToken copyWith(void Function(MsgTransferOwnerToken) updates) => super.copyWith((message) => updates(message as MsgTransferOwnerToken)) as MsgTransferOwnerToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgTransferOwnerToken create() => MsgTransferOwnerToken._();
  MsgTransferOwnerToken createEmptyInstance() => create();
  static $pb.PbList<MsgTransferOwnerToken> createRepeated() => $pb.PbList<MsgTransferOwnerToken>();
  @$core.pragma('dart2js:noInline')
  static MsgTransferOwnerToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgTransferOwnerToken>(create);
  static MsgTransferOwnerToken? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get owner => $_getSZ(1);
  @$pb.TagNumber(2)
  set owner($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOwner() => $_has(1);
  @$pb.TagNumber(2)
  void clearOwner() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get to => $_getSZ(2);
  @$pb.TagNumber(3)
  set to($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(2);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);
}

class MsgTransferOwnerTokenResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MsgTransferOwnerTokenResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.token'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  MsgTransferOwnerTokenResponse._() : super();
  factory MsgTransferOwnerTokenResponse() => create();
  factory MsgTransferOwnerTokenResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgTransferOwnerTokenResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MsgTransferOwnerTokenResponse clone() => MsgTransferOwnerTokenResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MsgTransferOwnerTokenResponse copyWith(void Function(MsgTransferOwnerTokenResponse) updates) => super.copyWith((message) => updates(message as MsgTransferOwnerTokenResponse)) as MsgTransferOwnerTokenResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgTransferOwnerTokenResponse create() => MsgTransferOwnerTokenResponse._();
  MsgTransferOwnerTokenResponse createEmptyInstance() => create();
  static $pb.PbList<MsgTransferOwnerTokenResponse> createRepeated() => $pb.PbList<MsgTransferOwnerTokenResponse>();
  @$core.pragma('dart2js:noInline')
  static MsgTransferOwnerTokenResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgTransferOwnerTokenResponse>(create);
  static MsgTransferOwnerTokenResponse? _defaultInstance;
}

