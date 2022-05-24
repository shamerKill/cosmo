import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.address.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/string.dart';

class UserAddressBookEditPageState {
  // 是否是修改
  final Rx<bool> _isEdit = false.obs;
  bool get isEdit => _isEdit.value;
  set isEdit (bool value) => _isEdit.value = value;
  // 地址簿详情
  final Rx<AddressModel> _addressInfo = AddressModel().obs;
  AddressModel get addressInfo => _addressInfo.value;
  set addressInfo (AddressModel value) => _addressInfo.value = value;
}

class UserAddressBookEditPageController extends GetxController {
  UserAddressBookEditPageController();
  UserAddressBookEditPageState state = UserAddressBookEditPageState();
  // 名称
  TextEditingController nameController = TextEditingController();
  // 备注
  TextEditingController remarksController = TextEditingController();
  // 地址
  TextEditingController addressController = TextEditingController();

  DataAddressController dataAddress = Get.find();

  @override
  onReady() {
    if (Get.arguments != null && Get.arguments['id'] is String) {
      state.isEdit = true;
      for (var item in dataAddress.state.addressList) {
        if (item.id == Get.arguments['id']) {
          state.addressInfo = item;
          break;
        }
      }
      nameController.text = state.addressInfo.name;
      remarksController.text = state.addressInfo.remarks;
      addressController.text = state.addressInfo.address;
    }
  }

  // 保存
  onSave() {
    if (addressController.text == '') return LToast.warning('地址输入有误'.tr);
    state.addressInfo.name = nameController.text;
    state.addressInfo.remarks = remarksController.text;
    state.addressInfo.address = addressController.text;
    if (state.addressInfo.id == '') state.addressInfo.id = StringTool.getRandomStr();
    if (state.isEdit) {
      dataAddress.updateAddress(state.addressInfo);
    } else {
      dataAddress.addAddress(state.addressInfo);
    }
    Get.focusScope?.unfocus();
    LToast.success('保存成功');
    Get.back();
  }
  // 删除
  onRemove() async {
    bool? type = await LBottomSheet.promptBottomSheet(
      title: '删除提示'.tr,
      message: Text('是否删除当前地址？'.tr),
    );
    if (type == true) {
      dataAddress.removeAddress(state.addressInfo);
      Get.back();
    }
  }
  // 扫码
  onScanQr() async {
    var address = await Get.toNamed(PlugRoutesNames.walletQrScanner, parameters: { 'result': 'true' });
    if (address is! String || !StringTool.checkChainAddress(address)) return LToast.error('非Plug Chain合法地址'.tr);
    addressController.text = address;
  }
}