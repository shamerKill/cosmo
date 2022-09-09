import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:plug/app/data/models/response/msgs.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/data/services/data.services.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/number.dart';

class WalletTokenLogsDetailPageState {
  // 交易详情
  final Rx<TransferLogModel> _logDetail = TransferLogModel().obs;
  TransferLogModel get logDetail => _logDetail.value;
  set logDetail(TransferLogModel value) => _logDetail.value = value;
  // 交易数量 / 单位
  RxList<TokenModel> amountVolume = RxList([]);
  // 交易内容文本
  final Rx<String> _showInputText = ''.obs;
  String get showInputText => _showInputText.value;
  set showInputText(String value) => _showInputText.value = value;
  // 类型
  final Rx<String> _logTypeTitle = ''.obs;
  String get logTypeTitle => _logTypeTitle.value;
  set logTypeTitle(String value) => _logTypeTitle.value = value;
}

class WalletTokenLogsDetailPageController extends GetxController {
  WalletTokenLogsDetailPageController();
  WalletTokenLogsDetailPageState state = WalletTokenLogsDetailPageState();

  DataAccountController dataAccount = Get.find();
  DataCoinsController dataCoin = Get.find();

  @override
  onReady() {
    String? hash = Get.parameters['hash'];
    if (hash == null) return Get.back();
    _initDetail(hash);
  }

  @override
  onClose() {
    LLoading.dismiss();
  }

  // 初始化数据
  _initDetail(String hash) async {
    var item = dataToolServer.transferLogItem;
    if (item == null) return Get.back();
    // 手续费
    var _feeTokenInfo = await dataToolServer.getTokenInfo(item.fee.minUnit);
    _feeTokenInfo.amount = item.fee.amount;
    item.fee = _feeTokenInfo;
    state.logDetail = item;
    _setTitle(item);
  }

