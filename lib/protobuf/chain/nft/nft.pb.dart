///
//  Generated code. Do not modify.
//  source: nft/nft.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NFT extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NFT', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'uri')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..hasRequiredFields = false
  ;

  NFT._() : super();
  factory NFT({
    $core.String? id,
    $core.String? name,
    $core.String? uri,
    $core.String? data,
    $core.String? owner,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
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
  factory NFT.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NFT.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NFT clone() => NFT()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NFT copyWith(void Function(NFT) updates) => super.copyWith((message) => updates(message as NFT)) as NFT; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NFT create() => NFT._();
  NFT createEmptyInstance() => create();
  static $pb.PbList<NFT> createRepeated() => $pb.PbList<NFT>();
  @$core.pragma('dart2js:noInline')
  static NFT getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NFT>(create);
  static NFT? _defaultInstance;

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
  $core.String get uri => $_getSZ(2);
  @$pb.TagNumber(3)
  set uri($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUri() => $_has(2);
  @$pb.TagNumber(3)
  void clearUri() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get data => $_getSZ(3);
  @$pb.TagNumber(4)
  set data($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get owner => $_getSZ(4);
  @$pb.TagNumber(5)
  set owner($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOwner() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwner() => clearField(5);
}

class Class extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Class', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'schema')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'symbol')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'owner')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mintRestricted')
    ..aOB(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'editRestricted')
    ..hasRequiredFields = false
  ;

  Class._() : super();
  factory Class({
    $core.String? id,
    $core.String? name,
    $core.String? schema,
    $core.String? symbol,
    $core.String? owner,
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
    if (symbol != null) {
      _result.symbol = symbol;
    }
    if (owner != null) {
      _result.owner = owner;
    }
    if (mintRestricted != null) {
      _result.mintRestricted = mintRestricted;
    }
    if (editRestricted != null) {
      _result.editRestricted = editRestricted;
    }
    return _result;
  }
  factory Class.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Class.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Class clone() => Class()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Class copyWith(void Function(Class) updates) => super.copyWith((message) => updates(message as Class)) as Class; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Class create() => Class._();
  Class createEmptyInstance() => create();
  static $pb.PbList<Class> createRepeated() => $pb.PbList<Class>();
  @$core.pragma('dart2js:noInline')
  static Class getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Class>(create);
  static Class? _defaultInstance;

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
  $core.String get symbol => $_getSZ(3);
  @$pb.TagNumber(4)
  set symbol($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSymbol() => $_has(3);
  @$pb.TagNumber(4)
  void clearSymbol() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get owner => $_getSZ(4);
  @$pb.TagNumber(5)
  set owner($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOwner() => $_has(4);
  @$pb.TagNumber(5)
  void clearOwner() => clearField(5);

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

class Collection extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Collection', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOM<Class>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'class', subBuilder: Class.create)
    ..pc<NFT>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nfts', $pb.PbFieldType.PM, subBuilder: NFT.create)
    ..hasRequiredFields = false
  ;

  Collection._() : super();
  factory Collection({
    Class? class_1,
    $core.Iterable<NFT>? nfts,
  }) {
    final _result = create();
    if (class_1 != null) {
      _result.class_1 = class_1;
    }
    if (nfts != null) {
      _result.nfts.addAll(nfts);
    }
    return _result;
  }
  factory Collection.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Collection.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Collection clone() => Collection()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Collection copyWith(void Function(Collection) updates) => super.copyWith((message) => updates(message as Collection)) as Collection; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Collection create() => Collection._();
  Collection createEmptyInstance() => create();
  static $pb.PbList<Collection> createRepeated() => $pb.PbList<Collection>();
  @$core.pragma('dart2js:noInline')
  static Collection getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Collection>(create);
  static Collection? _defaultInstance;

  @$pb.TagNumber(1)
  Class get class_1 => $_getN(0);
  @$pb.TagNumber(1)
  set class_1(Class v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasClass_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearClass_1() => clearField(1);
  @$pb.TagNumber(1)
  Class ensureClass_1() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<NFT> get nfts => $_getList(1);
}

class CollectionID extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CollectionID', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ClassId', protoName: 'Class_id')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'nftIds')
    ..hasRequiredFields = false
  ;

  CollectionID._() : super();
  factory CollectionID({
    $core.String? classId,
    $core.Iterable<$core.String>? nftIds,
  }) {
    final _result = create();
    if (classId != null) {
      _result.classId = classId;
    }
    if (nftIds != null) {
      _result.nftIds.addAll(nftIds);
    }
    return _result;
  }
  factory CollectionID.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CollectionID.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CollectionID clone() => CollectionID()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CollectionID copyWith(void Function(CollectionID) updates) => super.copyWith((message) => updates(message as CollectionID)) as CollectionID; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CollectionID create() => CollectionID._();
  CollectionID createEmptyInstance() => create();
  static $pb.PbList<CollectionID> createRepeated() => $pb.PbList<CollectionID>();
  @$core.pragma('dart2js:noInline')
  static CollectionID getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CollectionID>(create);
  static CollectionID? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get classId => $_getSZ(0);
  @$pb.TagNumber(1)
  set classId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasClassId() => $_has(0);
  @$pb.TagNumber(1)
  void clearClassId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get nftIds => $_getList(1);
}

class Owner extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Owner', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'plugchain.nft'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address')
    ..pc<CollectionID>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'collectionIds', $pb.PbFieldType.PM, subBuilder: CollectionID.create)
    ..hasRequiredFields = false
  ;

  Owner._() : super();
  factory Owner({
    $core.String? address,
    $core.Iterable<CollectionID>? collectionIds,
  }) {
    final _result = create();
    if (address != null) {
      _result.address = address;
    }
    if (collectionIds != null) {
      _result.collectionIds.addAll(collectionIds);
    }
    return _result;
  }
  factory Owner.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Owner.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Owner clone() => Owner()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Owner copyWith(void Function(Owner) updates) => super.copyWith((message) => updates(message as Owner)) as Owner; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Owner create() => Owner._();
  Owner createEmptyInstance() => create();
  static $pb.PbList<Owner> createRepeated() => $pb.PbList<Owner>();
  @$core.pragma('dart2js:noInline')
  static Owner getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Owner>(create);
  static Owner? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<CollectionID> get collectionIds => $_getList(1);
}

