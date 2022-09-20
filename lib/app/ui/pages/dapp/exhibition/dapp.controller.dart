import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.dapp-address.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/data/services/net.services.dart';

class DappExhibitionPageState {
  // banner图
  final Rx<String?> _topBanner = Rx<String?>(null);
  String? get topBanner => _topBanner.value;
  set topBanner(String? value) => _topBanner.value = value;
  // 远程Dapp列表种类
  final RxList<DappRemoteTypeModel> remoteDappType =
      RxList<DappRemoteTypeModel>();
  // 远程Dapp列表
  final RxList<List<DappModel>> remoteDappList = RxList<List<DappModel>>();
  // 远程dapp列表tabBar
  final Rx<TabController?> _remoteDappTab = Rx<TabController?>(null);
  TabController? get remoteDappTab => _remoteDappTab.value;
  set remoteDappTab(TabController? value) => _remoteDappTab.value = value;
  // 搜藏/最近tabBar
  final Rx<TabController?> _localDappTab = Rx<TabController?>(null);
  TabController? get localDappTab => _localDappTab.value;
  set localDappTab(TabController? value) => _localDappTab.value = value;
  // 搜藏/最近tabBar index
  final Rx<int> _localDappTabIndex = 0.obs;
  int get localDappTabIndex => _localDappTabIndex.value;
  set localDappTabIndex(int value) => _localDappTabIndex.value = value;
}

class DappExhibitionPageController extends GetxController
    with GetTickerProviderStateMixin {
  DappExhibitionPageController();
  DappExhibitionPageState state = DappExhibitionPageState();

  // 获取收藏Dapp/最近的Dapp
  DataDappAddressController dataDappAddress = Get.find();

  @override
  onInit() {
    super.onInit();
    _initTabBar();
    _getBanner();
    _getRemoteDapp();
  }

  // 获取banner
  _getBanner() async {
    var result = await httpToolServer.getDappAdPic();
    // 获取远程dapp列表
    state.topBanner = result.data?['value'] ?? '';
  }

  // 初始化local tabBar
  _initTabBar() async {
    state.localDappTab = TabController(vsync: this, length: 2);
    state.localDappTab?.addListener(() {
      if (state.localDappTab != null) {
        state.localDappTabIndex = state.localDappTab!.index;
      }
    });
  }

  // 获取远程Dapp数据
  _getRemoteDapp() async {
    var result = await httpToolServer.getDappTypes();
    if (result.status == 0 && result.data != null) {
      for (int i = 0; i < result.data.length; i++) {
        state.remoteDappType.add(DappRemoteTypeModel()
          ..id = (i + 1)
          ..name = result.data[i]['name']);
      }
    }
    // 获取远程dapp列表
    var res = await Future.wait([
      for (var item in state.remoteDappType)
        httpToolServer.getDappList(item.name)
    ]);
    for (var item in res) {
      state.remoteDappList.add([
        for (var _i in item.data)
          DappModel()
            ..address = _i['link']
            ..logo = _i['logo']
            ..description = _i['des']
            ..title = _i['name']
      ]);
    }
    state.remoteDappTab =
        TabController(vsync: this, length: state.remoteDappType.length);
  }

  // 前往扫码
  onGoToQrScan() async {
    await Get.toNamed(PlugRoutesNames.walletQrScanner);
  }

  // 前往搜索页面
  onGoToSearch() {
    Get.toNamed(PlugRoutesNames.dappSearch);
  }

  // 前往dapp
  onGoToDapp(String link) {
    Get.toNamed(PlugRoutesNames.dappWebview,
        parameters: {'link': base64.encode(utf8.encode(link))});
  }

  // 前往全部收藏
  onGoToCollection() {
    Get.toNamed(PlugRoutesNames.dappCollection);
  }
}
