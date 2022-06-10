
import 'dart:convert';

import 'package:plug/app/data/models/response/base.dart';

_decodeMsg (String source) {
  var _obj = json.decode(source);
  return _obj['value']??_obj;
}
List<ModelCoin> _decodeCoinList (List<dynamic> amounts) => amounts.map((item) => ModelCoin(
  denom: item['denom'],
  amount: item['amount'],
)).toList();
List<ModelMultiInOutput> _decodeInOutPutList (List<dynamic> input) => input.map((item) => ModelMultiInOutput(
  address: item['address'],
  coins: _decodeCoinList(item['coins']),
)).toList();
VoteOption _decodeVoteOption (String option) {
  switch (option) {
    case 'VOTE_OPTION_UNSPECIFIED': return VoteOption.OptionEmpty;
    case 'VOTE_OPTION_YES': return VoteOption.OptionYes;
    case 'VOTE_OPTION_ABSTAIN': return VoteOption.OptionAbstain;
    case 'VOTE_OPTION_NO': return VoteOption.OptionNo;
    case 'VOTE_OPTION_NO_WITH_VETO': return VoteOption.OptionNoWithVeto;
    default : return VoteOption.OptionEmpty;
  }
}
List<ModelWeightedVoteOption> _decodeVoteOptions (List<dynamic> options) {
  return options.map(((item) => ModelWeightedVoteOption(
    option: _decodeVoteOption(item['option']??''),
    weight: item['weight'],
  ))).toList();
}