  // 设置标题
  _setTitle(TransferLogModel item) {
    var _formatData = item.rawLog;
    var accountAddress = dataAccount.state.nowAccount?.address ?? '';

    if (_formatData is ModelMsgSend) {
      // 单对单转账
      if (_formatData.fromAddress == accountAddress) {
        // 转入
        state.logTypeTitle = 'transferOut'.tr;
      } else if (_formatData.toAddress == accountAddress) {
        // 转出
        state.logTypeTitle = 'transferIn'.tr;
      }
    } else if (_formatData is ModelMsgMultiSend) {
      // 多人转账
      if (_formatData.inputs
              .firstWhereOrNull((_item) => _item.address == accountAddress) !=
          null) {
        // 多人转出
        state.logTypeTitle = 'multiTransferOut'.tr;
      } else if (_formatData.outputs
              .firstWhereOrNull((_item) => _item.address == accountAddress) !=
          null) {
        // 多人转入
        state.logTypeTitle = 'multiTransferIn'.tr;
      }
    } else if (_formatData is ModelMsgSetWithdrawAddress) {
      // 设置提现地址
      state.logTypeTitle = 'setWithdrawAddress'.tr;
    } else if (_formatData is ModelMsgWithdrawDelegatorReward) {
      // 提取委托奖励
      state.logTypeTitle = 'withdrawDelegatorReward'.tr;
    } else if (_formatData is ModelMsgWithdrawValidatorCommission) {
      // 提取验证者节点奖励
      state.logTypeTitle = 'withdrawValidatorReward'.tr;
    } else if (_formatData is ModelMsgFundCommunityPool) {
      // 向社区资金池捐赠
      state.logTypeTitle = 'fundCommunityPool'.tr;
    } else if (_formatData is ModelMsgSubmitEvidence) {
      // 举报消息
      state.logTypeTitle = 'submitEvidence'.tr;
    } else if (_formatData is ModelMsgGrantAllowance) {
      // 授权用户可用权限
      state.logTypeTitle = 'grantAllowance'.tr + '\r';
    } else if (_formatData is ModelMsgRevokeAllowance) {
      // 撤销用户可用权限
      state.logTypeTitle = 'revokeAllowance'.tr + '\r';
    } else if (_formatData is ModelMsgSubmitProposal) {
      // 提案申请
      state.logTypeTitle = 'submitProposal'.tr;
    } else if (_formatData is ModelMsgVote) {
      // 进行提案投票
      state.logTypeTitle = 'vote'.tr + '\r';
    } else if (_formatData is ModelMsgVoteWeighted) {
      // 进行提案权重投票
      state.logTypeTitle = 'voteWeighted'.tr + '\r';
    } else if (_formatData is ModelMsgDeposit) {
      // 存入提案资金
      state.logTypeTitle = 'deposit'.tr + '\r';
    } else if (_formatData is ModelMsgUnJail) {
      // 验证者解禁
      state.logTypeTitle = 'unJail'.tr;
    } else if (_formatData is ModelMsgCreateValidator) {
      // 创建验证者
      state.logTypeTitle = 'createValidator'.tr;
    } else if (_formatData is ModelMsgEditValidator) {
      // 编辑验证者
      state.logTypeTitle = 'editValidator'.tr;
    } else if (_formatData is ModelMsgDelegate) {
      // 验证者委托
      state.logTypeTitle = 'delegate'.tr + '\r';
    } else if (_formatData is ModelMsgBeginRedelegate) {
      // 验证者转质押
      state.logTypeTitle = 'beginReDelegate'.tr + '\r';
    } else if (_formatData is ModelMsgUndelegate) {
      // 验证者取消质押
      state.logTypeTitle = 'unDelegate'.tr + '\r';
    } else if (_formatData is ModelMsgCreateVestingAccount) {
      // 创建投票委托账户
      state.logTypeTitle = 'createVestingAccount'.tr + '\r';
    } else if (_formatData is ModelMsgEthereumTx) {
      // 合约交易
      state.logTypeTitle = 'ethereumTx'.tr;
    } else if (_formatData is ModelMsgIssueToken) {
      // 创建prc10代币
      state.logTypeTitle = 'issueToken'.tr + '\r';
    } else if (_formatData is ModelMsgMintToken) {
      // 增发prc10代币
      state.logTypeTitle = 'mintToken'.tr + '\r';
    } else if (_formatData is ModelMsgBurnToken) {
      // 销毁prc10代币
      state.logTypeTitle = 'burnToken'.tr + '\r';
    } else if (_formatData is ModelMsgEditToken) {
      // 修改prc10代币
      state.logTypeTitle = 'editToken'.tr + '\r';
    } else if (_formatData is ModelMsgTransferOwnerToken) {
      // 转移代币所有权
      state.logTypeTitle = 'transferOwnerToken'.tr + '\r';
    } else if (_formatData is ModelMsgCreatePool) {
      // 创建liquidity交易池
      state.logTypeTitle = 'createPool'.tr;
    } else if (_formatData is ModelMsgDepositWithinBatch) {
      // 添加liquidity交易池存款
      state.logTypeTitle = 'depositWithinBatch'.tr;
    } else if (_formatData is ModelMsgWithdrawWithinBatch) {
      // 提取liquidity交易池存款
      state.logTypeTitle = 'withdrawWithinBatch'.tr;
    } else if (_formatData is ModelMsgSwapWithinBatch) {
      // liquidity交易
      state.logTypeTitle = 'swapWithinBatch'.tr;
    } else if (_formatData is Map &&
        _formatData['type'] == enumTokenType.prc20) {
      if (_formatData['from'] == accountAddress) {
        state.logTypeTitle = 'contractTransferOut'.tr;
      } else if (_formatData['to'] == accountAddress) {
        // 转入
        state.logTypeTitle = 'contractTransferIn'.tr;
      }
    }
    if (_formatData is Map && _formatData['type'] == enumTokenType.prc20) {
      _showPrc20Volume(item);
    } else {
      _showDetail(item);
    }
  }

