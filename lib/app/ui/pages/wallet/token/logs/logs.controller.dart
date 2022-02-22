import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WalletTokenLogsPageState {
  // 账户信息
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo (AccountModel value) => _accountInfo.value = value;
  // 代币信息
  final Rx<TokenModel> _tokenInfo = TokenModel().obs;
  TokenModel get tokenInfo => _tokenInfo.value;
  set tokenInfo (TokenModel value) => _tokenInfo.value = value;
  // 全部交易记录
  final RxList<TransferLogModel> transferLogsAll = RxList<TransferLogModel>();
  // 转出交易记录
  final RxList<TransferLogModel> transferLogsSend = RxList<TransferLogModel>();
  // 收款交易记录
  final RxList<TransferLogModel> transferLogsReceive = RxList<TransferLogModel>();
  // 交易记录分页 0代表没有更多
  // 全部交易记录分页
  final Rx<int> _logsPageAll = 1.obs;
  int get logsPageAll => _logsPageAll.value;
  set logsPageAll (int value) => _logsPageAll.value = value;
  // 转账交易记录分页
  final Rx<int> _logsPageSend = 1.obs;
  int get logsPageSend => _logsPageSend.value;
  set logsPageSend (int value) => _logsPageSend.value = value;
  // 收款交易记录分页
  final Rx<int> _logsPageReceive = 1.obs;
  int get logsPageReceive => _logsPageReceive.value;
  set logsPageReceive (int value) => _logsPageReceive.value = value;
}

class WalletTokenLogsPageController extends GetxController with GetTickerProviderStateMixin {
  WalletTokenLogsPageController();
  WalletTokenLogsPageState state = WalletTokenLogsPageState();
  DataAccountController dataAccount = Get.find();

  TabController? tabController;
  RefreshController allRefreshController = RefreshController();
  RefreshController sendRefreshController = RefreshController();
  RefreshController receiveRefreshController = RefreshController();

  @override
  onInit() {
    super.onInit();
    // 初始化tab
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }
  
  @override
  void onReady() {
    String? token = Get.parameters['token'];
    if (token == null) return Get.back();
    _initTokenInfo(token);
  }

  // 获取token
  _initTokenInfo (String minUnit) async {
    LLoading.showLoading();
    state.accountInfo = dataAccount.state.nowAccount!;
    var token = dataAccount.state.nowAccount?.tokenList.firstWhere((element) => element.minUnit == minUnit);
    if (token != null) {
      state.tokenInfo = token;
    } else {
      token = await httpToolApp.getCoinInfo(minUnit);
    }
    var resultAmount = await httpToolApp.getAccountBalance(state.accountInfo.address, minUnit);
    if (token != null) token.amount = resultAmount?.data;
    if (token == null) return Get.back();
    state.tokenInfo = token;
    state._tokenInfo.refresh();
    // _getTransferLogs(WalletTokenLogsPageTabType.all);
    await Future.wait([
      _getTransferLogs(WalletTokenLogsPageTabType.send),
      _getTransferLogs(WalletTokenLogsPageTabType.receive)
    ]);
    LLoading.dismiss();
  }
  // 获取代币价格

  // 获取交易记录
  Future<void> _getTransferLogs(
    WalletTokenLogsPageTabType type,
  ) async {
    HttpToolResponse? result;
    if (type == WalletTokenLogsPageTabType.send) {
      result = await httpToolApp.getAccountSenderList(
        dataAccount.state.nowAccount?.address??'',
        page: state.logsPageSend,
        limit: 10
      );
    } else if (type == WalletTokenLogsPageTabType.receive) {
      result = await httpToolApp.getAccountRecipientList(
        dataAccount.state.nowAccount?.address??'',
        page: state.logsPageReceive,
        limit: 10
      );
    }
    if (result == null) return;
    if (type == WalletTokenLogsPageTabType.send) {
      if (result.data == null || result.data['tx_responses'].length < 10) {
        state.logsPageSend = 0;
      } else {
        state.logsPageSend++;
      }
    }
    if (type == WalletTokenLogsPageTabType.receive) {
      if (result.data == null || result.data['tx_responses'].length < 10) {
        state.logsPageReceive = 0;
      } else {
        state.logsPageReceive++;
      }
    }
    if (result.data == null) return;
    for (var res in result.data['tx_responses']) {
      TransferLogModel _item = TransferLogModel()
        ..blockHeight = int.parse(res['height'])
        ..hash = res['txhash']
        ..status = (res['code'] == 0 ? TransferLogStatusEnum.success : TransferLogStatusEnum.fail)
        ..type = (type == WalletTokenLogsPageTabType.send ? TransferLogTypeEnum.send : TransferLogTypeEnum.receive)
        ..time = DateTime.parse(res['timestamp'])
        ..items = [
          for (var _res in res['tx']['body']['messages'])
            TransferLogItemModel()..toAddress = _res['to_address']
              ..formAddress = _res['from_address']
              ..coin = (
                TokenModel()..amount=_res['amount'][0]['amount']
                            ..minUnit=_res['amount'][0]['denom']
                            ..scale=state.tokenInfo.scale
              )
        ];
      if (type == WalletTokenLogsPageTabType.send) {
        state.transferLogsSend.add(_item);
      } else if (type == WalletTokenLogsPageTabType.receive) {
        state.transferLogsReceive.add(_item);
      }
    }
  }

  // 转账
  onToSend() {
    Get.toNamed(PlugRoutesNames.walletTokenSend(state.tokenInfo.minUnit));
  }
  // 收款
  onToReceive() {
    Get.toNamed(PlugRoutesNames.walletTokenReceive(state.tokenInfo.minUnit));
  }

  // 刷新
  Future<void> onRefresh(
    WalletTokenLogsPageTabType type,
  ) async {
    if (type == WalletTokenLogsPageTabType.all) {
      state.transferLogsAll.clear();
      await _getTransferLogs(type);
    }
    if (type == WalletTokenLogsPageTabType.send) {
      state.transferLogsSend.clear();
      state.logsPageSend = 1;
      await _getTransferLogs(type);
    }
    if (type == WalletTokenLogsPageTabType.receive) {
      state.transferLogsReceive.clear();
      state.logsPageReceive = 1;
      await _getTransferLogs(type);
    }
    refresh();
  }
  // 加载更多
  Future<void> onLoading(
    WalletTokenLogsPageTabType type,
  ) async {
    if (type == WalletTokenLogsPageTabType.all) {
      await _getTransferLogs(type);
    }
    if (type == WalletTokenLogsPageTabType.send) {
      await _getTransferLogs(type);
    }
    if (type == WalletTokenLogsPageTabType.receive) {
      await _getTransferLogs(type);
    }
  }
  // 前往详情页
  onGoToDetail(String hash) {
    print(hash);
    Get.toNamed(PlugRoutesNames.walletTokenLogsDetail(hash));
  }
}


enum WalletTokenLogsPageTabType {
  /// 全部
  all,
  /// 转出
  send,
  /// 转入
  receive,
}