import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/token/detail/detail.controller.dart';

class WalletTokenDetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletTokenDetailPageController>(
        () => WalletTokenDetailPageController());
  }
}
