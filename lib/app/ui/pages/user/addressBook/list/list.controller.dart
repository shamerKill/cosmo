import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';

class UserAddressBookListPageState {
  // 地址簿列表
  final RxList<AddressModel> addressList = RxList();
}

class UserAddressBookListPageController extends GetxController {
  UserAddressBookListPageController();
  UserAddressBookListPageState state = UserAddressBookListPageState();

  @override
  void onInit() {
    super.onInit();
    for (int i = 1; i < 10; i++) {
      state.addressList.add(
        AddressModel()
        ..id = i
        ..name = '地址$i'
        ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04$i'
        ..remarks = '备注$i'
      );
    }
  }

}