  // 交易详情展示
  _showDetail(TransferLogModel item) async {
    // 获取交易数量
    var _formatData = item.rawLog;
    var accountAddress = dataAccount.state.nowAccount?.address ?? '';
    if (_formatData is ModelMsgSend) {
      // 单对单转账
      if (_formatData.fromAddress == accountAddress) {
        // 转出
        for (var _item in _formatData.amount) {
          var _tokenRes = await dataToolServer.getTokenInfo(_item.denom);
          _tokenRes.amount = '-' +
              NumberTool.amountToBalance(_item.amount, scale: _tokenRes.scale);
          state.amountVolume.add(_tokenRes);
        }
      }
      if (_formatData.toAddress == accountAddress) {
        // 转入
        for (var _item in _formatData.amount) {
          var _tokenRes = await dataToolServer.getTokenInfo(_item.denom);
          _tokenRes.amount = '+' +
              NumberTool.amountToBalance(_item.amount, scale: _tokenRes.scale);
          state.amountVolume.add(_tokenRes);
        }
      }
    } else if (_formatData is ModelMsgMultiSend) {
      // 多人转账
      for (var _item in _formatData.inputs) {
        if (_item.address == accountAddress) {
          for (var _item2 in _item.coins) {
            var _tokenRes = await dataToolServer.getTokenInfo(_item2.denom);
            _tokenRes.amount = '-' +
                NumberTool.amountToBalance(_item2.amount,
                    scale: _tokenRes.scale);
            state.amountVolume.add(_tokenRes);
          }
        }
      }
      for (var _item in _formatData.outputs) {
        if (_item.address == accountAddress) {
          for (var _item2 in _item.coins) {
            var _tokenRes = await dataToolServer.getTokenInfo(_item2.denom);
            _tokenRes.amount = '+' +
                NumberTool.amountToBalance(_item2.amount,
                    scale: _tokenRes.scale);
            state.amountVolume.add(_tokenRes);
          }
        }
      }
    } else if (_formatData is ModelMsgSetWithdrawAddress) {
      // 设置提现地址
    } else if (_formatData is ModelMsgWithdrawDelegatorReward) {
      // 提取委托奖励
    } else if (_formatData is ModelMsgWithdrawValidatorCommission) {
      // 提取验证者节点奖励
    } else if (_formatData is ModelMsgFundCommunityPool) {
      // 向社区资金池捐赠
      if (_formatData.depositor == accountAddress) {
        for (var _item in _formatData.amount) {
          var _tokenRes = await dataToolServer.getTokenInfo(_item.denom);
          _tokenRes.amount = '-' +
              NumberTool.amountToBalance(_item.amount, scale: _tokenRes.scale);
          state.amountVolume.add(_tokenRes);
        }
      }
    } else if (_formatData is ModelMsgSubmitEvidence) {
      // 举报消息
    } else if (_formatData is ModelMsgGrantAllowance) {
      // 授权用户可用权限
    } else if (_formatData is ModelMsgRevokeAllowance) {
      // 撤销用户可用权限
    } else if (_formatData is ModelMsgSubmitProposal) {
      // 提案申请
      if (_formatData.proposer == accountAddress) {
        for (var _item in _formatData.initialDeposit) {
          var _tokenRes = await dataToolServer.getTokenInfo(_item.denom);
          _tokenRes.amount = '-' +
              NumberTool.amountToBalance(_item.amount, scale: _tokenRes.scale);
          state.amountVolume.add(_tokenRes);
        }
      }
    } else if (_formatData is ModelMsgVote) {
      // 进行提案投票
    } else if (_formatData is ModelMsgVoteWeighted) {
      // 进行提案权重投票
    } else if (_formatData is ModelMsgDeposit) {
      // 存入提案资金
      if (_formatData.depositor == accountAddress) {
        for (var _item in _formatData.amount) {
          var _tokenRes = await dataToolServer.getTokenInfo(_item.denom);
          _tokenRes.amount = '+' +
              NumberTool.amountToBalance(_item.amount, scale: _tokenRes.scale);
          state.amountVolume.add(_tokenRes);
        }
      }
    } else if (_formatData is ModelMsgUnJail) {
      // 验证者解禁
    } else if (_formatData is ModelMsgCreateValidator) {
      // 创建验证者
      if (_formatData.delegatorAddress == accountAddress) {
        var _tokenRes =
            await dataToolServer.getTokenInfo(_formatData.value.denom);
        _tokenRes.amount = '-' +
            NumberTool.amountToBalance(_formatData.value.amount,
                scale: _tokenRes.scale);
        state.amountVolume.add(_tokenRes);
      }
    } else if (_formatData is ModelMsgEditValidator) {
      // 编辑验证者
    } else if (_formatData is ModelMsgDelegate) {
      // 验证者委托
      if (_formatData.delegatorAddress == accountAddress) {
        var _tokenRes =
            await dataToolServer.getTokenInfo(_formatData.amount.denom);
        _tokenRes.amount = '-' +
            NumberTool.amountToBalance(_formatData.amount.amount,
                scale: _tokenRes.scale);
        state.amountVolume.add(_tokenRes);
      }
    } else if (_formatData is ModelMsgBeginRedelegate) {
      // 验证者转质押
    } else if (_formatData is ModelMsgUndelegate) {
      // 验证者取消质押
    } else if (_formatData is ModelMsgCreateVestingAccount) {
      // 创建投票委托账户
      if (_formatData.fromAddress == accountAddress) {
        for (var _item in _formatData.amount) {
          var _tokenRes = await dataToolServer.getTokenInfo(_item.denom);
          _tokenRes.amount = '-' +
              NumberTool.amountToBalance(_item.amount, scale: _tokenRes.scale);
          state.amountVolume.add(_tokenRes);
        }
      } else if (_formatData.toAddress == accountAddress) {
        for (var _item in _formatData.amount) {
          var _tokenRes = await dataToolServer.getTokenInfo(_item.denom);
          _tokenRes.amount = '+' +
              NumberTool.amountToBalance(_item.amount, scale: _tokenRes.scale);
          state.amountVolume.add(_tokenRes);
        }
      }
    } else if (_formatData is ModelMsgEthereumTx) {
      // 合约交易
    } else if (_formatData is ModelMsgIssueToken) {
      // 创建prc10代币
    } else if (_formatData is ModelMsgMintToken) {
      // 增发prc10代币
    } else if (_formatData is ModelMsgBurnToken) {
      // 销毁prc10代币
    } else if (_formatData is ModelMsgEditToken) {
      // 修改prc10代币
    } else if (_formatData is ModelMsgTransferOwnerToken) {
      // 转移代币所有权
    } else if (_formatData is ModelMsgCreatePool) {
      // 创建liquidity交易池
    } else if (_formatData is ModelMsgDepositWithinBatch) {
      // 添加liquidity交易池存款
      if (_formatData.depositorAddress == accountAddress) {
        for (var _item in _formatData.depositCoins) {
          var _tokenRes = await dataToolServer.getTokenInfo(_item.denom);
          _tokenRes.amount = '-' +
              NumberTool.amountToBalance(_item.amount, scale: _tokenRes.scale);
          state.amountVolume.add(_tokenRes);
        }
      }
    } else if (_formatData is ModelMsgWithdrawWithinBatch) {
      // 提取liquidity交易池存款
      if (_formatData.withdrawerAddress == accountAddress) {
        var _tokenRes =
            await dataToolServer.getTokenInfo(_formatData.poolCoin.denom);
        _tokenRes.amount = '+' +
            NumberTool.amountToBalance(_formatData.poolCoin.amount,
                scale: _tokenRes.scale);
        state.amountVolume.add(_tokenRes);
      }
    } else if (_formatData is ModelMsgSwapWithinBatch) {
      // liquidity交易
    }
    state.amountVolume.refresh();
    // 获取原始数据
    LLoading.showLoading();
    var result = await httpToolApp.getChainLogDetail(item.hash);
    if (result.status != 0) return;
    state.showInputText = result.data['tx_response']['raw_log'];
    LLoading.dismiss();
  }

