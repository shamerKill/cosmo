///
//  Generated code. Do not modify.
//  source: cosmos/gov/v1beta1/tx.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
import 'package:alan/proto/google/protobuf/any.pbjson.dart' as $0;
import '../../base/v1beta1/coin.pbjson.dart' as $9;
import 'gov.pbjson.dart' as $34;

@$core.Deprecated('Use msgSubmitProposalDescriptor instead')
const MsgSubmitProposal$json = const {
  '1': 'MsgSubmitProposal',
  '2': const [
    const {
      '1': 'content',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '8': const {},
      '10': 'content'
    },
    const {
      '1': 'initial_deposit',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'initialDeposit'
    },
    const {'1': 'proposer', '3': 3, '4': 1, '5': 9, '10': 'proposer'},
  ],
  '7': const {},
};

/// Descriptor for `MsgSubmitProposal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSubmitProposalDescriptor = $convert.base64Decode(
    'ChFNc2dTdWJtaXRQcm9wb3NhbBI7Cgdjb250ZW50GAEgASgLMhQuZ29vZ2xlLnByb3RvYnVmLkFueUILyrQtB0NvbnRlbnRSB2NvbnRlbnQSjgEKD2luaXRpYWxfZGVwb3NpdBgCIAMoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkJKyN4fAKrfHyhnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkNvaW5z8t4fFnlhbWw6ImluaXRpYWxfZGVwb3NpdCJSDmluaXRpYWxEZXBvc2l0EhoKCHByb3Bvc2VyGAMgASgJUghwcm9wb3NlcjoQ6KAfAJigHwCA3CAAiKAfAA==');
@$core.Deprecated('Use msgSubmitProposalResponseDescriptor instead')
const MsgSubmitProposalResponse$json = const {
  '1': 'MsgSubmitProposalResponse',
  '2': const [
    const {
      '1': 'proposal_id',
      '3': 1,
      '4': 1,
      '5': 4,
      '8': const {},
      '10': 'proposalId'
    },
  ],
};

/// Descriptor for `MsgSubmitProposalResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgSubmitProposalResponseDescriptor =
    $convert.base64Decode(
        'ChlNc2dTdWJtaXRQcm9wb3NhbFJlc3BvbnNlEkYKC3Byb3Bvc2FsX2lkGAEgASgEQiXq3h8LcHJvcG9zYWxfaWTy3h8SeWFtbDoicHJvcG9zYWxfaWQiUgpwcm9wb3NhbElk');
@$core.Deprecated('Use msgVoteDescriptor instead')
const MsgVote$json = const {
  '1': 'MsgVote',
  '2': const [
    const {
      '1': 'proposal_id',
      '3': 1,
      '4': 1,
      '5': 4,
      '8': const {},
      '10': 'proposalId'
    },
    const {'1': 'voter', '3': 2, '4': 1, '5': 9, '10': 'voter'},
    const {
      '1': 'option',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.cosmos.gov.v1beta1.VoteOption',
      '10': 'option'
    },
  ],
  '7': const {},
};

/// Descriptor for `MsgVote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgVoteDescriptor = $convert.base64Decode(
    'CgdNc2dWb3RlEkYKC3Byb3Bvc2FsX2lkGAEgASgEQiXq3h8LcHJvcG9zYWxfaWTy3h8SeWFtbDoicHJvcG9zYWxfaWQiUgpwcm9wb3NhbElkEhQKBXZvdGVyGAIgASgJUgV2b3RlchI2CgZvcHRpb24YAyABKA4yHi5jb3Ntb3MuZ292LnYxYmV0YTEuVm90ZU9wdGlvblIGb3B0aW9uOhDooB8AmKAfAIDcIACIoB8A');
@$core.Deprecated('Use msgVoteResponseDescriptor instead')
const MsgVoteResponse$json = const {
  '1': 'MsgVoteResponse',
};

/// Descriptor for `MsgVoteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgVoteResponseDescriptor =
    $convert.base64Decode('Cg9Nc2dWb3RlUmVzcG9uc2U=');
@$core.Deprecated('Use msgVoteWeightedDescriptor instead')
const MsgVoteWeighted$json = const {
  '1': 'MsgVoteWeighted',
  '2': const [
    const {
      '1': 'proposal_id',
      '3': 1,
      '4': 1,
      '5': 4,
      '8': const {},
      '10': 'proposalId'
    },
    const {'1': 'voter', '3': 2, '4': 1, '5': 9, '10': 'voter'},
    const {
      '1': 'options',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.cosmos.gov.v1beta1.WeightedVoteOption',
      '8': const {},
      '10': 'options'
    },
  ],
  '7': const {},
};

/// Descriptor for `MsgVoteWeighted`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgVoteWeightedDescriptor = $convert.base64Decode(
    'Cg9Nc2dWb3RlV2VpZ2h0ZWQSNwoLcHJvcG9zYWxfaWQYASABKARCFvLeHxJ5YW1sOiJwcm9wb3NhbF9pZCJSCnByb3Bvc2FsSWQSFAoFdm90ZXIYAiABKAlSBXZvdGVyEkYKB29wdGlvbnMYAyADKAsyJi5jb3Ntb3MuZ292LnYxYmV0YTEuV2VpZ2h0ZWRWb3RlT3B0aW9uQgTI3h8AUgdvcHRpb25zOhDooB8AmKAfAIDcIACIoB8A');
@$core.Deprecated('Use msgVoteWeightedResponseDescriptor instead')
const MsgVoteWeightedResponse$json = const {
  '1': 'MsgVoteWeightedResponse',
};

