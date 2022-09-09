import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class DataNotificationIdState {
  String get baseCoinName => 'NOTIFICATION_ID';
  // 已阅读过的消息记录
  RxList<String> notificationIdList = RxList();
}

class DataNotificationIdController extends GetxController {
  DataNotificationIdController() {
    _readStorage();
  }
  final DataNotificationIdState state = DataNotificationIdState();

  // 添加已阅读
  addRead(String id) {
    if (state.notificationIdList.contains(id)) return true;
    state.notificationIdList.add(id);
    _saveAccounts();
  }

  // 储存信息
  _saveAccounts() {
    GetStorage()
        .write(state.baseCoinName, json.encode(state.notificationIdList));
  }

  // 读取本地信息
  _readStorage() {
    String? data = GetStorage().read(state.baseCoinName);
    if (data == null) return;
    try {
      List<dynamic> listData = json.decode(data);
      for (var item in listData) {
        if (item is String) state.notificationIdList.add(item);
      }
    } catch (_) {}
  }
}