  // 展示数量
  _showPrc20Volume(TransferLogModel item) async {
    LLoading.showLoading();
    String direction =
        item.rawLog['from'] == dataAccount.state.nowAccount?.address
            ? '- '
            : ' ';
    state.amountVolume.add(TokenModel()
      ..amount = (direction + item.rawLog['amount'])
      ..symbol = item.rawLog['symbol']);

    // 获取详情
    var result = await browserToolServer.getPrc20TokenLogDetail(item.hash);
    if (result?.status != 0 && result?.data['errno'] != 200) return;
    state.logDetail.fee
      ..scale = dataCoin.state.baseCoin.scale
      ..symbol = dataCoin.state.baseCoin.symbol
      ..amount = ((BigInt.parse(result?.data['data']['GasLimit']) *
                  BigInt.parse(result?.data['data']['GasPrice'])) ~/
              BigInt.from(1000))
          .toString();
    state._logDetail.refresh();
    state.showInputText = result?.data['data']['Input'];
    LLoading.dismiss();
  }

  // 复制文本
  onCopyText(String text) {
    FlutterClipboard.copy(text)
        .then((value) => LToast.success('SuccessWithCopy'.tr));
  }

  // 查看详情
  goToDetail() {
    Get.toNamed(PlugRoutesNames.dappWebview, parameters: {
      'link': base64.encode(utf8.encode(
          'https://www.plugchain.network/v2/transDetail?id=${state.logDetail.hash}'))
    });
  }
}
