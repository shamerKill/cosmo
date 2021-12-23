import 'package:get/get.dart';
import 'package:plug/app/ui/pages/user/dappSetting/dappSetting.controller.dart';

class UserDappSettingPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDappSettingPageController>(() => UserDappSettingPageController());
  }
}