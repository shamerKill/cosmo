import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/services/data.services.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WalletTokenListPageState {
  // 展示列表0还是已添加1
  final Rx<int> _showType = 0.obs;
  int get showType => _showType.value;
  set showType(int value) => _showType.value = value;
  // 动画比例
  final Rx<double> _animationRatio = 1.0.obs;
  double get animationRatio => _animationRatio.value;
  set animationRatio(double value) => _animationRatio.value = value;
  // 当前账户数据
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo(AccountModel value) {
    _accountInfo.value = value;
    _accountInfo.refresh();
  }

  // 所有代币列表
  final RxList<TokenModel> allTokenList = RxList();
  // 所有代币列表分页/0代表没有更多
  final Rx<int> _allTokenPage = 1.obs;
  int get allTokenPage => _allTokenPage.value;
  set allTokenPage(int value) => _allTokenPage.value = value;
  // 是否在请求中
  final Rx<bool> _fetchLoading = false.obs;
  bool get fetchLoading => _fetchLoading.value;
  set fetchLoading(bool value) => _fetchLoading.value = value;

  // 代币列表key标识符
  final Rx<Key> _tokenListKey = const Key('token_list').obs;
  Key get tokenListKey => _tokenListKey.value;
  set tokenListKey(Key value) => _tokenListKey.value = value;
}

