import 'package:get/get.dart';
import 'package:plug/app/routes/routes.dart';

class UserMyPageState {
  // 是否开启了指纹验证
  final Rx<bool> _enableTouch = false.obs;
  bool get enableTouch => _enableTouch.value;
  set enableTouch (bool value) => _enableTouch.value = value;
  // 当前网络
  final Rx<String> _network = ''.obs;
  String get network => _network.value;
  set network (String value) => _network.value = value;
  // 当前语言
  final Rx<String> _language = ''.obs;
  String get language => _language.value;
  set language (String value) => _language.value = value;
}

class UserMyPageController extends GetxController {
  UserMyPageController();
  UserMyPageState state = UserMyPageState();

  @override
  onInit() {
    super.onInit();
    state.network = '主网';
    state.language = '简体中文';
  }

  // 前往地址簿
  onGoToAddressBookList() => Get.toNamed(PlugRoutesNames.userAddressBookList);
  // 切换指纹验证
  onToggleTouch(bool? type) {
    if (type != null) state.enableTouch = type;
  }
}