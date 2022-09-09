import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/notification/list/list.controller.dart';

class WalletNotificationListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletNotificationListPageController>(
        () => WalletNotificationListPageController());
  }
}
