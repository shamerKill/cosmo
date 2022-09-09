import 'dart:convert';

import 'package:plug/app/data/models/response/msgs.dart';

class ChainMessageTool {
  static formatAny(String source) {
    var obj = json.decode(source);
    if (obj is Iterable) {
      obj = obj.first;
    }
    String type = (obj['type'] is String) ? obj['type'] : obj['@type'];
    switch (type) {
      case '/cosmos.bank.v1beta1.MsgSend':
        return ModelMsgSend(source);
      case '/cosmos.bank.v1beta1.MsgMultiSend':
        return ModelMsgMultiSend(source);
      case '/cosmos.distribution.v1beta1.MsgFundCommunityPool':
        return ModelMsgFundCommunityPool(source);
      case '/cosmos.distribution.v1beta1.MsgSetWithdrawAddress':
        return ModelMsgSetWithdrawAddress(source);
      case '/cosmos.distribution.v1beta1.MsgWithdrawDelegatorReward':
        return ModelMsgWithdrawDelegatorReward(source);
      case '/cosmos.distribution.v1beta1.MsgWithdrawValidatorCommission':
        return ModelMsgWithdrawValidatorCommission(source);
      case '/cosmos.evidence.v1beta1.MsgSubmitEvidence':
        return ModelMsgSubmitEvidence(source);
      case '/cosmos.feegrant.v1beta1.MsgGrantAllowance':
        return ModelMsgGrantAllowance(source);
      case '/cosmos.feegrant.v1beta1.MsgRevokeAllowance':
        return ModelMsgRevokeAllowance(source);
      case '/cosmos.gov.v1beta1.MsgVote':
        return ModelMsgVote(source);
      case '/cosmos.gov.v1beta1.MsgSubmitProposal':
        return ModelMsgSubmitProposal(source);
      case '/cosmos.gov.v1beta1.MsgVoteWeighted':
        return ModelMsgVoteWeighted(source);
      case '/cosmos.gov.v1beta1.MsgDeposit':
        return ModelMsgDeposit(source);
      case '/cosmos.slashing.v1beta1.MsgUnjail':
        return ModelMsgUnJail(source);
      case '/cosmos.staking.v1beta1.MsgBeginRedelegate':
        return ModelMsgBeginRedelegate(source);
      case '/cosmos.staking.v1beta1.MsgCreateValidator':
        return ModelMsgCreateValidator(source);
      case '/cosmos.staking.v1beta1.MsgEditValidator':
        return ModelMsgEditValidator(source);
      case '/cosmos.staking.v1beta1.MsgDelegate':
        return ModelMsgDelegate(source);
      case '/cosmos.staking.v1beta1.MsgUndelegate':
        return ModelMsgUndelegate(source);
      case '/cosmos.vesting.v1beta1.MsgCreateVestingAccount':
        return ModelMsgCreateVestingAccount(source);
      case '/ethermint.evm.v1.MsgEthereumTx':
        return ModelMsgEthereumTx(source);
      case '/plugchain.prc10.MsgBurnToken':
        return ModelMsgBurnToken(source);
      case '/plugchain.prc10.MsgEditToken':
        return ModelMsgEditToken(source);
      case '/plugchain.prc10.MsgIssueToken':
        return ModelMsgIssueToken(source);
      case '/plugchain.prc10.MsgMintToken':
        return ModelMsgMintToken(source);
      case '/plugchain.prc10.ModelMsgTransferOwnerToken':
        return ModelMsgTransferOwnerToken(source);
      case '/tendermint.liquidity.v1beta1.MsgCreatePool':
        return ModelMsgCreatePool(source);
      case '/tendermint.liquidity.v1beta1.MsgDepositWithinBatch':
        return ModelMsgDepositWithinBatch(source);
      case '/tendermint.liquidity.v1beta1.MsgWithdrawWithinBatch':
        return ModelMsgWithdrawWithinBatch(source);
      case '/tendermint.liquidity.v1beta1.MsgSwapWithinBatch':
        return ModelMsgSwapWithinBatch(source);

      case 'cosmos-sdk/MsgSend':
        return ModelMsgSend(source);
      case 'cosmos-sdk/MsgMultiSend':
        return ModelMsgMultiSend(source);
      case 'cosmos-sdk/MsgFundCommunityPool':
        return ModelMsgFundCommunityPool(source);
      case 'cosmos-sdk/MsgSetWithdrawAddress':
        return ModelMsgSetWithdrawAddress(source);
      case 'cosmos-sdk/MsgWithdrawDelegationReward':
        return ModelMsgWithdrawDelegatorReward(source);
      case 'cosmos-sdk/MsgWithdrawValidatorCommission':
        return ModelMsgWithdrawValidatorCommission(source);
      case 'cosmos-sdk/MsgSubmitEvidence':
        return ModelMsgSubmitEvidence(source);
      case 'cosmos-sdk/MsgGrantAllowance':
        return ModelMsgGrantAllowance(source);
      case 'cosmos-sdk/MsgRevokeAllowance':
        return ModelMsgRevokeAllowance(source);
      case 'cosmos-sdk/MsgVote':
        return ModelMsgVote(source);
      case 'cosmos-sdk/MsgSubmitProposal':
        return ModelMsgSubmitProposal(source);
      case 'cosmos-sdk/MsgVoteWeighted':
        return ModelMsgVoteWeighted(source);
      case 'cosmos-sdk/MsgDeposit':
        return ModelMsgDeposit(source);
      case 'cosmos-sdk/MsgUnjail':
        return ModelMsgUnJail(source);
      case 'cosmos-sdk/MsgBeginRedelegate':
        return ModelMsgBeginRedelegate(source);
      case 'cosmos-sdk/MsgCreateValidator':
        return ModelMsgCreateValidator(source);
      case 'cosmos-sdk/MsgEditValidator':
        return ModelMsgEditValidator(source);
      case 'cosmos-sdk/MsgDelegate':
        return ModelMsgDelegate(source);
      case 'cosmos-sdk/MsgUndelegate':
        return ModelMsgUndelegate(source);
      case 'cosmos-sdk/MsgCreateVestingAccount':
        return ModelMsgCreateVestingAccount(source);
      case '/plugchain.token.MsgBurnToken':
        return ModelMsgBurnToken(source);
      case '/plugchain.token/MsgEditToken':
        return ModelMsgEditToken(source);
      case '/plugchain.token/MsgIssueToken':
        return ModelMsgIssueToken(source);
      case '/plugchain.token/MsgMintToken':
        return ModelMsgMintToken(source);
      case '/plugchain.token/ModelMsgTransferOwnerToken':
        return ModelMsgTransferOwnerToken(source);
      case 'liquidity/MsgCreatePool':
        return ModelMsgCreatePool(source);
      case 'liquidity/MsgDepositWithinBatch':
        return ModelMsgDepositWithinBatch(source);
      case 'liquidity/MsgWithdrawWithinBatch':
        return ModelMsgWithdrawWithinBatch(source);
      case 'liquidity/MsgSwapWithinBatch':
        return ModelMsgSwapWithinBatch(source);
    }
  }
}
