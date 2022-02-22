import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/utils/http.dart';

class DataAddressState {
  String get baseCoinName => 'ADDRESSLISTNAME';
  // 是否已经初始化
  final Rx<bool> _isInit = false.obs;
  bool get isInit => _isInit.value;
  set isInit (bool value) => _isInit.value = value;
  // 地址簿
  RxList<AddressModel> addressList = RxList();
}


class DataAddressController extends GetxController {
  DataAddressController() {
    _readStorage();
  }
  final DataAddressState state = DataAddressState();


  // 添加地址
  addAddress(AddressModel address) {
    state.addressList.add(address);
    _saveAccounts();
  }
  // 删除地址
  removeAddress(AddressModel address) {
    state.addressList.removeWhere((addr) => addr.id == address.id);
    _saveAccounts();
  }
  // 更新地址
  updateAddress(AddressModel address) {
    var _index = state.addressList.indexWhere((addr) => addr.id == address.id);
    if (_index == -1) return;
    state.addressList.replaceRange(
      _index, _index + 1, [address]
    );
    _saveAccounts();
  }
  // 储存基础币
  _saveAccounts() {
    GetStorage().write(state.baseCoinName, json.encode(state.addressList.map((e) => e.toJson()).toList()));
  }
  // 读取本地数据币
  _readStorage() {
    String? data = GetStorage().read(state.baseCoinName);
    if (data == null) return;
    try {
      List<dynamic> listData = json.decode(data);
      state.addressList.addAll(listData.map((e) => AddressModel()..setData(e)));
    } catch (e) {}
  }
}