class WalletTokenListPageController extends GetxController
    with GetTickerProviderStateMixin {
  WalletTokenListPageController();
  // 动画控制器
  late AnimationController _controller;
  late Animation<double> _animation;
  // 搜索框
  TextEditingController searchTextController = TextEditingController();
  // 切换控制器
  late TabController tabBarController;
  RefreshController remoteListRefreshController = RefreshController();

  WalletTokenListPageState state = WalletTokenListPageState();
  DataAccountController accountController = Get.find();

  @override
  onInit() {
    super.onInit();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        state.animationRatio = _animation.value;
      });
    tabBarController = TabController(vsync: this, length: 2);
    tabBarController.addListener(_onToggleList);
    getTokenRemoteList();
    _getLocalTokenList();
    state._fetchLoading.listen((_type) {
      if (_type) LLoading.showBgLoading();
      if (!_type) LLoading.dismiss();
    });
  }

  @override
  onClose() {
    LLoading.dismiss();
    tabBarController.removeListener(_onToggleList);
  }

  // 切换列表
  onToggleList() {
    if (_controller.isAnimating) return;
    _controller.forward(from: 0.0);
    if (state.showType == 0) {
      state.showType = 1;
    } else if (state.showType == 1) {
      state.showType = 0;
    }
    tabBarController.animateTo(state.showType);
  }

  // 左右切换
  _onToggleList() {
    if (state.showType == tabBarController.index) return;
    _controller.forward(from: 0.0);
    state.showType = tabBarController.index;
  }

  // 搜索
  onSearch(String? text) async {
    if (text == null) return null;
    if (text == '') return getTokenRemoteList();
    state.fetchLoading = true;
    httpToolServer.searchTokenInfo(text).then((res) {
      if (res.status == 0) {
        state.allTokenList
          ..clear()
          ..add(res.data['token']);
      } else {
        LToast.info('tokenNotFind'.tr);
      }
    }).whenComplete(() => state.fetchLoading = false);
  }

  // 获取远程代币列表
  Future<dynamic> getTokenRemoteList() async {
    if (state.fetchLoading) return null;
    if (state.allTokenPage == 0) return null;
    state.fetchLoading = true;
    return httpToolApp
        .getChainTokensList(state.allTokenPage, limit: 10)
        .then((res) {
      if (res.status != 0) {
        state.allTokenPage = 0;
        remoteListRefreshController = RefreshController();
        return;
      }
      state.allTokenPage++;
      if (res.data.length < 10) {
        state.allTokenPage = 0;
        remoteListRefreshController = RefreshController();
      }
      return res.data.forEach((_item) => state.allTokenList.add(_item));
    }).whenComplete(() => state.fetchLoading = false);
  }

  // 获取当前账户
  _getLocalTokenList() {
    state.accountInfo = accountController.state.nowAccount!;
  }

  // 判断是否已添加有当前代币
  bool checkTokenIsAdd(String minUnit) {
    return state.accountInfo.tokenList
        .where((_token) =>
            (minUnit != '' && _token.minUnit == minUnit) ||
            _token.contractAddress == minUnit)
        .isNotEmpty;
  }

  // 添加/删除当前代币
  onToggleToken(TokenModel token) async {
    String tokenId = token.type == EnumTokenType.prc20
        ? token.contractAddress
        : token.minUnit;
    if (checkTokenIsAdd(tokenId)) {
      bool? result = await LBottomSheet.promptBottomSheet(
        title: 'tip'.tr,
        message: Text('deleteTokenTip'.tr + token.symbol + '?'),
      );
      if (result != true) return;
      var _index = state.accountInfo.tokenList.indexWhere((_item) =>
          _item.minUnit == tokenId || _item.contractAddress == tokenId);
      state.accountInfo.tokenList.removeAt(_index);
    } else {
      state.accountInfo.tokenList.add(token);
    }
    state.fetchLoading = true;
    accountController.updateAccount(state.accountInfo);
    state.allTokenList.refresh();
    await Future.delayed(const Duration(milliseconds: 500));
    state.fetchLoading = false;
  }

  // 我的代币列表移除当前代币
  onLocalRemoveToken(TokenModel token) async {
    String tokenId = token.type == EnumTokenType.prc20
        ? token.contractAddress
        : token.minUnit;
    bool? result = await LBottomSheet.promptBottomSheet(
      title: 'tip'.tr,
      message: Text('deleteTokenTip'.tr + token.symbol + '?'),
    );
    if (result != true) return;
    var _index = state.accountInfo.tokenList.indexWhere((_item) =>
        _item.minUnit == tokenId || _item.contractAddress == tokenId);
    state.accountInfo.tokenList.removeAt(_index);
    accountController.updateAccount(state.accountInfo);
    state._accountInfo.refresh();
    LToast.success('SuccessWithDeleteToken'.tr);
  }

  // 我的代币列表排序
  onUserAssetsReorder(int oldIndex, int newIndex) {
    var _token = state.accountInfo.tokenList.removeAt(oldIndex + 1);
    if (newIndex >= oldIndex) {
      state.accountInfo.tokenList.insert(newIndex, _token);
    } else {
      state.accountInfo.tokenList.insert(newIndex + 1, _token);
    }
    accountController.updateAccount(state.accountInfo);
    state._accountInfo.refresh();
  }

  // 一键获取所有资产
  onGetUserAllAssets() async {
    bool? result = await LBottomSheet.promptBottomSheet(
      title: 'tip'.tr,
      message: Text('getAssertTip'.tr),
    );
    if (result != true) return;
    state.fetchLoading = true;
    // prc10代币
    var tokenList10 =
        await httpToolApp.getAccountPrc10AllBalance(state.accountInfo.address);
    // prc20代币
    var tokenList20 = await browserToolServer
        .getAccountPrc20AllBalance(state.accountInfo.address);
    if (tokenList10?.data != null) {
      for (var i = 0; i < tokenList10?.data.length; i++) {
        var _item = tokenList10?.data[i];
        if (!checkTokenIsAdd(_item['denom']) &&
            (_item['denom'] as String).length < 15) {
          var token = await dataToolServer.getTokenInfo(_item['denom']);
          state.accountInfo.tokenList.add(token..amount = _item['amount']);
        }
      }
    }
    if (tokenList20?.data != null) {
      for (var i = 0; i < tokenList20?.data.length; i++) {
        var _item = tokenList20?.data[i];
        if (!checkTokenIsAdd(_item['Contract'])) {
          var token = await dataToolServer.getTokenInfo(_item['Contract']);
          state.accountInfo.tokenList.add(token..amount = _item['Num']);
        }
      }
    }
    state._accountInfo.refresh();
    accountController.updateAccount(state.accountInfo);
    state.fetchLoading = false;
  }

  // 前往代币详情页面
  onGoToDetail(TokenModel token) async {
    if (token.type == EnumTokenType.prc10) {
      await Get.toNamed(PlugRoutesNames.walletTokenDetail(token.minUnit));
    }
    if (token.type == EnumTokenType.prc20) {
      await Get.toNamed(
          PlugRoutesNames.walletTokenDetail(token.contractAddress));
    }
    _getLocalTokenList();
  }
}
