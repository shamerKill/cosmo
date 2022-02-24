import 'dart:math';

import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.notification-id.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class WalletNotificationListPageState {
  // 是否全部已读
  final Rx<bool> _isAllRead = false.obs;
  bool get isAllRead => _isAllRead.value;
  set isAllRead (bool value) => _isAllRead.value = value;
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

  RefreshController notificationRefreshController = RefreshController();

  DataNotificationIdController dataNotificationId = Get.find();
  
  @override
  onInit() {
    super.onInit();
    onGetNoticeList();
  }

  // 获取信息记录
  onGetNoticeList() async {
    LLoading.showBgLoading();
    var result = await httpToolServer.getNotificationList(state.page, limit: 10);
    LLoading.dismiss();
    if (result.status != 0) return;
    if (result.data == null) return state.page = 0;
    if (result.data.length < 10) state.page = 0;
    for (var _item in result.data) {
      state.listNotification.add(
        NotificationModel()..id = '${_item['id']}'
          ..title = _item['title']
          ..time = _item['create_time']
          ..read = dataNotificationId.state.notificationIdList.contains('${_item['id']}')
      );
    }
    state.listNotification.refresh();
  }

  // 刷新
  Future<void> onRefresh() async {
    state.page = 1;
    state.listNotification.clear();
    await onGetNoticeList();
  }
  // 添加
  Future<void> onLoading() async {
    state.page += 1;
    await onGetNoticeList();
  }

  // 全部已读
  onAllRead() {
    state.isAllRead = true;
    for (NotificationModel item in state.listNotification) {
      dataNotificationId.addRead(item.id);
      item.read = true;
    }
    state.listNotification.refresh();
  }
  // 前往内容页面
  onToDetail(String id) {
    for (NotificationModel item in state.listNotification) {
      if (item.id == id) {
        dataNotificationId.addRead(item.id);
        item.read = true;
        break;
      }
    }
    state.listNotification.refresh();
    Get.toNamed(PlugRoutesNames.walletNotificationDetails(id));
  }
}