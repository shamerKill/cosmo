import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/components/view/qrcode.component.dart';

class AccountAdminPageState {
  // 已选择账户
  final Rx<AccountModel> _useAccountInfo = AccountModel().obs;
  AccountModel get useAccountInfo => _useAccountInfo.value;
  set useAccountInfo (AccountModel value) => _useAccountInfo.value = value;

  // 当前编辑账户
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo (AccountModel value) => _accountInfo.value = value;

  // 密码/助记词选择弹窗
  final RxList<Widget> checkVerifiType = RxList<Widget>();
}

class AccountAdminPageController extends GetxController {
  AccountAdminPageController();
  AccountAdminPageState state = AccountAdminPageState();

  /// 操作类型 备份backup/改密exitPassword/移除remove
  String _doType = '';

  @override
  onInit() {
    super.onInit();
    state.useAccountInfo.address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04y';
    if (Get.parameters['address'] == null) {
      return Get.back();
    } else {
      _getAccountData(Get.parameters['address']!);
    }
  }

  _getAccountData(String _address) {
    state._accountInfo.update((val) {
      val?..address = _address
          ..nickName = 'cosmo-import-1'
          ..createTime = DateTime.now();
    });
  }
  // 复制地址
  onCopyAddress() {
    FlutterClipboard.copy(state.accountInfo.address).then(( value ) => LToast.success('SuccessWithCopy'.tr));
  }
  // 显示二维码
  onShowScan() async {
    await LBottomSheet.baseBottomSheet(
      child: LQrCodeView(address: state.accountInfo.address),
      horizontalPadding: true,
    );
  }
  // 备份账户
  onToBackupAddress() {
    if (state.checkVerifiType.isEmpty) return;
    _doType = 'backup';
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: state.checkVerifiType[0],
    );
  }
  // 修改密码
  onEditPassword() {
    if (state.checkVerifiType.isEmpty) return;
    _doType = 'exitPassword';
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: state.checkVerifiType[0],
    );
  }
  // 移除账户
  onRemoveAccount() {
    if (state.checkVerifiType.isEmpty) return;
    _doType = 'remove';
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: state.checkVerifiType[0],
    );
  }
  // 验证方式选择回调
  onVerifyCallBack(int type) async {
    Get.back();
    dynamic mnemonic = await Get.toNamed(
      PlugRoutesNames.accountAdminVerify(state.useAccountInfo.address, ['password', 'mnemonic'][type]),
    );
    if (mnemonic == null) return;
    // TODO: 备份
    if (_doType == 'backup') Get.toNamed(PlugRoutesNames.accountBackupShow);
    // TODO: 修改密码
    if (_doType == 'exitPassword') Get.toNamed(PlugRoutesNames.accountAdminEditPassword(mnemonic));
    // TODO: 移除
    if (_doType == 'remove') Get.back();
  }
}