import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class WalletTokenListPageState {
  // 展示列表0还是已添加1
  final Rx<int> _showType = 0.obs;
  int get showType => _showType.value;
  set showType (int value) => _showType.value = value;
  // 动画比例
  final Rx<double> _animationRatio = 1.0.obs;
  double get animationRatio => _animationRatio.value;
  set animationRatio (double value) => _animationRatio.value = value;
  // 所有代币列表
  final RxList<TokenModel> allTokenList = RxList();
  // 已添加代币列表
  final RxList<TokenModel> userTokenList = RxList();
  // 已添加代币minUnit列表
  final RxList<String> userTokenMinUnitList = RxList();
  // 所有代币列表分页/0代表没有更多
  final Rx<int> _allTokenPage = 1.obs;
  int get allTokenPage => _allTokenPage.value;
  set allTokenPage (int value) => _allTokenPage.value = value;
}

class WalletTokenListPageController extends GetxController with SingleGetTickerProviderMixin {
  WalletTokenListPageController();
  // 动画控制器
  late AnimationController _controller;
  late Animation<double> _animation;
  // 搜索框
  TextEditingController searchTextController = TextEditingController();
  // 切换控制器
  late TabController tabBarController;

  WalletTokenListPageState state = WalletTokenListPageState();

  @override
  onInit() {
    super.onInit();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        state.animationRatio = _animation.value;
      });
    tabBarController = TabController(vsync: this, length: 2);
    tabBarController.addListener(_onToggleList);
    _getTokenList(null);
    _getLocalTokenList();
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
  onSearch(String? text) {
    print(text);
  }
  // 获取远程代币列表
  _getTokenList(String? search) {
    for (int i = 0; i < 10; i++) {
      TokenModel _token = TokenModel()
        ..symbol = 'plugcn$i'
        ..name = 'plugcn$i'
        ..logo = 'http://via.placeholder.com/43x46'
        ..scale = 6
        ..minUnit = 'uplugcn$i';
      state.allTokenList.add(_token);
    }
  }
  // 获取本地代币列表
  _getLocalTokenList() {
    TokenModel _token1 = TokenModel()
      ..symbol = 'plugcn'
      ..name = 'plugcn'
      ..logo = 'http://via.placeholder.com/43x46'
      ..scale = 6
      ..minUnit = 'uplugcn';
    state.userTokenList.add(_token1);
    state.userTokenMinUnitList.add(_token1.minUnit);
    for (int i = 1; i < 10; i++) {
      TokenModel _token = TokenModel()
        ..symbol = 'plugcn$i'
        ..name = 'plugcn$i'
        ..logo = 'http://via.placeholder.com/43x46'
        ..scale = 6
        ..minUnit = 'uplugcn$i';
      state.userTokenList.add(_token);
      state.userTokenMinUnitList.add(_token.minUnit);
    }
  }
  // 判断是否已添加有当前代币
  bool checkTokenIsAdd(String minUnit) {
    return state.userTokenMinUnitList.contains(minUnit);
  }
  // 添加/删除当前代币
  onToggleToken(TokenModel token) async {
    String minUnit = token.minUnit;
    LLoading.showBgLoading();
    TokenModel _token = state.allTokenList.firstWhere((element) => element.minUnit == minUnit, orElse: () => TokenModel());
    if (checkTokenIsAdd(minUnit)) {
      int _index = state.userTokenMinUnitList.indexOf(_token.minUnit);
      state.userTokenList.removeAt(_index);
      state.userTokenMinUnitList.removeAt(_index);
    } else {
      state.userTokenList.add(_token);
      state.userTokenMinUnitList.add(_token.minUnit);
    }
    await Future.delayed(const Duration(milliseconds: 500));
    LLoading.dismiss();
  }
  // 我的代币列表移除当前代币
  onLocalRemoveToken(TokenModel token) async {
    bool? result = await LBottomSheet.promptBottomSheet(
      title: '提示',
      message: Text('是否移除当前代币: ${token.symbol}?'),
    );
    if (result != true) return;
    int _index = state.userTokenMinUnitList.indexOf(token.minUnit);
    state.userTokenList.removeAt(_index);
    state.userTokenMinUnitList.removeAt(_index);
    LToast.success('移除代币成功');
  }
  // 我的代币列表排序
  onUserAssetsReorder (int oldIndex, int newIndex) {
    var _token = state.userTokenList.removeAt(oldIndex + 1);
    if (newIndex >= oldIndex) {
      state.userTokenList.insert(newIndex, _token);
    } else {
      state.userTokenList.insert(newIndex + 1, _token);
    }
  }
  // 一键获取所有资产
  onGetUserAllAssets() async {
    LLoading.showBgLoading();
    await Future.delayed(const Duration(milliseconds: 5000));
    LLoading.dismiss();
  }
  // 前往代币详情页面
  onGoToDetail(TokenModel token) {
    Get.toNamed(PlugRoutesNames.walletTokenDetail(token.minUnit));
  }
}