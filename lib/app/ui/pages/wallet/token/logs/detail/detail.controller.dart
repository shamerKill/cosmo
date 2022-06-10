import 'dart:convert';
import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:plug/app/data/models/response/msgs.dart';
import 'package:plug/app/data/services/data.services.dart';
import 'package:plug/app/ui/pages/wallet/token/logs/logs.controller.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';

class WalletTokenLogsDetailPageState {
  // 交易详情
  final Rx<TransferLogModel> _logDetail = TransferLogModel().obs;
  TransferLogModel get logDetail => _logDetail.value;
  set logDetail (TransferLogModel value) => _logDetail.value = value;
  // 类型
  final Rx<String> _logTypeTitle = ''.obs;
  String get logTypeTitle => _logTypeTitle.value;
  set logTypeTitle (String value) => _logTypeTitle.value = value;
}

class WalletTokenLogsDetailPageController extends GetxController {
  WalletTokenLogsDetailPageController();
  WalletTokenLogsDetailPageState state = WalletTokenLogsDetailPageState();

  DataAccountController dataAccount = Get.find();

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
    print(item.toJson());
    var _feeTokenInfo = await dataToolServer.getTokenInfo(item.fee.minUnit);
    _feeTokenInfo.amount = item.fee.amount;
    item.fee = _feeTokenInfo;
    state.logDetail = item;
    _setTitle(item);
  }
  // 设置标题
  _setTitle(TransferLogModel item) {
    var _formatData = item.rawLog;
    var accountAddress = dataAccount.state.nowAccount?.address??'';

    if (_formatData is ModelMsgSend) { // 单对单转账
      if (_formatData.fromAddress == accountAddress) { // 转入
        state.logTypeTitle = '转出'.tr;
      } else if (_formatData.toAddress == accountAddress) { // 转出
        state.logTypeTitle = '转入'.tr;
      }
    } else if (_formatData is ModelMsgMultiSend) { // 多人转账
      if (_formatData.inputs.firstWhereOrNull((_item) => _item.address == accountAddress) != null) { // 多人转出
        state.logTypeTitle = '多人转出'.tr;
      } else if (_formatData.outputs.firstWhereOrNull((_item) => _item.address == accountAddress) != null) { // 多人转入
        state.logTypeTitle = '多人转入'.tr;
      }
    } else if (_formatData is ModelMsgSetWithdrawAddress) { // 设置提现地址
      state.logTypeTitle = '设置提现地址'.tr;
    } else if (_formatData is ModelMsgWithdrawDelegatorReward) { // 提取委托奖励
      state.logTypeTitle = '提取质押奖励'.tr;
    } else if (_formatData is ModelMsgWithdrawValidatorCommission) { // 提取验证者节点奖励
      state.logTypeTitle = '提取验证者节点奖励'.tr;
    } else if (_formatData is ModelMsgFundCommunityPool) { // 向社区资金池捐赠
      state.logTypeTitle = '社区捐赠'.tr;
    } else if (_formatData is ModelMsgSubmitEvidence) { // 举报消息
      state.logTypeTitle = '交易举报'.tr;
    } else if (_formatData is ModelMsgGrantAllowance) { // 授权用户可用权限
      state.logTypeTitle = '账户授权'.tr + '\r';
    } else if (_formatData is ModelMsgRevokeAllowance) { // 撤销用户可用权限
      state.logTypeTitle = '撤销授权'.tr + '\r';
    } else if (_formatData is ModelMsgSubmitProposal) { // 提案申请
      state.logTypeTitle = '申请提案'.tr;
    } else if (_formatData is ModelMsgVote) { // 进行提案投票
      state.logTypeTitle = '提案投票'.tr + '\r';
    } else if (_formatData is ModelMsgVoteWeighted) { // 进行提案权重投票
      state.logTypeTitle = '提案权重投票'.tr + '\r';
    } else if (_formatData is ModelMsgDeposit) { // 存入提案资金
      state.logTypeTitle = '存入提案资金'.tr + '\r';
    } else if (_formatData is ModelMsgUnJail) { // 验证者解禁
      state.logTypeTitle = '验证者解禁'.tr;
    } else if (_formatData is ModelMsgCreateValidator) { // 创建验证者
      state.logTypeTitle = '创建验证者'.tr;
    } else if (_formatData is ModelMsgEditValidator) { // 编辑验证者
      state.logTypeTitle = '验证者信息修改'.tr;
    } else if (_formatData is ModelMsgDelegate) { // 验证者委托
      state.logTypeTitle = '委托质押'.tr + '\r';
    } else if (_formatData is ModelMsgBeginRedelegate) { // 验证者转质押
      state.logTypeTitle = '转让质押至'.tr + '\r';
    } else if (_formatData is ModelMsgUndelegate) { // 验证者取消质押
      state.logTypeTitle = '取消质押'.tr + '\r';
    } else if (_formatData is ModelMsgCreateVestingAccount) { // 创建投票委托账户
      state.logTypeTitle = '委托投票'.tr + '\r';
    } else if (_formatData is ModelMsgEthereumTx) { // 合约交易
      state.logTypeTitle = '合约交易'.tr;
    } else if (_formatData is ModelMsgIssueToken) { // 创建prc10代币
      state.logTypeTitle = '创建代币'.tr + '\r';
    } else if (_formatData is ModelMsgMintToken) { // 增发prc10代币
      state.logTypeTitle = '增发代币'.tr + '\r';
    } else if (_formatData is ModelMsgBurnToken) { // 销毁prc10代币
      state.logTypeTitle = '销毁代币'.tr + '\r';
    } else if (_formatData is ModelMsgEditToken) { // 修改prc10代币
      state.logTypeTitle = '修改代币'.tr + '\r';
    } else if (_formatData is ModelMsgTransferOwnerToken) { // 转移代币所有权
      state.logTypeTitle = '代币所有权'.tr + '\r';
    } else if (_formatData is ModelMsgCreatePool) { // 创建liquidity交易池
      state.logTypeTitle = '创建交易池'.tr;
    } else if (_formatData is ModelMsgDepositWithinBatch) { // 添加liquidity交易池存款
      state.logTypeTitle = '添加交易池存款'.tr;
    } else if (_formatData is ModelMsgWithdrawWithinBatch) { // 提取liquidity交易池存款
      state.logTypeTitle = '提取交易池存款'.tr;
    } else if (_formatData is ModelMsgSwapWithinBatch) { // liquidity交易
      state.logTypeTitle = 'swap交易'.tr;
    }
  }
  // 交易详情展示
  _showDetail(TransferLogModel item) {
  }
  // 复制文本
  onCopyText(String text) {
    FlutterClipboard.copy(text).then(( value ) => LToast.success('SuccessWithCopy'.tr));
  }
  // 查看详情
  goToDetail() {

  }
}