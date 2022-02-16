import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';

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

class WalletTokenLogsPageController extends GetxController with GetSingleTickerProviderStateMixin {
  WalletTokenLogsPageController();
  WalletTokenLogsPageState state = WalletTokenLogsPageState();

  TabController? tabController;
  
  @override
  void onInit() {
    super.onInit();
    String? token = Get.parameters['token'];
    if (token == null) return Get.back();
    // 初始化tab
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    state.tokenInfo
      ..symbol = 'p$token'
      ..minUnit = token
      ..name = 'p$token'
      ..amount = '10000123'
      ..scale = 0;
    _getTransferLogs(WalletTokenLogsPageTabType.all);
    _getTransferLogs(WalletTokenLogsPageTabType.send);
    _getTransferLogs(WalletTokenLogsPageTabType.receive);
  }

  // 获取交易记录
  _getTransferLogs(
    WalletTokenLogsPageTabType type,
  ) {
    bool _random = Random().nextBool();
    TransferLogModel oneItem = TransferLogModel()
      ..blockHeight = 10
      ..time = DateTime.now()
      ..status = _random ? TransferLogStatusEnum.success : TransferLogStatusEnum.fail
      ..type = _random ? TransferLogTypeEnum.receive : TransferLogTypeEnum.send
      ..hash = '5F6BA29583ABB097325D1C3A6A41D021E3440E793F68ABA5735D652DDD4BB0AF'
      ..items = [
        TransferLogItemModel()
          ..toAddress = 'gxasodifj9asdflkjag09asdflkjasdg0asdf'
          ..formAddress = 'gxasjdifolxzkcjvaoisdfjdxgaoisdjf'
          ..coin = (
            TokenModel()
              ..setData(state.tokenInfo.toJson())
              ..amount = '123123'
          ),
      ];
    List<TransferLogModel> items = [];
    for (int i = 0; i < 10; i++) {
      items.add(oneItem);
    }
    if (type == WalletTokenLogsPageTabType.all) {
      state.transferLogsAll.addAll(items);
    } else if (type == WalletTokenLogsPageTabType.send) {
      state.transferLogsSend.addAll(items);
    } else if (type == WalletTokenLogsPageTabType.receive) {
      state.transferLogsReceive.addAll(items);
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
      await Future.delayed(const Duration(seconds: 1));
      state.transferLogsAll.clear();
      _getTransferLogs(type);
    }
    if (type == WalletTokenLogsPageTabType.send) {
      await Future.delayed(const Duration(seconds: 1));
      state.transferLogsSend.clear();
      _getTransferLogs(type);
    }
    if (type == WalletTokenLogsPageTabType.receive) {
      await Future.delayed(const Duration(seconds: 1));
      state.transferLogsReceive.clear();
      _getTransferLogs(type);
    }
    refresh();
  }
  // 加载更多
  Future<void> onLoading(
    WalletTokenLogsPageTabType type,
  ) async {
    if (type == WalletTokenLogsPageTabType.all) {
      await Future.delayed(const Duration(seconds: 1));
      _getTransferLogs(type);
    }
    if (type == WalletTokenLogsPageTabType.send) {
      await Future.delayed(const Duration(seconds: 1));
      _getTransferLogs(type);
    }
    if (type == WalletTokenLogsPageTabType.receive) {
      await Future.delayed(const Duration(seconds: 1));
      _getTransferLogs(type);
    }
  }
  // 前往详情页
  onGoToDetail(String hash) {
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