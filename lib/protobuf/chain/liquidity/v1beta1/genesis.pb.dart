///
//  Generated code. Do not modify.
//  source: tendermint/liquidity/v1beta1/genesis.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'liquidity.pb.dart' as $3;

class PoolRecord extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'PoolRecord',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'tendermint.liquidity.v1beta1'),
      createEmptyInstance: create)
    ..aOM<$3.Pool>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'pool',
        subBuilder: $3.Pool.create)
    ..aOM<$3.PoolMetadata>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolMetadata',
        subBuilder: $3.PoolMetadata.create)
    ..aOM<$3.PoolBatch>(
        3,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolBatch',
        subBuilder: $3.PoolBatch.create)
    ..pc<$3.DepositMsgState>(
        4,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'depositMsgStates',
        $pb.PbFieldType.PM,
        subBuilder: $3.DepositMsgState.create)
    ..pc<$3.WithdrawMsgState>(
        5,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'withdrawMsgStates',
        $pb.PbFieldType.PM,
        subBuilder: $3.WithdrawMsgState.create)
    ..pc<$3.SwapMsgState>(
        6,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'swapMsgStates',
        $pb.PbFieldType.PM,
        subBuilder: $3.SwapMsgState.create)
    ..hasRequiredFields = false;

  PoolRecord._() : super();
  factory PoolRecord({
    $3.Pool? pool,
    $3.PoolMetadata? poolMetadata,
    $3.PoolBatch? poolBatch,
    $core.Iterable<$3.DepositMsgState>? depositMsgStates,
    $core.Iterable<$3.WithdrawMsgState>? withdrawMsgStates,
    $core.Iterable<$3.SwapMsgState>? swapMsgStates,
  }) {
    final _result = create();
    if (pool != null) {
      _result.pool = pool;
    }
    if (poolMetadata != null) {
      _result.poolMetadata = poolMetadata;
    }
    if (poolBatch != null) {
      _result.poolBatch = poolBatch;
    }
    if (depositMsgStates != null) {
      _result.depositMsgStates.addAll(depositMsgStates);
    }
    if (withdrawMsgStates != null) {
      _result.withdrawMsgStates.addAll(withdrawMsgStates);
    }
    if (swapMsgStates != null) {
      _result.swapMsgStates.addAll(swapMsgStates);
    }
    return _result;
  }
  factory PoolRecord.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory PoolRecord.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  PoolRecord clone() => PoolRecord()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  PoolRecord copyWith(void Function(PoolRecord) updates) =>
      super.copyWith((message) => updates(message as PoolRecord))
          as PoolRecord; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PoolRecord create() => PoolRecord._();
  PoolRecord createEmptyInstance() => create();
  static $pb.PbList<PoolRecord> createRepeated() => $pb.PbList<PoolRecord>();
  @$core.pragma('dart2js:noInline')
  static PoolRecord getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PoolRecord>(create);
  static PoolRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Pool get pool => $_getN(0);
  @$pb.TagNumber(1)
  set pool($3.Pool v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPool() => $_has(0);
  @$pb.TagNumber(1)
  void clearPool() => clearField(1);
  @$pb.TagNumber(1)
  $3.Pool ensurePool() => $_ensure(0);

  @$pb.TagNumber(2)
  $3.PoolMetadata get poolMetadata => $_getN(1);
  @$pb.TagNumber(2)
  set poolMetadata($3.PoolMetadata v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPoolMetadata() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoolMetadata() => clearField(2);
  @$pb.TagNumber(2)
  $3.PoolMetadata ensurePoolMetadata() => $_ensure(1);

  @$pb.TagNumber(3)
  $3.PoolBatch get poolBatch => $_getN(2);
  @$pb.TagNumber(3)
  set poolBatch($3.PoolBatch v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPoolBatch() => $_has(2);
  @$pb.TagNumber(3)
  void clearPoolBatch() => clearField(3);
  @$pb.TagNumber(3)
  $3.PoolBatch ensurePoolBatch() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$3.DepositMsgState> get depositMsgStates => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$3.WithdrawMsgState> get withdrawMsgStates => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$3.SwapMsgState> get swapMsgStates => $_getList(5);
}

class GenesisState extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      const $core.bool.fromEnvironment('protobuf.omit_message_names')
          ? ''
          : 'GenesisState',
      package: const $pb.PackageName(
          const $core.bool.fromEnvironment('protobuf.omit_message_names')
              ? ''
              : 'tendermint.liquidity.v1beta1'),
      createEmptyInstance: create)
    ..aOM<$3.Params>(
        1,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'params',
        subBuilder: $3.Params.create)
    ..pc<PoolRecord>(
        2,
        const $core.bool.fromEnvironment('protobuf.omit_field_names')
            ? ''
            : 'poolRecords',
        $pb.PbFieldType.PM,
        subBuilder: PoolRecord.create)
    ..hasRequiredFields = false;

  GenesisState._() : super();
  factory GenesisState({
    $3.Params? params,
    $core.Iterable<PoolRecord>? poolRecords,
  }) {
    final _result = create();
    if (params != null) {
      _result.params = params;
    }
    if (poolRecords != null) {
      _result.poolRecords.addAll(poolRecords);
    }
    return _result;
  }
  factory GenesisState.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GenesisState.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GenesisState clone() => GenesisState()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GenesisState copyWith(void Function(GenesisState) updates) =>
      super.copyWith((message) => updates(message as GenesisState))
          as GenesisState; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenesisState create() => GenesisState._();
  GenesisState createEmptyInstance() => create();
  static $pb.PbList<GenesisState> createRepeated() =>
      $pb.PbList<GenesisState>();
  @$core.pragma('dart2js:noInline')
  static GenesisState getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenesisState>(create);
  static GenesisState? _defaultInstance;

  @$pb.TagNumber(1)
  $3.Params get params => $_getN(0);
  @$pb.TagNumber(1)
  set params($3.Params v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearParams() => clearField(1);
  @$pb.TagNumber(1)
  $3.Params ensureParams() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<PoolRecord> get poolRecords => $_getList(1);
}
