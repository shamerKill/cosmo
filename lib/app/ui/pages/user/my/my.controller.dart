import 'package:get/get.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

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

  // 前往账户管理地址列表
  onGoToAccountList() => Get.toNamed(PlugRoutesNames.userAccountList);
  // 前往地址簿
  onGoToAddressBookList() => Get.toNamed(PlugRoutesNames.userAddressBookList);
  // 前往消息中心
  onGoToNotificationsList() => Get.toNamed(PlugRoutesNames.walletNotification);
  // 前往DAPP设置
  onGoToDappSetting() => Get.toNamed(PlugRoutesNames.userDappSetting);
  // 切换指纹验证
  onToggleTouch(bool? type) {
    LToast.info('功能暂未开启');
    // if (type != null) state.enableTouch = type;
  }
  // 前往网络切换
  onGoToNetwork() => Get.toNamed(PlugRoutesNames.userNetwork);
  // 前往语言切换
  onGoToLanguage() => Get.toNamed(PlugRoutesNames.userLanguage);
  // 前往关于我们
  onGoToAboutUs() => Get.toNamed(PlugRoutesNames.userAbout);
  // 前往问题反馈
  onGoToProblems() => Get.toNamed(PlugRoutesNames.userProblems);
}