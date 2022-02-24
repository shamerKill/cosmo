import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/utils/http.dart';

class DataDappAddressState {
  String get dappAddressName => 'DAPPADDRESSLIST';
  // 收藏的dapp
  RxList<DappModel> dappCollectList = RxList();
  // 最近的dapp
  RxList<DappModel> dappLatelyList = RxList();
  
}


class DataDappAddressController extends GetxController {
  DataDappAddressController() {
    _readStorage();
  }
  final DataDappAddressState state = DataDappAddressState();

  // 更新储存
  saveData() {
    var collectList = state.dappCollectList.map((item) => item.toJson()).toList();
    var latelyList = state.dappLatelyList.map((item) => item.toJson()).toList();
    GetStorage().write(state.dappAddressName, json.encode({
      'collectList': collectList,
      'latelyList': latelyList
    }));
  }
  // 读取本地数据
  _readStorage() {
    String? data = GetStorage().read(state.dappAddressName);
    if (data == null) return;
    try {
      Map<String, dynamic> listData = json.decode(data);
      var collectList = listData['collectList'];
      var latelyList = listData['latelyList'];
      // 收藏
      if (collectList != null) {
        for (dynamic item in collectList) {
          state.dappCollectList.add(DappModel()..setData(item));
        }
      }
      // 最近
      if (latelyList != null) {
        for (dynamic item in latelyList) {
          state.dappLatelyList.add(DappModel()..setData(item));
        }
      }
    } catch (e) {
      print(e);
    }
  }
}