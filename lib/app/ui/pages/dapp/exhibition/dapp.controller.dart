import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';

class DappExhibitionPageState {
  // banner图
  final Rx<String?> _topBanner = Rx<String?>(null);
  String? get topBanner => _topBanner.value;
  set topBanner (String? value) => _topBanner.value = value;
  // 收藏Dapp
  final RxList<DappModel> collectList = RxList<DappModel>();
  // 最近使用Dapp
  final RxList<DappModel> latelyList = RxList<DappModel>();
  // 远程Dapp列表种类
  final RxList<DappRemoteTypeModel> remoteDappType = RxList<DappRemoteTypeModel>();
  // 远程Dapp列表
  final RxList<List<DappModel>> remoteDappList = RxList<List<DappModel>>();
  // 远程dapp列表tabbar
  final Rx<TabController?> _reomoteDappTab = Rx<TabController?>(null);
  TabController? get reomoteDappTab => _reomoteDappTab.value;
  set reomoteDappTab (TabController? value) => _reomoteDappTab.value = value;
  // 搜藏/最近tabbar
  final Rx<TabController?> _localDappTab = Rx<TabController?>(null);
  TabController? get localDappTab => _localDappTab.value;
  set localDappTab (TabController? value) => _localDappTab.value = value;
  // 搜藏/最近tabbar index
  final Rx<int> _localDappTabIndex = 0.obs;
  int get localDappTabIndex => _localDappTabIndex.value;
  set localDappTabIndex (int value) => _localDappTabIndex.value = value;
}

class DappExhibitionPageController extends GetxController with SingleGetTickerProviderMixin {
  DappExhibitionPageController();
  DappExhibitionPageState state = DappExhibitionPageState();

  @override
  onInit() {
    super.onInit();
    _initTabBar();
    _getBanner();
    _getRemoteDapp();
  }


  // 获取banner
  _getBanner() async {
    await Future.delayed(const Duration(seconds: 1));
    state.topBanner = 'http://via.placeholder.com/690x240';
  }
  // 初始化tabbar
  _initTabBar() {
    _getLocalDapp();
    state.localDappTab = TabController(
      vsync: this,
      length: 2
    );
    state.localDappTab?.addListener(() {
      if (state.localDappTab != null) state.localDappTabIndex = state.localDappTab!.index;
    });
  }
  // 获取收藏Dapp/最近的Dapp
  _getLocalDapp() {
    for (int i = 0; i < 10; i++) {
      state.collectList.add(
        DappModel()..address = 'https://www.baidu.com'
          ..id = i
          ..logo = 'https://www.baidu.com/favicon.ico'
          ..description = '百度一下你就知道'
          ..title = '百度搜索'
      );
      state.latelyList.add(
        DappModel()..address = 'https://www.bing.com'
          ..id = i
          ..logo = 'https://cn.bing.com/sa/simg/favicon-2x.ico'
          ..description = '必应搜索你就知道'
          ..title = '必应'
      );
    }
  }
  // 获取远程Dapp数据
  _getRemoteDapp() async {
    await Future.delayed(const Duration(seconds: 1));
    state.remoteDappType.addAll([
      DappRemoteTypeModel()..id = 1
        ..name = 'DEX',
      DappRemoteTypeModel()..id = 2
        ..name = '资产',
      DappRemoteTypeModel()..id = 3
        ..name = '工具',
    ]);
    state.remoteDappList.add(
      [
        for (int i = 0; i < 10; i++)
          DappModel()..address = 'https://www.bing.com'
          ..id = i
          ..logo = 'https://cn.bing.com/sa/simg/favicon-2x.ico'
          ..description = '必应搜索你就知道'
          ..title = '必应'
      ]
    );
    state.remoteDappList.add(
      [
        for (int i = 0; i < 10; i++)
          DappModel()..address = 'https://www.baidu.com'
            ..id = i
            ..logo = 'https://www.baidu.com/favicon.ico'
            ..description = '百度一下你就知道百度一下你就知道百度一下你就知道百度一下你就知道百度一下你就知道百度一下你就知道百度一下你就知道'
            ..title = '百度搜索'
      ]
    );
    state.remoteDappList.add(
      [
        for (int i = 0; i < 10; i++)
          DappModel()..address = 'https://www.google.com'
            ..id = i
            ..logo = 'https://www.baidu.com/favicon.ico'
            ..description = 'google你就知道'
            ..title = '谷歌引擎'
      ]
    );
    // 获取远程dapp列表
    state.reomoteDappTab = TabController(
      vsync: this,
      length: state.remoteDappType.length
    );
  }


  // 前往扫码
  onGoToQrScan() {}
  // 前往搜索页面
  onGoToSearch() {
    Get.toNamed(PlugRoutesNames.dappSearch);
  }
  // 前往dapp
  onGoToDapp(String link) {
    // print(PlugRoutesNames.dappWebview(base64.encode(utf8.encode(link))));
    Get.toNamed(PlugRoutesNames.dappWebview, parameters: { 'link': base64.encode(utf8.encode(link))});
  }
  // 前往全部收藏
  onGoToCollection() {
    Get.toNamed(PlugRoutesNames.dappCollection);
  }
}