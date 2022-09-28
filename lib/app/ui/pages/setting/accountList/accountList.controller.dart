import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';

class UserAccountListPageState {
  // 账户列表
  final RxList<AccountModel> accountList = RxList<AccountModel>();

  // 选中账户
  final Rx<String> _drawerSelected = ''.obs;
  String get drawerSelected => _drawerSelected.value;
  set drawerSelected(String value) => _drawerSelected.value = value;
}

class UserAccountListPageController extends GetxController {
  UserAccountListPageController();
  UserAccountListPageState state = UserAccountListPageState();

  DataAccountController dataAccount = Get.find();

  @override
  onReady() {
    state.accountList.clear();
    state.accountList.addAll(dataAccount.state.accountsList);
    if (dataAccount.state.nowAccount != null) {
      state.drawerSelected = dataAccount.state.nowAccount!.address;
    }
  }

  // 账户选择
  onDrawerSelect(String _address) {
    state.drawerSelected = _address;
  }

  // 管理账户
  onAdminAccount(String _address) {
    Get.toNamed(PlugRoutesNames.accountAdmin(_address));
  }

  // 添加账户
  onAddAccount() {
    Get.toNamed(PlugRoutesNames.firstOpenWallet);
  }
}
