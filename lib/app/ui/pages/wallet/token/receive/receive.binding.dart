import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/token/receive/receive.controller.dart';

class WalletTokenReceivePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletTokenReceivePageController>(() => WalletTokenReceivePageController());
  }
}