import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.dapp-address.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/string.dart';

class DappSearchPageState {
  // 搜索框是否有值
  final Rx<bool> _searchHadData = false.obs;
  bool get searchHadData => _searchHadData.value;
  set searchHadData (bool value) => _searchHadData.value = value;
}

class DappSearchPageController extends GetxController {
  DappSearchPageController();
  DappSearchPageState state = DappSearchPageState();
  // 搜索框
  TextEditingController searchController = TextEditingController();
  // 获取收藏Dapp/最近的Dapp
  DataDappAddressController dataDappAddress = Get.find();


  @override
  onInit() {
    super.onInit();
    searchController.addListener(_onSearchInputHadData);
  }
  @override
  onClose() {
    searchController.removeListener(_onSearchInputHadData);
  }

  // 搜索框是否有搜索值
  _onSearchInputHadData() {
    if (searchController.text != '') {
      state.searchHadData = true;
    } else {
      state.searchHadData = false;
    }
  }

  // 取消搜索
  onSearchBtn() {
    Get.back();
  }
  // 搜索
  onSearchData(String data) {
    if (StringTool.checkNetAddress(data)) {
      _onAddHistory(data);
      Get.toNamed(PlugRoutesNames.dappWebview, parameters: { 'link': base64.encode(utf8.encode(data))});
      searchController.text = '';
    } else {
      LToast.warning('网址错误'.tr);
    }
  }
  // 点击历史搜索
  onClickHistory(DappModel data) {
    searchController.text = data.address;
  }
  // 删除搜索历史
  onDeleteHistory(String address) {
    dataDappAddress.state.dappLatelyList.removeWhere((item) => item.address == address);
    dataDappAddress.saveData();
  }
  // 添加搜索历史
  _onAddHistory(String address) {
    var index = dataDappAddress.state.dappLatelyList.indexWhere((item) => item.address == address);
    var ele = DappModel();
    if (index >= 0) {
      ele = dataDappAddress.state.dappLatelyList.removeAt(index);
    } else {
      ele.address = address;
      ele.title = address;
    }
    dataDappAddress.state.dappLatelyList.insert(0, ele);
  }
}