/// Descriptor for `MsgVoteWeightedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgVoteWeightedResponseDescriptor =
    $convert.base64Decode('ChdNc2dWb3RlV2VpZ2h0ZWRSZXNwb25zZQ==');
@$core.Deprecated('Use msgDepositDescriptor instead')
const MsgDeposit$json = const {
  '1': 'MsgDeposit',
  '2': const [
    const {
      '1': 'proposal_id',
      '3': 1,
      '4': 1,
      '5': 4,
      '8': const {},
      '10': 'proposalId'
    },
    const {'1': 'depositor', '3': 2, '4': 1, '5': 9, '10': 'depositor'},
    const {
      '1': 'amount',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.cosmos.base.v1beta1.Coin',
      '8': const {},
      '10': 'amount'
    },
  ],
  '7': const {},
};

/// Descriptor for `MsgDeposit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgDepositDescriptor = $convert.base64Decode(
    'CgpNc2dEZXBvc2l0EkYKC3Byb3Bvc2FsX2lkGAEgASgEQiXq3h8LcHJvcG9zYWxfaWTy3h8SeWFtbDoicHJvcG9zYWxfaWQiUgpwcm9wb3NhbElkEhwKCWRlcG9zaXRvchgCIAEoCVIJZGVwb3NpdG9yEmMKBmFtb3VudBgDIAMoCzIZLmNvc21vcy5iYXNlLnYxYmV0YTEuQ29pbkIwyN4fAKrfHyhnaXRodWIuY29tL2Nvc21vcy9jb3Ntb3Mtc2RrL3R5cGVzLkNvaW5zUgZhbW91bnQ6EOigHwCYoB8AgNwgAIigHwA=');
@$core.Deprecated('Use msgDepositResponseDescriptor instead')
const MsgDepositResponse$json = const {
  '1': 'MsgDepositResponse',
};

/// Descriptor for `MsgDepositResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List msgDepositResponseDescriptor =
    $convert.base64Decode('ChJNc2dEZXBvc2l0UmVzcG9uc2U=');
const $core.Map<$core.String, $core.dynamic> MsgServiceBase$json = const {
  '1': 'Msg',
  '2': const [
    const {
      '1': 'SubmitProposal',
      '2': '.cosmos.gov.v1beta1.MsgSubmitProposal',
      '3': '.cosmos.gov.v1beta1.MsgSubmitProposalResponse'
    },
    const {
      '1': 'Vote',
      '2': '.cosmos.gov.v1beta1.MsgVote',
      '3': '.cosmos.gov.v1beta1.MsgVoteResponse'
    },
    const {
      '1': 'VoteWeighted',
      '2': '.cosmos.gov.v1beta1.MsgVoteWeighted',
      '3': '.cosmos.gov.v1beta1.MsgVoteWeightedResponse'
    },
    const {
      '1': 'Deposit',
      '2': '.cosmos.gov.v1beta1.MsgDeposit',
      '3': '.cosmos.gov.v1beta1.MsgDepositResponse'
    },
  ],
};

@$core.Deprecated('Use msgServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    MsgServiceBase$messageJson = const {
  '.cosmos.gov.v1beta1.MsgSubmitProposal': MsgSubmitProposal$json,
  '.google.protobuf.Any': $0.Any$json,
  '.cosmos.base.v1beta1.Coin': $9.Coin$json,
  '.cosmos.gov.v1beta1.MsgSubmitProposalResponse':
      MsgSubmitProposalResponse$json,
  '.cosmos.gov.v1beta1.MsgVote': MsgVote$json,
  '.cosmos.gov.v1beta1.MsgVoteResponse': MsgVoteResponse$json,
  '.cosmos.gov.v1beta1.MsgVoteWeighted': MsgVoteWeighted$json,
  '.cosmos.gov.v1beta1.WeightedVoteOption': $34.WeightedVoteOption$json,
  '.cosmos.gov.v1beta1.MsgVoteWeightedResponse': MsgVoteWeightedResponse$json,
  '.cosmos.gov.v1beta1.MsgDeposit': MsgDeposit$json,
  '.cosmos.gov.v1beta1.MsgDepositResponse': MsgDepositResponse$json,
};

/// Descriptor for `Msg`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List msgServiceDescriptor = $convert.base64Decode(
    'CgNNc2cSZgoOU3VibWl0UHJvcG9zYWwSJS5jb3Ntb3MuZ292LnYxYmV0YTEuTXNnU3VibWl0UHJvcG9zYWwaLS5jb3Ntb3MuZ292LnYxYmV0YTEuTXNnU3VibWl0UHJvcG9zYWxSZXNwb25zZRJICgRWb3RlEhsuY29zbW9zLmdvdi52MWJldGExLk1zZ1ZvdGUaIy5jb3Ntb3MuZ292LnYxYmV0YTEuTXNnVm90ZVJlc3BvbnNlEmAKDFZvdGVXZWlnaHRlZBIjLmNvc21vcy5nb3YudjFiZXRhMS5Nc2dWb3RlV2VpZ2h0ZWQaKy5jb3Ntb3MuZ292LnYxYmV0YTEuTXNnVm90ZVdlaWdodGVkUmVzcG9uc2USUQoHRGVwb3NpdBIeLmNvc21vcy5nb3YudjFiZXRhMS5Nc2dEZXBvc2l0GiYuY29zbW9zLmdvdi52MWJldGExLk1zZ0RlcG9zaXRSZXNwb25zZQ==');
