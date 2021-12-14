import 'dart:math';

import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';

class WalletNotificationListPageState {
  // 是否全部已读
  final Rx<bool> _isAllReaded = false.obs;
  bool get isAllReaded => _isAllReaded.value;
  set isAllReaded (bool value) => _isAllReaded.value = value;
  // 列表消息数据
  final RxList<NotificationModel> listNotification = RxList<NotificationModel>();
  // 列表页数 0代表没有更多
  final Rx<int> _page = 1.obs;
  int get page => _page.value;
  set page (int value) => _page.value = value;
}

class WalletNotificationListPageController extends GetxController {
  WalletNotificationListPageController();
  WalletNotificationListPageState state = WalletNotificationListPageState();
  
  @override
  onInit() {
    super.onInit();
    onGetNoticeList();
  }

  // 获取信息记录
  onGetNoticeList() {
    demo () => NotificationModel()
        ..id = '${Random().nextInt(1000)}'
        ..title = '钱包应用更新通知钱包应用更新通知钱包应用更新通知钱包应用更新通知钱包应用更新通知${Random().nextInt(1000)}'
        ..time = DateTime.now()
        ..template = 0
        ..readed = false;
    state.listNotification.addAll([
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
      demo(),
    ]);
    state.listNotification.refresh();
  }

  // 刷新
  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    state.listNotification.clear();
    onGetNoticeList();
  }
  // 添加
  Future<void> onLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    onGetNoticeList();
  }

  // 全部已读
  onAllReaded() {
    state.isAllReaded = true;
    for (NotificationModel item in state.listNotification) {
      item.readed = true;
    }
    state.listNotification.refresh();
  }
  // 前往内容页面
  onToDetail(String id) {
    Get.toNamed(PlugRoutesNames.walletNotificationDetails(id));
    for (NotificationModel item in state.listNotification) {
      if (item.id == id) {
        item.readed = true;
        break;
      }
    }
    state.listNotification.refresh();
  }
}