import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/notification/details/details.controller.dart';

class WalletNotificationDetailsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletNotificationDetailsPageController>(
        () => WalletNotificationDetailsPageController());
  }
}
