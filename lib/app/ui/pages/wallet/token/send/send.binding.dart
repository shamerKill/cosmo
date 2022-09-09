import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/token/send/send.controller.dart';

class WalletTokenSendPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletTokenSendPageController>(
        () => WalletTokenSendPageController());
  }
}
