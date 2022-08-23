import 'package:get/get.dart';
import 'package:plug/app/ui/pages/setting/addressBook/edit/edit.controller.dart';

class UserAddressBookEditPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressBookEditPageController>(() => UserAddressBookEditPageController());
  }
}