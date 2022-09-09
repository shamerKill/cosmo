import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/models/response/msgs.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/services/data.services.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class LLogsItemView extends GetView {
  const LLogsItemView({
    Key? key,
    required this.item,
  }) : super(key: key);
  final TransferLogModel item;

  @override
  Widget build(BuildContext context) {
    LLogsItemViewController controller =
        Get.put(LLogsItemViewController(logItem: item), tag: key.toString());

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: appTheme.colors.borderColor)),
      ),
      child: Row(
        children: [
          controller.getIcon(item.rawLog),
          Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.getTitle(item),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: appTheme.sizes.paddingSmall / 3)),
                Text(StringTool.formatTime(item.time),
                    style: Get.textTheme.bodyText1),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                  item.status == TransferLogStatusEnum.success
                      ? const IconData(0xe81e, fontFamily: 'plugIcon')
                      : (item.status == TransferLogStatusEnum.fail
                          ? const IconData(0xe60c, fontFamily: 'plugIcon')
                          : const IconData(0xe815, fontFamily: 'plugIcon')),
                  size: appTheme.sizes.iconSize / 1.5,
                  color: item.status == TransferLogStatusEnum.success
                      ? appTheme.colors.primaryColor
                      : (item.status == TransferLogStatusEnum.fail
                          ? appTheme.colors.errorColor
                          : appTheme.colors.textGrayBig)),
              Padding(
                  padding:
                      EdgeInsets.only(bottom: appTheme.sizes.paddingSmall / 2)),
              Container(
                width: appTheme.sizes.basic * 200,
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(() => Text(
                        controller.state.descText,
                        style:
                            TextStyle(fontSize: appTheme.sizes.fontSizeSmall),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LLogsItemViewState {
  // more description text string
  final Rx<String> _descText = ''.obs;
  String get descText => _descText.value;
  set descText(String value) => _descText.value = value;
}

class LLogsItemViewController extends GetxController {
  TransferLogModel logItem;
  LLogsItemViewController({required this.logItem});
  LLogsItemViewState state = LLogsItemViewState();
  DataAccountController dataAccount = Get.find();

  @override
  void onReady() {
    _editDescText();
  }

  _editDescText() async {
    var _formatData = logItem.rawLog;
    String _descText = '';
    if (_formatData is ModelMsgSend) {
      // 转账
      for (var _coin in _formatData.amount) {
        TokenModel _token = await dataToolServer.getTokenInfo(_coin.denom);
        _descText +=
            '${NumberTool.amountToBalance(_coin.amount, scale: _token.scale)} ${_token.symbol} ';
      }
    } else if (_formatData is ModelMsgMultiSend) {
      // 多人转账
      for (var _item in _formatData.inputs) {
        for (var _coin in _item.coins) {
          TokenModel _token = await dataToolServer.getTokenInfo(_coin.denom);
          _descText +=
              '${NumberTool.amountToBalance(_coin.amount, scale: _token.scale)} ${_token.symbol} ';
        }
      }
    } else if (_formatData is ModelMsgFundCommunityPool) {
      // 向社区资金池捐赠
      for (var _coin in _formatData.amount) {
        TokenModel _token = await dataToolServer.getTokenInfo(_coin.denom);
        _descText +=
            '${NumberTool.amountToBalance(_coin.amount, scale: _token.scale)} ${_token.symbol} ';
      }
    } else if (_formatData is ModelMsgDeposit) {
      // 对提案进行存款
      for (var _coin in _formatData.amount) {
        TokenModel _token = await dataToolServer.getTokenInfo(_coin.denom);
        _descText +=
            '${NumberTool.amountToBalance(_coin.amount, scale: _token.scale)} ${_token.symbol} ';
      }
    } else if (_formatData is ModelMsgDelegate ||
        _formatData is ModelMsgBeginRedelegate ||
        _formatData is ModelMsgUndelegate) {
      // 节点质押 | 节点转质押 | 节点赎回
      var _coin = _formatData.amount;
      TokenModel _token = await dataToolServer.getTokenInfo(_coin.denom);
      _descText +=
          '${NumberTool.amountToBalance(_coin.amount, scale: _token.scale)} ${_token.symbol} ';
    } else if (_formatData is ModelMsgSwapWithinBatch) {
      // liquidity交易
      TokenModel _token =
          await dataToolServer.getTokenInfo(_formatData.offerCoin.denom);
      _descText +=
          '${NumberTool.amountToBalance(_formatData.offerCoin.amount, scale: _token.scale)} ${_token.symbol} ';
    } else if (_formatData is Map &&
        _formatData['type'] == enumTokenType.prc20) {
      // 合约交易
      _descText += '${_formatData['amount']} ${_formatData['symbol']} ';
    }
    state.descText = _descText.trimRight();
  }

  Widget getIcon(dynamic formatData) {
    String iconUrl = 'assets/images/log_icon/transfer.png';
    if (formatData is ModelMsgSend || formatData is ModelMsgMultiSend) {
      // 交易
      iconUrl = 'assets/images/log_icon/transfer.png';
    } else if (formatData is ModelMsgSetWithdrawAddress ||
        formatData is ModelMsgWithdrawValidatorCommission ||
        formatData is ModelMsgFundCommunityPool ||
        formatData is ModelMsgUnJail ||
        formatData is ModelMsgCreateValidator ||
        formatData is ModelMsgEditValidator) {
      // 验证者操作
      iconUrl = 'assets/images/log_icon/verifier.png';
    } else if (formatData is ModelMsgSubmitEvidence) {
      // 举报
      iconUrl = 'assets/images/log_icon/report.png';
    } else if (formatData is ModelMsgWithdrawDelegatorReward ||
        formatData is ModelMsgDelegate ||
        formatData is ModelMsgBeginRedelegate ||
        formatData is ModelMsgUndelegate) {
      // 用户质押操作
      iconUrl = 'assets/images/log_icon/delegate.png';
    } else if (formatData is ModelMsgGrantAllowance ||
        formatData is ModelMsgRevokeAllowance ||
        formatData is ModelMsgCreateVestingAccount) {
      // 用户权限委托
      iconUrl = 'assets/images/log_icon/allowance.png';
    } else if (formatData is ModelMsgSubmitProposal ||
        formatData is ModelMsgVote ||
        formatData is ModelMsgVoteWeighted ||
        formatData is ModelMsgDeposit) {
      // 提案操作
      iconUrl = 'assets/images/log_icon/proposal.png';
    } else if (formatData is ModelMsgEthereumTx) {
      // 合约操作
      iconUrl = 'assets/images/log_icon/contract.png';
    } else if (formatData is ModelMsgIssueToken ||
        formatData is ModelMsgMintToken ||
        formatData is ModelMsgEditToken ||
        formatData is ModelMsgBurnToken ||
        formatData is ModelMsgTransferOwnerToken) {
      // prc10代币操作
      iconUrl = 'assets/images/log_icon/prc10.png';
    } else if (formatData is ModelMsgCreatePool ||
        formatData is ModelMsgDepositWithinBatch ||
        formatData is ModelMsgWithdrawWithinBatch ||
        formatData is ModelMsgSwapWithinBatch) {
      // liquidity交易池操作
      iconUrl = 'assets/images/log_icon/pool.png';
    } else if (formatData is Map && formatData['type'] == enumTokenType.prc20) {
      // 合约交易
      iconUrl = 'assets/images/log_icon/contract.png';
    }
    return Image(
      width: appTheme.sizes.basic * 60.0,
      height: appTheme.sizes.basic * 60.0,
      image: AssetImage(iconUrl),
    );
  }

  Widget getTitle(TransferLogModel item) {
    var _formatData = item.rawLog;
    var accountAddress = dataAccount.state.nowAccount?.address ?? '';
    String _titleType =
        'normal'; // normal(no add), right(add right), left(add left)
    String _titleText = '';
    String _titleAdd = '';
    if (_formatData is ModelMsgSend) {
      // 单对单转账
      if (_formatData.fromAddress == accountAddress) {
        // 转出
        _titleType = 'right';
        _titleText = 'transferTo'.tr + '\r';
        _titleAdd = StringTool.hideAddressCenter(_formatData.toAddress,
            startLen: 4, endLen: 8);
      } else if (_formatData.toAddress == accountAddress) {
        // 转入
        _titleType = 'left';
        _titleText = '\r' + 'transferIn'.tr;
        _titleAdd = StringTool.hideAddressCenter(_formatData.fromAddress,
            startLen: 4, endLen: 8);
      }
    } else if (_formatData is ModelMsgMultiSend) {
      // 多人转账
      _titleType = 'right';
      _titleText = 'multiTransfer'.tr + '\r';
      if (_formatData.inputs
              .firstWhereOrNull((_item) => _item.address == accountAddress) !=
          null) {
        // 多人转出
        _titleAdd = 'transferOut'.tr;
      } else if (_formatData.outputs
              .firstWhereOrNull((_item) => _item.address == accountAddress) !=
          null) {
        // 多人转入
        _titleAdd = 'transferIn'.tr;
      }
    } else if (_formatData is ModelMsgSetWithdrawAddress) {
      // 设置提现地址
      _titleText = 'setWithdrawAddress'.tr;
    } else if (_formatData is ModelMsgWithdrawDelegatorReward) {
      // 提取委托奖励
      _titleType = 'right';
      _titleText = 'withdrawDelegatorReward'.tr + '\r';
      _titleAdd = StringTool.hideAddressCenter(_formatData.validatorAddress,
          startLen: 0, endLen: 8);
    } else if (_formatData is ModelMsgWithdrawValidatorCommission) {
      // 提取验证者节点奖励
      _titleText = 'withdrawValidatorReward'.tr;
    } else if (_formatData is ModelMsgFundCommunityPool) {
      // 向社区资金池捐赠
      _titleText = 'fundCommunityPool'.tr;
    } else if (_formatData is ModelMsgSubmitEvidence) {
      // 举报消息
      _titleText = 'submitEvidence'.tr;
    } else if (_formatData is ModelMsgGrantAllowance) {
      // 授权用户可用权限
      _titleType = 'right';
      _titleText = 'grantAllowance'.tr + '\r';
      _titleAdd = StringTool.hideAddressCenter(_formatData.grantee,
          startLen: 4, endLen: 8);
    } else if (_formatData is ModelMsgRevokeAllowance) {
      // 撤销用户可用权限
      _titleType = 'right';
      _titleText = 'revokeAllowance'.tr + '\r';
      _titleAdd = StringTool.hideAddressCenter(_formatData.grantee,
          startLen: 4, endLen: 8);
    } else if (_formatData is ModelMsgSubmitProposal) {
      // 提案申请
      _titleText = 'submitProposal'.tr;
    } else if (_formatData is ModelMsgVote) {
      // 进行提案投票
      _titleType = 'right';
      _titleText = 'vote'.tr + '\r';
      _titleAdd = 'id:\r' + _formatData.proposalId.toString();
    } else if (_formatData is ModelMsgVoteWeighted) {
      // 进行提案权重投票
      _titleType = 'right';
      _titleText = 'voteWeighted'.tr + '\r';
      _titleAdd = 'id:\r' + _formatData.proposalId.toString();
    } else if (_formatData is ModelMsgDeposit) {
      // 存入提案资金
      _titleType = 'right';
      _titleText = 'deposit'.tr + '\r';
      _titleAdd = 'id:\r' + _formatData.proposalId.toString();
    } else if (_formatData is ModelMsgUnJail) {
      // 验证者解禁
      _titleText = 'unJail'.tr;
    } else if (_formatData is ModelMsgCreateValidator) {
      // 创建验证者
      _titleText = 'createValidator'.tr;
    } else if (_formatData is ModelMsgEditValidator) {
      // 编辑验证者
      _titleText = 'editValidator'.tr;
    } else if (_formatData is ModelMsgDelegate) {
      // 验证者委托
      _titleType = 'right';
      _titleText = 'delegate'.tr + '\r';
      _titleAdd = StringTool.hideAddressCenter(_formatData.validatorAddress,
          startLen: 0, endLen: 8);
    } else if (_formatData is ModelMsgBeginRedelegate) {
      // 验证者转质押
      _titleType = 'right';
      _titleText = 'beginReDelegate'.tr + '\r';
      _titleAdd = StringTool.hideAddressCenter(_formatData.validatorDstAddress,
          startLen: 0, endLen: 8);
    } else if (_formatData is ModelMsgUndelegate) {
      // 验证者取消质押
      _titleType = 'right';
      _titleText = 'unDelegate'.tr + '\r';
      _titleAdd = StringTool.hideAddressCenter(_formatData.validatorAddress,
          startLen: 0, endLen: 8);
    } else if (_formatData is ModelMsgCreateVestingAccount) {
      // 创建投票委托账户
      _titleType = 'right';
      _titleText = 'createVestingAccount'.tr + '\r';
      _titleAdd = StringTool.hideAddressCenter(_formatData.toAddress,
          startLen: 0, endLen: 8);
    } else if (_formatData is ModelMsgEthereumTx) {
      // 合约交易
      _titleText = 'ethereumTx'.tr;
    } else if (_formatData is ModelMsgIssueToken) {
      // 创建prc10代币
      _titleType = 'right';
      _titleText = 'issueToken'.tr + '\r';
      _titleAdd = _formatData.symbol;
    } else if (_formatData is ModelMsgMintToken) {
      // 增发prc10代币
      _titleType = 'right';
      _titleText = 'mintToken'.tr + '\r';
      _titleAdd = _formatData.symbol;
    } else if (_formatData is ModelMsgBurnToken) {
      // 销毁prc10代币
      _titleType = 'right';
      _titleText = 'burnToken'.tr + '\r';
      _titleAdd = _formatData.symbol;
    } else if (_formatData is ModelMsgEditToken) {
      // 修改prc10代币
      _titleType = 'right';
      _titleText = 'editToken'.tr + '\r';
      _titleAdd = _formatData.symbol;
    } else if (_formatData is ModelMsgTransferOwnerToken) {
      // 转移代币所有权
      _titleType = 'right';
      _titleText = 'transferOwnerToken'.tr + '\r';
      _titleAdd = _formatData.symbol;
    } else if (_formatData is ModelMsgCreatePool) {
      // 创建liquidity交易池
      _titleText = 'createPool'.tr;
    } else if (_formatData is ModelMsgDepositWithinBatch) {
      // 添加liquidity交易池存款
      _titleText = 'depositWithinBatch'.tr;
    } else if (_formatData is ModelMsgWithdrawWithinBatch) {
      // 提取liquidity交易池存款
      _titleText = 'withdrawWithinBatch'.tr;
    } else if (_formatData is ModelMsgSwapWithinBatch) {
      // liquidity交易
      _titleText = 'swapWithinBatch'.tr;
    } else if (_formatData is Map &&
        _formatData['type'] == enumTokenType.prc20) {
      // 合约交易
      if (_formatData['from'] == accountAddress) {
        _titleType = 'right';
        _titleText = 'transferTo'.tr + '\r';
        _titleAdd = StringTool.hideAddressCenter(_formatData['to'],
            startLen: 4, endLen: 8);
      } else if (_formatData['to'] == accountAddress) {
        // 转入
        _titleType = 'left';
        _titleText = '\r' + 'transferIn'.tr;
        _titleAdd = StringTool.hideAddressCenter(_formatData['from'],
            startLen: 4, endLen: 8);
      }
    }
    if (_titleType == 'normal') {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: _titleText),
          ],
        ),
      );
    } else if (_titleType == 'right') {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: _titleText),
            TextSpan(
              text: _titleAdd,
              style: TextStyle(color: appTheme.colors.primaryColor),
            ),
          ],
        ),
      );
    } else if (_titleType == 'left') {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: _titleAdd,
              style: TextStyle(color: appTheme.colors.primaryColor),
            ),
            TextSpan(text: _titleText),
          ],
        ),
      );
    }
    return const Text('');
  }
}
