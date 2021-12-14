import 'dart:convert';

import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';

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
  onInit() {
    super.onInit();
    state.notificationInfo
      ..id = '1'
      ..title = '钱包应用更新通知'
      ..time = DateTime.now()
      ..context = ['''
        <!DOCTYPE html>
        <html>
        <head>
          <title>Transparent background test</title>
        </head>
        <style type="text/css">
          body { background: transparent; margin: 0; padding: 0; }
          #container { position: relative; margin: 0; padding: 0; width: 100vw; height: 100vh; }
          #shape { background: red; width: 200px; height: 200px; margin: 0; padding: 0; position: absolute; top: calc(50% - 100px); left: calc(50% - 100px); }
          p { text-align: center; }
        </style>
        <body>
          <div id="container">
            <p>Transparent background test</p>
            <div id="shape"></div>
          </div>
        </body>
        </html>
        '''
      ]
      ..template = 0
      ..readed = false;
    setContext();
  }

  // 设置内容详情
  setContext() {
    state.notificationContext = 'data:text/html;base64,' + base64Encode(const Utf8Encoder().convert(state.notificationInfo.context[0]));
  }
}