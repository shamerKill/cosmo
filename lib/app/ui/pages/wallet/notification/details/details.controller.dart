import 'dart:convert';

import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/utils/http.dart';

class WalletNotificationDetailsPageState {
  // 消息详情
  final Rx<NotificationModel> _notificationInfo = NotificationModel().obs;
  NotificationModel get notificationInfo => _notificationInfo.value;
  set notificationInfo (NotificationModel value) => _notificationInfo.value = value;
  // 消息内容
  final Rx<String> _notificationContext = ''.obs;
  String get notificationContext => _notificationContext.value;
  set notificationContext (String value) => _notificationContext.value = value;
}

class WalletNotificationDetailsPageController extends GetxController {
  WalletNotificationDetailsPageController();
  WalletNotificationDetailsPageState state = WalletNotificationDetailsPageState();

  @override
  onReady() async {
    String? id = Get.parameters['id'];
    if (id == null) return Get.back();
    var result = await httpToolServer.getNotificationDetail(id);
    if (result.status != 0 || result.data == null) return Get.back();
    state.notificationInfo
      ..id = id
      ..title = result.data['title']
      ..time = result.data['create_time']
      ..context = [result.data['content']]
      ..template = 0
      ..read = true;
    state._notificationInfo.refresh();
    setContext();
  }

  // 设置内容详情
  setContext() {
    state.notificationContext = 'data:text/html;base64,' + base64Encode(const Utf8Encoder().convert(state.notificationInfo.context[0]));
  }
}