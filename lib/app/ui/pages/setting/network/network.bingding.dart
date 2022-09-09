import 'package:get/get.dart';
import 'package:plug/app/ui/pages/setting/network/network.controller.dart';

class UserNetworkPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserNetworkPageController>(() => UserNetworkPageController());
  }
}
