import 'package:get/get.dart';
import 'package:plug/app/ui/pages/setting/addressBook/list/list.controller.dart';

class UserAddressBookListPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAddressBookListPageController>(() => UserAddressBookListPageController());
  }
}