import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';

class ChainExportPageState {
  // 页面切换controller
  final Rx<TabController?> _pageTabController = Rx(null);
  TabController? get pageTabController => _pageTabController.value;
  set pageTabController(TabController? value) =>
      _pageTabController.value = value;
  // 当前账户
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo(AccountModel value) => _accountInfo.value = value;
}

class ChainExportPageController extends GetxController
    with GetTickerProviderStateMixin {
  ChainExportPageController();
  ChainExportPageState state = ChainExportPageState();
  DataAccountController dataAccount = Get.find();

  @override
  onInit() {
    super.onInit();
    if (dataAccount.state.nowAccount != null) {
      state.accountInfo = dataAccount.state.nowAccount!;
      _onInitPageTabController();
    }
  }

  // 初始化切换控制器
  _onInitPageTabController() {
    state.pageTabController = TabController(vsync: this, length: state.accountInfo.accountClass == EnumAccountClass.watch ? 1 : 2);
  }

  // 一键发行
  onCreateToken() {
    Get.toNamed(PlugRoutesNames.chainCreateToken);
  }
}