/// 发送交易 01
class ModelMsgSend {
  late final String msgType;
  late final String fromAddress;
  late final String toAddress;
  late final List<ModelCoin> amount;
  ModelMsgSend(String source) {
    var obj = _decodeMsg(source);
    fromAddress = obj['from_address']??'';
    toAddress = obj['to_address']??'';
    amount = _decodeCoinList(obj['amount']??[]);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 单条多笔交易 02
class ModelMsgMultiSend {
  late final String msgType;
  late final List<ModelMultiInOutput> inputs;
  late final List<ModelMultiInOutput> outputs;
  ModelMsgMultiSend(String source) {
    var obj = _decodeMsg(source);
    inputs = _decodeInOutPutList(obj['inputs']);
    outputs = _decodeInOutPutList(obj['outputs']);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 设置提取收益地址 03
class ModelMsgSetWithdrawAddress {
  late final String msgType;
  late final String delegatorAddress;
  late final String withdrawAddress;
  ModelMsgSetWithdrawAddress(String source) {
    var obj = _decodeMsg(source);
    delegatorAddress = obj['delegator_address']??'';
    withdrawAddress = obj['withdraw_address']??'';
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 提取质押收益 04
class ModelMsgWithdrawDelegatorReward {
  late final String msgType;
  late final String delegatorAddress;
  late final String validatorAddress;
  ModelMsgWithdrawDelegatorReward(String source) {
    var obj = _decodeMsg(source);
    delegatorAddress = obj['delegator_address']??'';
    validatorAddress = obj['validator_address']??'';
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 验证者提取节点收益 05
class ModelMsgWithdrawValidatorCommission {
  late final String msgType;
  late final String validatorAddress;
  ModelMsgWithdrawValidatorCommission(String source) {
    var obj = _decodeMsg(source);
    validatorAddress = obj['validator_address']??'';
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 向社区资金池捐赠 06
class ModelMsgFundCommunityPool {
  late final String msgType;
  late final String depositor;
  late final List<ModelCoin> amount;
  ModelMsgFundCommunityPool(String source) {
    var obj = _decodeMsg(source);
    depositor = obj['depositor']??'';
    amount = _decodeCoinList(obj['amount']??[]);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 举报消息 07
class ModelMsgSubmitEvidence {
  late final String msgType;
  late final String submitter;
  late final dynamic evidence;
  ModelMsgSubmitEvidence(String source) {
    var obj = _decodeMsg(source);
    submitter = obj['submitter']??'';
    evidence = obj['evidence'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 授权用户可用权限 08
class ModelMsgGrantAllowance {
  late final String msgType;
  late final String granter;
  late final String grantee;
  late final dynamic allowance;
  ModelMsgGrantAllowance(String source) {
    var obj = _decodeMsg(source);
    granter = obj['granter']??'';
    grantee = obj['grantee']??'';
    allowance = obj['allowance'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 移除用户可用权限 09
class ModelMsgRevokeAllowance {
  late final String msgType;
  late final String granter;
  late final String grantee;
  ModelMsgRevokeAllowance(String source) {
    var obj = _decodeMsg(source);
    granter = obj['granter']??'';
    grantee = obj['grantee']??'';
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 申请发起提案 10
class ModelMsgSubmitProposal {
  late final String msgType;
  late final dynamic content;
  late final List<ModelCoin> initialDeposit;
  late final String proposer;
  ModelMsgSubmitProposal(String source) {
    var obj = _decodeMsg(source);
    proposer = obj['proposer']??'';
    content = obj['content'];
    initialDeposit = _decodeCoinList(obj['initial_deposit']??[]);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 进行提案投票 11
class ModelMsgVote {
  late final String msgType;
  late final int proposalId;
  late final String voter;
  late final VoteOption option;
  ModelMsgVote (String source) {
    var obj = _decodeMsg(source);
    proposalId = int.parse(obj['proposal_id'].toString());
    voter = obj['voter']??'';
    option = _decodeVoteOption(obj['option']);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 进行权重投票 12
class ModelMsgVoteWeighted {
  late final String msgType;
  late final int proposalId;
  late final String voter;
  late final List<ModelWeightedVoteOption> options;
  ModelMsgVoteWeighted (String source) {
    var obj = _decodeMsg(source);
    proposalId = int.parse(obj['proposal_id'].toString());
    voter = obj['voter']??'';
    options = _decodeVoteOptions(obj['options']??'');
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 对提案进行存款 13
class ModelMsgDeposit {
  late final String msgType;
  late final int proposalId;
  late final String depositor;
  late final List<ModelCoin> amount;
  ModelMsgDeposit(String source) {
    var obj = _decodeMsg(source);
    proposalId = int.parse(obj['proposal_id'].toString());
    depositor = obj['depositor']??'';
    amount = _decodeCoinList(obj['amount']??[]);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 验证者解禁 14
class ModelMsgUnJail {
  late final String msgType;
  late final String validatorAddr;
  ModelMsgUnJail(String source) {
    var obj = _decodeMsg(source);
    validatorAddr = obj['validator_addr']??'';
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 创建验证者 15
class ModelMsgCreateValidator {
  late final String msgType;
  late final ModelDescription description;
  late final ModelCommissionRates commission;
  late final String minSelfDelegation;
  late final String delegatorAddress;
  late final String validatorAddress;
  late final dynamic pubkey;
  late final ModelCoin value;
  ModelMsgCreateValidator(String source) {
    var obj = _decodeMsg(source);
    minSelfDelegation = obj['min_self_delegation']??'';
    delegatorAddress = obj['delegator_address']??'';
    validatorAddress = obj['validator_address']??'';
    pubkey = obj['pubkey']??'';
    value = ModelCoin(
      amount: obj['value']['amount'],
      denom: obj['value']['denom'],
    );
    description = ModelDescription(
      moniker: obj['description']['moniker'],
      identity: obj['description']['identity'],
      website: obj['description']['website'],
      details: obj['description']['details'],
      securityContact: obj['description']['security_contact'],
    );
    commission = ModelCommissionRates(
      rate: obj['commission']['rate'],
      maxRate: obj['commission']['max_rate'],
      maxChangeRate: obj['commission']['max_change_rate'],
    );
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 修改验证者 16
class ModelMsgEditValidator {
  late final String msgType;
  late final ModelDescription description;
  late final String validatorAddress;
  late final String commissionRate;
  late final String minSelfDelegation;
  ModelMsgEditValidator(String source) {
    var obj = _decodeMsg(source);
    description = ModelDescription(
      moniker: obj['description']['moniker'],
      identity: obj['description']['identity'],
      website: obj['description']['website'],
      details: obj['description']['details'],
      securityContact: obj['description']['security_contact'],
    );
    validatorAddress = obj['validator_address'];
    commissionRate = obj['commission_rate'];
    minSelfDelegation = obj['min_self_delegation'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 节点质押 17
class ModelMsgDelegate {
  late final String msgType;
  late final String delegatorAddress;
  late final String validatorAddress;
  late final ModelCoin amount;
  ModelMsgDelegate(String source) {
    var obj = _decodeMsg(source);
    delegatorAddress = obj['delegator_address'];
    validatorAddress = obj['validator_address'];
    amount = ModelCoin(
      denom: obj['amount']['denom'],
      amount: obj['amount']['amount'],
    );
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 转质押 18
class ModelMsgBeginRedelegate {
  late final String msgType;
  late final String delegatorAddress;
  late final String validatorSrcAddress;
  late final String validatorDstAddress;
  late final ModelCoin amount;
  ModelMsgBeginRedelegate(String source) {
    var obj = _decodeMsg(source);
    delegatorAddress = obj['delegator_address'];
    validatorSrcAddress = obj['validator_src_address'];
    validatorDstAddress = obj['validator_dst_address'];
    amount = ModelCoin(
      denom: obj['amount']['denom'],
      amount: obj['amount']['amount'],
    );
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 取消质押 19
class ModelMsgUndelegate {
  late final String msgType;
  late final String delegatorAddress;
  late final String validatorAddress;
  late final ModelCoin amount;
  ModelMsgUndelegate(String source) {
    var obj = _decodeMsg(source);
    delegatorAddress = obj['delegator_address'];
    validatorAddress = obj['validator_address'];
    amount = ModelCoin(
      denom: obj['amount']['denom'],
      amount: obj['amount']['amount'],
    );
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 创建投票委托账户 20
class ModelMsgCreateVestingAccount {
  late final String msgType;
  late final String fromAddress;
  late final String toAddress;
  late final List<ModelCoin> amount;
  late final int endTime;
  late final bool delayed;
  ModelMsgCreateVestingAccount(String source) {
    var obj = _decodeMsg(source);
    fromAddress = obj['from_address'];
    toAddress = obj['to_address'];
    amount = _decodeCoinList(obj['amount']);
    endTime = int.parse(obj['end_time'].toString().toString());
    delayed = obj['delayed'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 合约交易 21
class ModelMsgEthereumTx {
  late final String msgType;
  late final dynamic data;
  late final double size;
  late final String hash;
  late final String from;
  ModelMsgEthereumTx(String source) {
    var obj = _decodeMsg(source);
    data = obj['data'];
    size = double.parse(obj['size'].toString().toString());
    hash = obj['hash'];
    from = obj['from'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 创建prc10 token 22 
class ModelMsgIssueToken {
  late final String msgType;
  late final String symbol;
  late final String name;
  late final int scale;
  late final String minUnit;
  late final int initialSupply;
  late final int maxSupply;
  late final bool mintable;
  late final String owner;
  ModelMsgIssueToken(String source) {
    var obj = _decodeMsg(source);
    symbol = obj['symbol'];
    name = obj['name'];
    scale = int.parse(obj['scale'].toString());
    minUnit = obj['min_unit'];
    initialSupply = int.parse(obj['initial_supply'].toString());
    maxSupply = int.parse(obj['max_supply'].toString());
    mintable = obj['mintable'];
    owner = obj['owner'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 增发prc10 token 23
class ModelMsgMintToken {
  late final String msgType;
  late final String symbol;
  late final String to;
  late final int amount;
  late final String owner;
  ModelMsgMintToken(String source) {
    var obj = _decodeMsg(source);
    symbol = obj['symbol'];
    to = obj['to'];
    amount = int.parse(obj['amount'].toString());
    owner = obj['owner'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 修改prc10 token 24
class ModelMsgEditToken {
  late final String msgType;
  late final String symbol;
  late final String name;
  late final int maxSupply;
  late final String owner;
  ModelMsgEditToken(String source) {
    var obj = _decodeMsg(source);
    symbol = obj['symbol'];
    name = obj['name'];
    maxSupply = int.parse(obj['maxSupply'].toString());
    owner = obj['owner'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 销毁prc10 token 25
class ModelMsgBurnToken {
  late final String msgType;
  late final String symbol;
  late final int amount;
  late final String owner;
  ModelMsgBurnToken(String source) {
    var obj = _decodeMsg(source);
    symbol = obj['symbol'];
    amount = int.parse(obj['amount'].toString());
    owner = obj['owner'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 转移prc10 token所有权 26
class ModelMsgTransferOwnerToken {
  late final String msgType;
  late final String symbol;
  late final String owner;
  late final String to;
  ModelMsgTransferOwnerToken(String source) {
    var obj = _decodeMsg(source);
    symbol = obj['symbol'];
    to = obj['to'];
    owner = obj['owner'];
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 创建liquidity交易池 27
class ModelMsgCreatePool {
  late final String msgType;
  late final String poolCreatorAddress;
  late final int poolTypeId;
  late final List<ModelCoin> depositCoins;
  ModelMsgCreatePool(String source) {
    var obj = _decodeMsg(source);
    poolCreatorAddress = obj['pool_creator_address'];
    poolTypeId = int.parse(obj['pool_type_id'].toString());
    depositCoins = _decodeCoinList(obj['deposit_coins']);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 添加liquidity交易池存款 28
class ModelMsgDepositWithinBatch {
  late final String msgType;
  late final String depositorAddress;
  late final int poolId;
  late final List<ModelCoin> depositCoins;
  ModelMsgDepositWithinBatch(String source) {
    var obj = _decodeMsg(source);
    depositorAddress = obj['depositor_address'];
    poolId = int.parse(obj['pool_id'].toString());
    depositCoins = _decodeCoinList(obj['deposit_coins']);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// 提取liquidity交易池存款 29
class ModelMsgWithdrawWithinBatch {
  late final String msgType;
  late final String withdrawerAddress;
  late final int poolId;
  late final ModelCoin poolCoin;
  ModelMsgWithdrawWithinBatch(String source) {
    var obj = _decodeMsg(source);
    withdrawerAddress = obj['withdrawer_address'];
    poolId = int.parse(obj['pool_id'].toString());
    poolCoin = ModelCoin(denom: obj['pool_coin']['denom'], amount: obj['pool_coin']['amount']);
    msgType = obj['@type']??obj['type']??'';
  }
}

/// liquidity交易 30
class ModelMsgSwapWithinBatch {
  late final String msgType;
  late final String swapRequesterAddress;
  late final int poolId;
  late final int swapTypeId;
  late final ModelCoin offerCoin;
  late final String demandCoinDenom;
  late final ModelCoin offerCoinFee;
  late final String orderPrice;
  ModelMsgSwapWithinBatch(String source) {
    var obj = _decodeMsg(source);
    swapRequesterAddress = obj['swap_requester_address'];
    poolId = int.parse(obj['pool_id'].toString());
    swapTypeId = int.parse(obj['swap_type_id'].toString());
    offerCoin = ModelCoin(denom: obj['offer_coin']['denom'], amount: obj['offer_coin']['amount']);
    demandCoinDenom = obj['demand_coin_denom'];
    offerCoinFee = ModelCoin(denom: obj['offer_coin_fee']['denom'], amount: obj['offer_coin_fee']['amount']);
    orderPrice = obj['order_price'];
    msgType = obj['@type']??obj['type']??'';
  }
}