import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChainExportPageState {
  // 页面切换controller
  final Rx<TabController?> _pageTabController = Rx(null);
  TabController? get pageTabController => _pageTabController.value;
  set pageTabController (TabController? value) => _pageTabController.value = value;
}

class ChainExportPageController extends GetxController with SingleGetTickerProviderMixin {
  ChainExportPageController();
  ChainExportPageState state = ChainExportPageState();

  @override
  onInit() {
    super.onInit();
    _onInitPageTabController();
  }

  // 初始化切换控制器
  _onInitPageTabController() {
    state.pageTabController = TabController(vsync: this, length: 3);
  }

  // 一键发行
  onCreateToken() {

  }
}