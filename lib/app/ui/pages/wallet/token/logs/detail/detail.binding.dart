import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/token/logs/detail/detail.controller.dart';

class WalletTokenLogsDetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletTokenLogsDetailPageController>(
        () => WalletTokenLogsDetailPageController());
  }
}
