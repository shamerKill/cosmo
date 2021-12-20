import 'package:get/get.dart';
import 'package:plug/app/ui/pages/wallet/token/list/list.controller.dart';

class WalletTokenListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletTokenListPageController>(() => WalletTokenListPageController());
  }
}