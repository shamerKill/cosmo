import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/token/user/user.controller.dart';

class WalletTokenUserPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletTokenUserPageController>(() => WalletTokenUserPageController());
  }
}