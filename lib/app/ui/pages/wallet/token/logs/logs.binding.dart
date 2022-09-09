import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/token/logs/logs.controller.dart';

class WalletTokenLogsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletTokenLogsPageController>(
        () => WalletTokenLogsPageController());
  }
}
