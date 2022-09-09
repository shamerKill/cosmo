///
//  Generated code. Do not modify.
//  source: token/token.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'package:alan/proto/cosmos/base/v1beta1/coin.pb.dart' as $2;

class Token extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Token',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'plugchain.token'),
      createEmptyInstance: create)
    ..aOS(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'symbol')
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'name')
    ..a<$core.int>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'scale',
        $pb.PbFieldType.OU3)
    ..aOS(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'minUnit')
    ..a<$fixnum.Int64>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'initialSupply',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'maxSupply',
        $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(
        7,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'mintable')
    ..aOS(
        8,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'owner')
    ..hasRequiredFields = false;

  Token._() : super();
  factory Token({
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
  factory Token.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Token.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Token clone() => Token()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Token copyWith(void Function(Token) updates) =>
      super.copyWith((message) => updates(message as Token))
          as Token; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Token create() => Token._();
  Token createEmptyInstance() => create();
  static $pb.PbList<Token> createRepeated() => $pb.PbList<Token>();
  @$core.pragma('dart2js:noInline')
  static Token getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Token>(create);
  static Token? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get scale => $_getIZ(2);
  @$pb.TagNumber(3)
  set scale($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasScale() => $_has(2);
  @$pb.TagNumber(3)
  void clearScale() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get minUnit => $_getSZ(3);
  @$pb.TagNumber(4)
  set minUnit($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasMinUnit() => $_has(3);
  @$pb.TagNumber(4)
  void clearMinUnit() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get initialSupply => $_getI64(4);
  @$pb.TagNumber(5)
  set initialSupply($fixnum.Int64 v) {
    $_setInt64(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasInitialSupply() => $_has(4);
  @$pb.TagNumber(5)
  void clearInitialSupply() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get maxSupply => $_getI64(5);
  @$pb.TagNumber(6)
  set maxSupply($fixnum.Int64 v) {
    $_setInt64(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMaxSupply() => $_has(5);
  @$pb.TagNumber(6)
  void clearMaxSupply() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get mintable => $_getBF(6);
  @$pb.TagNumber(7)
  set mintable($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasMintable() => $_has(6);
  @$pb.TagNumber(7)
  void clearMintable() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get owner => $_getSZ(7);
  @$pb.TagNumber(8)
  set owner($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasOwner() => $_has(7);
  @$pb.TagNumber(8)
  void clearOwner() => clearField(8);
}

class Params extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'Params',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'plugchain.token'),
      createEmptyInstance: create)
    ..aOM<$2.Coin>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'issueTokenBaseFee',
        subBuilder: $2.Coin.create)
    ..aOS(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'operateTokenFeeRatio')
    ..hasRequiredFields = false;

  Params._() : super();
  factory Params({
    $2.Coin? issueTokenBaseFee,
    $core.String? operateTokenFeeRatio,
  }) {
    final _result = create();
    if (issueTokenBaseFee != null) {
      _result.issueTokenBaseFee = issueTokenBaseFee;
    }
    if (operateTokenFeeRatio != null) {
      _result.operateTokenFeeRatio = operateTokenFeeRatio;
    }
    return _result;
  }
  factory Params.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Params.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Params clone() => Params()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Params copyWith(void Function(Params) updates) =>
      super.copyWith((message) => updates(message as Params))
          as Params; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Params create() => Params._();
  Params createEmptyInstance() => create();
  static $pb.PbList<Params> createRepeated() => $pb.PbList<Params>();
  @$core.pragma('dart2js:noInline')
  static Params getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Params>(create);
  static Params? _defaultInstance;

  @$pb.TagNumber(1)
  $2.Coin get issueTokenBaseFee => $_getN(0);
  @$pb.TagNumber(1)
  set issueTokenBaseFee($2.Coin v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasIssueTokenBaseFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearIssueTokenBaseFee() => clearField(1);
  @$pb.TagNumber(1)
  $2.Coin ensureIssueTokenBaseFee() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get operateTokenFeeRatio => $_getSZ(1);
  @$pb.TagNumber(2)
  set operateTokenFeeRatio($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasOperateTokenFeeRatio() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperateTokenFeeRatio() => clearField(2);
}
