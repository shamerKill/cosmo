// ignore_for_file: constant_identifier_names
enum VoteOption {
  /// 不投票
  OptionEmpty,
  /// 同意
  OptionYes,
  /// 弃权
  OptionAbstain,
  /// 不同意
  OptionNo,
  /// 强烈反对
  OptionNoWithVeto,
}
/// 币种类型
class ModelCoin {
  final String denom;
  final String amount;
  ModelCoin({
    required this.denom,
    required this.amount,
  });
}

/// 多笔交易输入输出类型
class ModelMultiInOutput {
  final String address;
  final List<ModelCoin> coins;
  ModelMultiInOutput({
    required this.address,
    required this.coins,
  });
}

/// 权重投票类型
class ModelWeightedVoteOption {
  final VoteOption option;
  final String weight;
  ModelWeightedVoteOption({
    required this.option,
    required this.weight,
  });
}

/// 验证者描述
class ModelDescription {
  final String moniker;
  final String identity;
  final String website;
  final String securityContact;
  final String details;
  ModelDescription({
    required this.moniker,
    required this.identity,
    required this.website,
    required this.securityContact,
    required this.details,
  });
}

/// 验证者收益比率
class ModelCommissionRates {
  final String rate;
  final String maxRate;
  final String maxChangeRate;
  ModelCommissionRates({
    required this.rate,
    required this.maxRate,
    required this.maxChangeRate,
  });
}