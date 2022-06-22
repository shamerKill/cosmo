import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/services/data.services.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/chain_message.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:plug/app/ui/utils/string.dart';
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
    String? tokenMark = Get.parameters['token'];
    if (tokenMark == null) return Get.back();
    _initTokenInfo(tokenMark);
  }

  // 获取token
  _initTokenInfo (String tokenMark) async {
    LLoading.showLoading();
    state.accountInfo = dataAccount.state.nowAccount!;
    enumAccountType _tokenType = StringTool.checkChainAddress(tokenMark) ? enumAccountType.prc20 : enumAccountType.prc10;
    var token = dataAccount.state.nowAccount?.tokenList.firstWhere(
      (_itemToken) => _tokenType == enumAccountType.prc10 ? _itemToken.minUnit == tokenMark : _itemToken.contractAddress == tokenMark
    );
    if (token != null) {
      state.tokenInfo = token;
    } else {
      token = _tokenType == enumAccountType.prc10 ?
        (await httpToolApp.getCoinInfo(tokenMark)) :
        (await httpToolServer.searchToken20Info(tokenMark)).data?['token'];
    }
    var resultAmount = await httpToolApp.getAccountBalance(state.accountInfo.address, tokenMark);
    if (token == null) return Get.back();
    token.amount = resultAmount?.data??'';
    state.tokenInfo = token;
    state._tokenInfo.refresh();
    await _getTransferLogs(refresh: true);
    LLoading.dismiss();
  }
  // 获取代币价格

  // 获取交易记录
  Future<void> _getTransferLogs({ bool refresh = false }) async {
    if (state.tokenInfo.type == enumTokenType.prc10) return _getTransferLogsPRC10(refresh);
    if (state.tokenInfo.type == enumTokenType.prc20) return _getTransferLogsPRC20(refresh);
  }
  Future<void> _getTransferLogsPRC10(bool refresh) async {
    if (refresh) state.logsPageAll = 1;
    HttpToolResponse? result = await httpToolServer.getAccountLogsList(
      dataAccount.state.nowAccount?.address??'',
      state.tokenInfo.minUnit,
      page: state.logsPageAll,
      limit: 10
    );
    if (refresh) state.transferLogsAll.clear();
    if (result == null) return;
    if (result.data == null || result.data['data'] is! Iterable) {
      state.logsPageAll = 0;
      return;
    } else if (result.data['data'].length < 10) {
      state.logsPageAll = 0;
    } else {
      state.logsPageAll++;
    }
    for (var res in result.data['data']) {
      var _tx = res['Tx'];
      var _formatMsg = ChainMessageTool.formatAny(res['Msg']);
      var _item = TransferLogModel()
        ..time = DateTime.parse(_tx['create_time'])
        ..blockHeight = _tx['height']
        ..memo = _tx['memo']
        ..hash = _tx['hash']
        ..status = _tx['code'] == 0 ? TransferLogStatusEnum.success : TransferLogStatusEnum.fail
        ..fee = (
          TokenModel()
            ..amount = BigInt.from(_tx['fee_amount']).toString()
            ..minUnit = _tx['fee_coin']
        )
        ..rawLog = _formatMsg;
      state.transferLogsAll.add(_item);
    }
  }
  Future<void> _getTransferLogsPRC20(bool refresh) async {
    if (refresh) state.logsPageAll = 1;
    HttpToolResponse? result = await browserToolServer.getAccountPrc20TokenLogs(
      dataAccount.state.nowAccount?.address??'',
      state.tokenInfo.contractAddress,
      page: state.logsPageAll,
      limit: 10
    );
    if (refresh) state.transferLogsAll.clear();
    if (result == null) return;
    if (result.data == null || result.data['errno'] != 200 || result.data['data'] is! Map || result.data['data']['List'] is! Iterable) {
      state.logsPageAll = 0;
      return;
    } else if (result.data['data']['List'].length < 10) {
      state.logsPageAll = 0;
    }  else {
      state.logsPageAll++;
    }
    for (var res in result.data['data']['List']) {
      var _item = TransferLogModel()
        ..time = DateTime.parse(res['Date'])
        ..blockHeight = res['Block']
        ..hash = res['Hex']
        ..status = res['Status'] == 'success' ? TransferLogStatusEnum.success : TransferLogStatusEnum.fail
        // 交易数量
        ..rawLog = {
          'type': enumTokenType.prc20,
          'from': res['From'],
          'to': res['To'],
          'amount': res['Balance'],
          'symbol': state.tokenInfo.symbol,
        };
      // 获取交易手续费
      state.transferLogsAll.add(_item);
    }
  }

  // 转账
  onToSend() async {
    await Get.toNamed(PlugRoutesNames.walletTokenSend(state.tokenInfo.type == enumTokenType.prc10 ? state.tokenInfo.minUnit : state.tokenInfo.contractAddress));
    _refreshData();
  }
  // 收款
  onToReceive() async {
    await Get.toNamed(PlugRoutesNames.walletTokenReceive(state.tokenInfo.type == enumTokenType.prc10 ? state.tokenInfo.minUnit : state.tokenInfo.contractAddress));
    _refreshData();
  }

  // 刷新
  Future<void> onRefresh() async {
    await _getTransferLogs(refresh: true);
    refresh();
  }
  // 加载更多
  Future<void> onLoading() async {
    await _getTransferLogs();
  }
  // 前往详情页
  onGoToDetail(TransferLogModel item) async {
    dataToolServer.setMemTransferLogItem(item);
    await Get.toNamed(PlugRoutesNames.walletTokenLogsDetail(item.hash));
  }
  // 刷新页面
  _refreshData() {
    if (state.tokenInfo.type == enumTokenType.prc10) {
      _initTokenInfo(state.tokenInfo.minUnit);
    } else {
      _initTokenInfo(state.tokenInfo.contractAddress);
    }
  }
}

