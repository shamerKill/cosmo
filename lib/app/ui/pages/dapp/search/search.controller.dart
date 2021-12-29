import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DappSearchPageState {
  // 搜索框是否有值
  final Rx<bool> _searchHadData = false.obs;
  bool get searchHadData => _searchHadData.value;
  set searchHadData (bool value) => _searchHadData.value = value;
  // 搜索历史
  final RxList<String> searchList = RxList();
}

class DappSearchPageController extends GetxController {
  DappSearchPageController();
  DappSearchPageState state = DappSearchPageState();
  // 搜索框
  TextEditingController searchController = TextEditingController();


  @override
  onInit() {
    super.onInit();
    searchController.addListener(_onSearchInputHadData);
    _getSearchHistory();
  }
  @override
  onClose() {
    searchController.removeListener(_onSearchInputHadData);
  }

  // 获取搜索历史
  _getSearchHistory() {
    state.searchList.add('plugcn');
    state.searchList.add('https://www.baidu.com/index.html');
    state.searchList.add('https://www.plugchain.info');
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
    if (state.searchHadData == true) {
      onSearchData(searchController.text);
    } else {
      Get.back();
    }
  }
  // 搜索
  onSearchData(String data) {
    _onAddHistory(searchController.text);
  }
  // 点击历史搜索
  onClickHistory(String data) {
    searchController.text = data;
  }
  // 删除搜索历史
  onDeleteHistory(String item) {
    state.searchList.remove(item);
  }
  // 添加搜索历史
  _onAddHistory(String item) {
    if (state.searchList.contains(item)) {
      state.searchList.remove(item);
    }
    state.searchList.insert(0, item);
  }
}