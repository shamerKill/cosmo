import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

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

  @override
  onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments['address'] is String) {
      state.isEdit = true;
      state.addressInfo
        ..address = Get.arguments['address']
        ..id = 1
        ..name = '名字'
        ..remarks = '备注';
      nameController.text = state.addressInfo.name;
      remarksController.text = state.addressInfo.remarks;
      addressController.text = state.addressInfo.address;
    }
  }

  // 保存
  onSave() {
    LToast.success('保存成功');
  }
  // 删除
  onRemove() async {
    bool? type = await LBottomSheet.promptBottomSheet(
      title: '删除提示'.tr,
      message: Text('是否删除当前地址？'.tr),
    );
    if (type == true) {
      Get.back();
    }
  }
  // 扫码
  onScanQr() {
    print('扫码');
  }
}