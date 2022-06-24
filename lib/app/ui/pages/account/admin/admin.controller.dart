import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
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
}

class AccountAdminPageController extends GetxController {
  AccountAdminPageController();
  AccountAdminPageState state = AccountAdminPageState();

  DataAccountController dataAccountController = Get.find();

  /// 操作类型 备份backup/改密exitPassword/移除remove
  String _doType = '';

  @override
  onInit() {
    super.onInit();
    if (Get.parameters['address'] == null) {
      return Get.back();
    } else {
      _getAccountData(Get.parameters['address']!);
    }
  }

  _getAccountData(String _address) {
    state.accountInfo = dataAccountController.getAccountFromAddress(_address)!;
    state.useAccountInfo = dataAccountController.state.nowAccount!;
    state._accountInfo.refresh();
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
    _doType = 'backup';
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: LBottomSheet.selectSheetChild(
        labelList: ['verifyByPassword'.tr],
        // labelList: ['密码验证', '助记词验证'],
        successCallBack: onVerifyCallBack
      ),
    );
  }
  // 修改密码
  onEditPassword() {
    _doType = 'exitPassword';
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: LBottomSheet.selectSheetChild(
        labelList: ['verifyByPassword'.tr],
        // labelList: ['密码验证', '助记词验证'],
        successCallBack: onVerifyCallBack
      ),
    );
  }
  // 修改名称
  onEditAccountName() {
    TextEditingController _controller = TextEditingController(text: state.accountInfo.nickName);
    LBottomSheet.baseBottomSheet(
      child: SizedBox(
        width: Get.size.width * 0.8,
        child: LInput(
          textController: _controller,
          autoFocus: true,
          textInputAction: TextInputAction.done,
          onSubmitted: (String? value) {
            if (value == null || value.isEmpty) {
              LToast.error('ErrorWithAccountNotEmpty'.tr);
              return;
            } else if (dataAccountController.updateAccountName(state.accountInfo.address, value)) {
              LToast.success('SuccessEdit'.tr);
              _getAccountData(state.accountInfo.address);
              Get.back();
            } else {
              LToast.success('FailEdit'.tr);
            }
          },
        ),
      ),
    );
  }
  // 移除账户
  onRemoveAccount() async {
    if ((await LBottomSheet.promptBottomSheet(
      title: 'deleteTip'.tr,
      message: Text('deleteDesc'.tr + ' ${state.accountInfo.nickName} ?'),
    )) != true) return;
    _doType = 'remove';
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: LBottomSheet.selectSheetChild(
        labelList: ['verifyByPassword'.tr],
        // labelList: ['密码验证', '助记词验证'],
        successCallBack: onVerifyCallBack
      ),
    );
  }
  // 验证方式选择回调
  onVerifyCallBack(int type) async {
    Get.back();
    var mnemonic = await Get.toNamed(
      PlugRoutesNames.accountAdminVerify(state.accountInfo.address, ['password', 'mnemonic'][type]),
    );
    if (mnemonic == null || mnemonic is! String) return;
    dataAccountController.state.memMnemonic = mnemonic.split(' ');
    dataAccountController.state.memAddress = state.accountInfo.address;
    // 备份
    if (_doType == 'backup') await Get.toNamed(PlugRoutesNames.accountBackupShow);
    // 修改密码
    if (_doType == 'exitPassword') await Get.toNamed(PlugRoutesNames.accountAdminEditPassword);
    dataAccountController.state.memMnemonic = null;
    dataAccountController.state.memAddress = null;
    // 移除账户
    if (_doType == 'remove' && dataAccountController.removeAccount(state.accountInfo)) {
      Get.offAllNamed(PlugRoutesNames.walletHome, predicate: (route) => Get.currentRoute == PlugRoutesNames.walletHome);
    }
  }
}