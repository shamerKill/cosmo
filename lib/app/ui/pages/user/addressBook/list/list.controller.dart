import 'package:get/get.dart';
import 'package:plug/app/data/provider/data.address.dart';
import 'package:plug/app/routes/routes.dart';

class UserAddressBookListPageState {
  final Rx<bool> _isSelect = false.obs;
  bool get isSelect => _isSelect.value;
  set isSelect (bool value) => _isSelect.value = value;
}

class UserAddressBookListPageController extends GetxController {
  UserAddressBookListPageController();
  UserAddressBookListPageState state = UserAddressBookListPageState();

  DataAddressController dataAddress = Get.find();

  @override
  onReady() {
    if (Get.arguments == 'select') state.isSelect = true;
  }
  

  // 创建地址
  onCreateAddress() {
    Get.toNamed(PlugRoutesNames.userAddressBookEdit);
  }
  // 修改地址
  onEditAddress(String address) {
    // 选中地址
    if (state.isSelect) return Get.back(result: address);
    Get.toNamed(
      PlugRoutesNames.userAddressBookEdit,
      arguments: {
        'address': address
      }
    );
  }
}