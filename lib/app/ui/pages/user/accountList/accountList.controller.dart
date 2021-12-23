import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';

class UserAccountListPageState {
  // 账户列表
  final RxList<AccountModel> accountList = RxList<AccountModel>();

  // 选中账户
  final Rx<String> _drawerSelected = ''.obs;
  String get drawerSelected => _drawerSelected.value;
  set drawerSelected (String value) => _drawerSelected.value = value;
}

class UserAccountListPageController extends GetxController {
  UserAccountListPageController();
  UserAccountListPageState state = UserAccountListPageState();

  @override
  onInit() {
    super.onInit();
    state.accountList.clear();
    state.accountList.addAll([
      AccountModel()
        ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04y'
        ..nickName = 'cosmo-import-1',
      AccountModel()
        ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04z'
        ..nickName = 'cosmo-import-2',
      AccountModel()
        ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04n'
        ..nickName = 'cosmo-import-3',
      AccountModel()
        ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04e'
        ..nickName = 'cosmo-create-4',
    ]);
  }

  // 侧边栏账户选择
  onDrawerSelect(String _address) {
    state.drawerSelected = _address;
  }
  // 管理账户
  onAdminAccount(String _address) {
    Get.toNamed(PlugRoutesNames.accountAdmin(_address));
  }
  // 添加账户
  onAddAccount() {
    Get.toNamed(PlugRoutesNames.fristOpenWallet);
  }
}