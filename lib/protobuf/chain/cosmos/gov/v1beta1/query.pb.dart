///
//  Generated code. Do not modify.
//  source: cosmos/gov/v1beta1/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'gov.pb.dart' as $34;
import '../../base/query/v1beta1/pagination.pb.dart' as $2;

import 'gov.pbenum.dart' as $34;

class QueryProposalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryProposalRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryProposalRequest._() : super();
  factory QueryProposalRequest({
    $fixnum.Int64? proposalId,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    return _result;
  }
  factory QueryProposalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryProposalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryProposalRequest clone() => QueryProposalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryProposalRequest copyWith(void Function(QueryProposalRequest) updates) => super.copyWith((message) => updates(message as QueryProposalRequest)) as QueryProposalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryProposalRequest create() => QueryProposalRequest._();
  QueryProposalRequest createEmptyInstance() => create();
  static $pb.PbList<QueryProposalRequest> createRepeated() => $pb.PbList<QueryProposalRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryProposalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryProposalRequest>(create);
  static QueryProposalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);
}

class QueryProposalResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryProposalResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..aOM<$34.Proposal>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposal', subBuilder: $34.Proposal.create)
    ..hasRequiredFields = false
  ;

  QueryProposalResponse._() : super();
  factory QueryProposalResponse({
    $34.Proposal? proposal,
  }) {
    final _result = create();
    if (proposal != null) {
      _result.proposal = proposal;
    }
    return _result;
  }
  factory QueryProposalResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryProposalResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryProposalResponse clone() => QueryProposalResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryProposalResponse copyWith(void Function(QueryProposalResponse) updates) => super.copyWith((message) => updates(message as QueryProposalResponse)) as QueryProposalResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryProposalResponse create() => QueryProposalResponse._();
  QueryProposalResponse createEmptyInstance() => create();
  static $pb.PbList<QueryProposalResponse> createRepeated() => $pb.PbList<QueryProposalResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryProposalResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryProposalResponse>(create);
  static QueryProposalResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $34.Proposal get proposal => $_getN(0);
  @$pb.TagNumber(1)
  set proposal($34.Proposal v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposal() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposal() => clearField(1);
  @$pb.TagNumber(1)
  $34.Proposal ensureProposal() => $_ensure(0);
}

class QueryProposalsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryProposalsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..e<$34.ProposalStatus>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalStatus', $pb.PbFieldType.OE, defaultOrMaker: $34.ProposalStatus.PROPOSAL_STATUS_UNSPECIFIED, valueOf: $34.ProposalStatus.valueOf, enumValues: $34.ProposalStatus.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voter')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'depositor')
    ..aOM<$2.PageRequest>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryProposalsRequest._() : super();
  factory QueryProposalsRequest({
    $34.ProposalStatus? proposalStatus,
    $core.String? voter,
    $core.String? depositor,
    $2.PageRequest? pagination,
  }) {
    final _result = create();
    if (proposalStatus != null) {
      _result.proposalStatus = proposalStatus;
    }
    if (voter != null) {
      _result.voter = voter;
    }
    if (depositor != null) {
      _result.depositor = depositor;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryProposalsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryProposalsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryProposalsRequest clone() => QueryProposalsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryProposalsRequest copyWith(void Function(QueryProposalsRequest) updates) => super.copyWith((message) => updates(message as QueryProposalsRequest)) as QueryProposalsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryProposalsRequest create() => QueryProposalsRequest._();
  QueryProposalsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryProposalsRequest> createRepeated() => $pb.PbList<QueryProposalsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryProposalsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryProposalsRequest>(create);
  static QueryProposalsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $34.ProposalStatus get proposalStatus => $_getN(0);
  @$pb.TagNumber(1)
  set proposalStatus($34.ProposalStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get voter => $_getSZ(1);
  @$pb.TagNumber(2)
  set voter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoter() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoter() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get depositor => $_getSZ(2);
  @$pb.TagNumber(3)
  set depositor($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDepositor() => $_has(2);
  @$pb.TagNumber(3)
  void clearDepositor() => clearField(3);

  @$pb.TagNumber(4)
  $2.PageRequest get pagination => $_getN(3);
  @$pb.TagNumber(4)
  set pagination($2.PageRequest v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPagination() => $_has(3);
  @$pb.TagNumber(4)
  void clearPagination() => clearField(4);
  @$pb.TagNumber(4)
  $2.PageRequest ensurePagination() => $_ensure(3);
}

class QueryProposalsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryProposalsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..pc<$34.Proposal>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposals', $pb.PbFieldType.PM, subBuilder: $34.Proposal.create)
    ..aOM<$2.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryProposalsResponse._() : super();
  factory QueryProposalsResponse({
    $core.Iterable<$34.Proposal>? proposals,
    $2.PageResponse? pagination,
  }) {
    final _result = create();
    if (proposals != null) {
      _result.proposals.addAll(proposals);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryProposalsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryProposalsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryProposalsResponse clone() => QueryProposalsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryProposalsResponse copyWith(void Function(QueryProposalsResponse) updates) => super.copyWith((message) => updates(message as QueryProposalsResponse)) as QueryProposalsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryProposalsResponse create() => QueryProposalsResponse._();
  QueryProposalsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryProposalsResponse> createRepeated() => $pb.PbList<QueryProposalsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryProposalsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryProposalsResponse>(create);
  static QueryProposalsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$34.Proposal> get proposals => $_getList(0);

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

class QueryVoteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryVoteRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'voter')
    ..hasRequiredFields = false
  ;

  QueryVoteRequest._() : super();
  factory QueryVoteRequest({
    $fixnum.Int64? proposalId,
    $core.String? voter,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    if (voter != null) {
      _result.voter = voter;
    }
    return _result;
  }
  factory QueryVoteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryVoteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryVoteRequest clone() => QueryVoteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryVoteRequest copyWith(void Function(QueryVoteRequest) updates) => super.copyWith((message) => updates(message as QueryVoteRequest)) as QueryVoteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryVoteRequest create() => QueryVoteRequest._();
  QueryVoteRequest createEmptyInstance() => create();
  static $pb.PbList<QueryVoteRequest> createRepeated() => $pb.PbList<QueryVoteRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryVoteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryVoteRequest>(create);
  static QueryVoteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get voter => $_getSZ(1);
  @$pb.TagNumber(2)
  set voter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVoter() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoter() => clearField(2);
}

class QueryVoteResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryVoteResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..aOM<$34.Vote>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'vote', subBuilder: $34.Vote.create)
    ..hasRequiredFields = false
  ;

  QueryVoteResponse._() : super();
  factory QueryVoteResponse({
    $34.Vote? vote,
  }) {
    final _result = create();
    if (vote != null) {
      _result.vote = vote;
    }
    return _result;
  }
  factory QueryVoteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryVoteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryVoteResponse clone() => QueryVoteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryVoteResponse copyWith(void Function(QueryVoteResponse) updates) => super.copyWith((message) => updates(message as QueryVoteResponse)) as QueryVoteResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryVoteResponse create() => QueryVoteResponse._();
  QueryVoteResponse createEmptyInstance() => create();
  static $pb.PbList<QueryVoteResponse> createRepeated() => $pb.PbList<QueryVoteResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryVoteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryVoteResponse>(create);
  static QueryVoteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $34.Vote get vote => $_getN(0);
  @$pb.TagNumber(1)
  set vote($34.Vote v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVote() => $_has(0);
  @$pb.TagNumber(1)
  void clearVote() => clearField(1);
  @$pb.TagNumber(1)
  $34.Vote ensureVote() => $_ensure(0);
}

class QueryVotesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryVotesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$2.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryVotesRequest._() : super();
  factory QueryVotesRequest({
    $fixnum.Int64? proposalId,
    $2.PageRequest? pagination,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryVotesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryVotesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryVotesRequest clone() => QueryVotesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryVotesRequest copyWith(void Function(QueryVotesRequest) updates) => super.copyWith((message) => updates(message as QueryVotesRequest)) as QueryVotesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryVotesRequest create() => QueryVotesRequest._();
  QueryVotesRequest createEmptyInstance() => create();
  static $pb.PbList<QueryVotesRequest> createRepeated() => $pb.PbList<QueryVotesRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryVotesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryVotesRequest>(create);
  static QueryVotesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

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

class QueryVotesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryVotesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..pc<$34.Vote>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'votes', $pb.PbFieldType.PM, subBuilder: $34.Vote.create)
    ..aOM<$2.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryVotesResponse._() : super();
  factory QueryVotesResponse({
    $core.Iterable<$34.Vote>? votes,
    $2.PageResponse? pagination,
  }) {
    final _result = create();
    if (votes != null) {
      _result.votes.addAll(votes);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryVotesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryVotesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryVotesResponse clone() => QueryVotesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryVotesResponse copyWith(void Function(QueryVotesResponse) updates) => super.copyWith((message) => updates(message as QueryVotesResponse)) as QueryVotesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryVotesResponse create() => QueryVotesResponse._();
  QueryVotesResponse createEmptyInstance() => create();
  static $pb.PbList<QueryVotesResponse> createRepeated() => $pb.PbList<QueryVotesResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryVotesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryVotesResponse>(create);
  static QueryVotesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$34.Vote> get votes => $_getList(0);

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

class QueryParamsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'paramsType')
    ..hasRequiredFields = false
  ;

  QueryParamsRequest._() : super();
  factory QueryParamsRequest({
    $core.String? paramsType,
  }) {
    final _result = create();
    if (paramsType != null) {
      _result.paramsType = paramsType;
    }
    return _result;
  }
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

  @$pb.TagNumber(1)
  $core.String get paramsType => $_getSZ(0);
  @$pb.TagNumber(1)
  set paramsType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasParamsType() => $_has(0);
  @$pb.TagNumber(1)
  void clearParamsType() => clearField(1);
}

class QueryParamsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryParamsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..aOM<$34.VotingParams>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'votingParams', subBuilder: $34.VotingParams.create)
    ..aOM<$34.DepositParams>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'depositParams', subBuilder: $34.DepositParams.create)
    ..aOM<$34.TallyParams>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tallyParams', subBuilder: $34.TallyParams.create)
    ..hasRequiredFields = false
  ;

  QueryParamsResponse._() : super();
  factory QueryParamsResponse({
    $34.VotingParams? votingParams,
    $34.DepositParams? depositParams,
    $34.TallyParams? tallyParams,
  }) {
    final _result = create();
    if (votingParams != null) {
      _result.votingParams = votingParams;
    }
    if (depositParams != null) {
      _result.depositParams = depositParams;
    }
    if (tallyParams != null) {
      _result.tallyParams = tallyParams;
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
  $34.VotingParams get votingParams => $_getN(0);
  @$pb.TagNumber(1)
  set votingParams($34.VotingParams v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasVotingParams() => $_has(0);
  @$pb.TagNumber(1)
  void clearVotingParams() => clearField(1);
  @$pb.TagNumber(1)
  $34.VotingParams ensureVotingParams() => $_ensure(0);

  @$pb.TagNumber(2)
  $34.DepositParams get depositParams => $_getN(1);
  @$pb.TagNumber(2)
  set depositParams($34.DepositParams v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDepositParams() => $_has(1);
  @$pb.TagNumber(2)
  void clearDepositParams() => clearField(2);
  @$pb.TagNumber(2)
  $34.DepositParams ensureDepositParams() => $_ensure(1);

  @$pb.TagNumber(3)
  $34.TallyParams get tallyParams => $_getN(2);
  @$pb.TagNumber(3)
  set tallyParams($34.TallyParams v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTallyParams() => $_has(2);
  @$pb.TagNumber(3)
  void clearTallyParams() => clearField(3);
  @$pb.TagNumber(3)
  $34.TallyParams ensureTallyParams() => $_ensure(2);
}

class QueryDepositRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDepositRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'depositor')
    ..hasRequiredFields = false
  ;

  QueryDepositRequest._() : super();
  factory QueryDepositRequest({
    $fixnum.Int64? proposalId,
    $core.String? depositor,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    if (depositor != null) {
      _result.depositor = depositor;
    }
    return _result;
  }
  factory QueryDepositRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDepositRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDepositRequest clone() => QueryDepositRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDepositRequest copyWith(void Function(QueryDepositRequest) updates) => super.copyWith((message) => updates(message as QueryDepositRequest)) as QueryDepositRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDepositRequest create() => QueryDepositRequest._();
  QueryDepositRequest createEmptyInstance() => create();
  static $pb.PbList<QueryDepositRequest> createRepeated() => $pb.PbList<QueryDepositRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryDepositRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDepositRequest>(create);
  static QueryDepositRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get depositor => $_getSZ(1);
  @$pb.TagNumber(2)
  set depositor($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDepositor() => $_has(1);
  @$pb.TagNumber(2)
  void clearDepositor() => clearField(2);
}

class QueryDepositResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDepositResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..aOM<$34.Deposit>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deposit', subBuilder: $34.Deposit.create)
    ..hasRequiredFields = false
  ;

  QueryDepositResponse._() : super();
  factory QueryDepositResponse({
    $34.Deposit? deposit,
  }) {
    final _result = create();
    if (deposit != null) {
      _result.deposit = deposit;
    }
    return _result;
  }
  factory QueryDepositResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDepositResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDepositResponse clone() => QueryDepositResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDepositResponse copyWith(void Function(QueryDepositResponse) updates) => super.copyWith((message) => updates(message as QueryDepositResponse)) as QueryDepositResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDepositResponse create() => QueryDepositResponse._();
  QueryDepositResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDepositResponse> createRepeated() => $pb.PbList<QueryDepositResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDepositResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDepositResponse>(create);
  static QueryDepositResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $34.Deposit get deposit => $_getN(0);
  @$pb.TagNumber(1)
  set deposit($34.Deposit v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDeposit() => $_has(0);
  @$pb.TagNumber(1)
  void clearDeposit() => clearField(1);
  @$pb.TagNumber(1)
  $34.Deposit ensureDeposit() => $_ensure(0);
}

class QueryDepositsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDepositsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<$2.PageRequest>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageRequest.create)
    ..hasRequiredFields = false
  ;

  QueryDepositsRequest._() : super();
  factory QueryDepositsRequest({
    $fixnum.Int64? proposalId,
    $2.PageRequest? pagination,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryDepositsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDepositsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDepositsRequest clone() => QueryDepositsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDepositsRequest copyWith(void Function(QueryDepositsRequest) updates) => super.copyWith((message) => updates(message as QueryDepositsRequest)) as QueryDepositsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDepositsRequest create() => QueryDepositsRequest._();
  QueryDepositsRequest createEmptyInstance() => create();
  static $pb.PbList<QueryDepositsRequest> createRepeated() => $pb.PbList<QueryDepositsRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryDepositsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDepositsRequest>(create);
  static QueryDepositsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);

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

class QueryDepositsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryDepositsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..pc<$34.Deposit>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'deposits', $pb.PbFieldType.PM, subBuilder: $34.Deposit.create)
    ..aOM<$2.PageResponse>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pagination', subBuilder: $2.PageResponse.create)
    ..hasRequiredFields = false
  ;

  QueryDepositsResponse._() : super();
  factory QueryDepositsResponse({
    $core.Iterable<$34.Deposit>? deposits,
    $2.PageResponse? pagination,
  }) {
    final _result = create();
    if (deposits != null) {
      _result.deposits.addAll(deposits);
    }
    if (pagination != null) {
      _result.pagination = pagination;
    }
    return _result;
  }
  factory QueryDepositsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryDepositsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryDepositsResponse clone() => QueryDepositsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryDepositsResponse copyWith(void Function(QueryDepositsResponse) updates) => super.copyWith((message) => updates(message as QueryDepositsResponse)) as QueryDepositsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryDepositsResponse create() => QueryDepositsResponse._();
  QueryDepositsResponse createEmptyInstance() => create();
  static $pb.PbList<QueryDepositsResponse> createRepeated() => $pb.PbList<QueryDepositsResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryDepositsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryDepositsResponse>(create);
  static QueryDepositsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$34.Deposit> get deposits => $_getList(0);

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

class QueryTallyResultRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTallyResultRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'proposalId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  QueryTallyResultRequest._() : super();
  factory QueryTallyResultRequest({
    $fixnum.Int64? proposalId,
  }) {
    final _result = create();
    if (proposalId != null) {
      _result.proposalId = proposalId;
    }
    return _result;
  }
  factory QueryTallyResultRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTallyResultRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTallyResultRequest clone() => QueryTallyResultRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTallyResultRequest copyWith(void Function(QueryTallyResultRequest) updates) => super.copyWith((message) => updates(message as QueryTallyResultRequest)) as QueryTallyResultRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTallyResultRequest create() => QueryTallyResultRequest._();
  QueryTallyResultRequest createEmptyInstance() => create();
  static $pb.PbList<QueryTallyResultRequest> createRepeated() => $pb.PbList<QueryTallyResultRequest>();
  @$core.pragma('dart2js:noInline')
  static QueryTallyResultRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTallyResultRequest>(create);
  static QueryTallyResultRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get proposalId => $_getI64(0);
  @$pb.TagNumber(1)
  set proposalId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProposalId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProposalId() => clearField(1);
}

class QueryTallyResultResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'QueryTallyResultResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'cosmos.gov.v1beta1'), createEmptyInstance: create)
    ..aOM<$34.TallyResult>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tally', subBuilder: $34.TallyResult.create)
    ..hasRequiredFields = false
  ;

  QueryTallyResultResponse._() : super();
  factory QueryTallyResultResponse({
    $34.TallyResult? tally,
  }) {
    final _result = create();
    if (tally != null) {
      _result.tally = tally;
    }
    return _result;
  }
  factory QueryTallyResultResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QueryTallyResultResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QueryTallyResultResponse clone() => QueryTallyResultResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QueryTallyResultResponse copyWith(void Function(QueryTallyResultResponse) updates) => super.copyWith((message) => updates(message as QueryTallyResultResponse)) as QueryTallyResultResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static QueryTallyResultResponse create() => QueryTallyResultResponse._();
  QueryTallyResultResponse createEmptyInstance() => create();
  static $pb.PbList<QueryTallyResultResponse> createRepeated() => $pb.PbList<QueryTallyResultResponse>();
  @$core.pragma('dart2js:noInline')
  static QueryTallyResultResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QueryTallyResultResponse>(create);
  static QueryTallyResultResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $34.TallyResult get tally => $_getN(0);
  @$pb.TagNumber(1)
  set tally($34.TallyResult v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTally() => $_has(0);
  @$pb.TagNumber(1)
  void clearTally() => clearField(1);
  @$pb.TagNumber(1)
  $34.TallyResult ensureTally() => $_ensure(0);
}

class QueryApi {
  $pb.RpcClient _client;
  QueryApi(this._client);

  $async.Future<QueryProposalResponse> proposal($pb.ClientContext? ctx, QueryProposalRequest request) {
    var emptyResponse = QueryProposalResponse();
    return _client.invoke<QueryProposalResponse>(ctx, 'Query', 'Proposal', request, emptyResponse);
  }
  $async.Future<QueryProposalsResponse> proposals($pb.ClientContext? ctx, QueryProposalsRequest request) {
    var emptyResponse = QueryProposalsResponse();
    return _client.invoke<QueryProposalsResponse>(ctx, 'Query', 'Proposals', request, emptyResponse);
  }
  $async.Future<QueryVoteResponse> vote($pb.ClientContext? ctx, QueryVoteRequest request) {
    var emptyResponse = QueryVoteResponse();
    return _client.invoke<QueryVoteResponse>(ctx, 'Query', 'Vote', request, emptyResponse);
  }
  $async.Future<QueryVotesResponse> votes($pb.ClientContext? ctx, QueryVotesRequest request) {
    var emptyResponse = QueryVotesResponse();
    return _client.invoke<QueryVotesResponse>(ctx, 'Query', 'Votes', request, emptyResponse);
  }
  $async.Future<QueryParamsResponse> params($pb.ClientContext? ctx, QueryParamsRequest request) {
    var emptyResponse = QueryParamsResponse();
    return _client.invoke<QueryParamsResponse>(ctx, 'Query', 'Params', request, emptyResponse);
  }
  $async.Future<QueryDepositResponse> deposit($pb.ClientContext? ctx, QueryDepositRequest request) {
    var emptyResponse = QueryDepositResponse();
    return _client.invoke<QueryDepositResponse>(ctx, 'Query', 'Deposit', request, emptyResponse);
  }
  $async.Future<QueryDepositsResponse> deposits($pb.ClientContext? ctx, QueryDepositsRequest request) {
    var emptyResponse = QueryDepositsResponse();
    return _client.invoke<QueryDepositsResponse>(ctx, 'Query', 'Deposits', request, emptyResponse);
  }
  $async.Future<QueryTallyResultResponse> tallyResult($pb.ClientContext? ctx, QueryTallyResultRequest request) {
    var emptyResponse = QueryTallyResultResponse();
    return _client.invoke<QueryTallyResultResponse>(ctx, 'Query', 'TallyResult', request, emptyResponse);
  }
}

