import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/utils/number.dart';

class WalletTokenSendPageState {
  // 账户信息
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo (AccountModel value) => _accountInfo.value = value;  
  // 币种信息
  final Rx<TokenModel> _tokenInfo = TokenModel().obs;
  TokenModel get tokenInfo => _tokenInfo.value;
  set tokenInfo (TokenModel value) => _tokenInfo.value = value;
  // 手续费
  final Rx<String> _fee = ''.obs;
  String get fee => _fee.value;
  set fee (String value) => _fee.value = value;
  // 发送中
  final Rx<bool> _sendLoadding = false.obs;
  bool get sendLoadding => _sendLoadding.value;
  set sendLoadding (bool value) => _sendLoadding.value = value;
}

class WalletTokenSendPageController extends GetxController {
  WalletTokenSendPageController();
  WalletTokenSendPageState state = WalletTokenSendPageState();
  // 地址controller
  TextEditingController addressController = TextEditingController();
  // 数量controller
  TextEditingController volumeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    state.accountInfo
      ..address = 'gx1dxz3ywcq9nah6qyaav2quwctztst0yvyl8g04y'
      ..nickName = 'cosmo-import-1'
      ..createTime = DateTime.now();
    state.accountInfo
      .tokenList = [
        TokenModel()
          ..symbol = 'plugcn'
          ..scale = 6
          ..minUnit = 'uplugcn',
        TokenModel()
          ..symbol = 'shamer'
          ..scale = 8
          ..minUnit = 'sha',
      ];
    state.tokenInfo = TokenModel()
          ..symbol = 'plugcn'
          ..scale = 6
          ..minUnit = 'uplugcn'
          ..amount = '1000000000000';
    state.fee = '200';
  }

  @override
  onClose() {
    LLoading.dismiss();
  }


  // 前往地址簿
  onGoToAddressList() {
    
  }
  // 扫码事件
  onScanQr() {
  }
  // 全部划转
  onAllSend() {
    int canUseVolume = int.parse(state.tokenInfo.amount) - int.parse(state.fee);
    volumeController.text = NumberTool.amountToBalance(canUseVolume.toString(), scale: state.tokenInfo.scale);
  }
  // 确认转账
  onSend() async {
    Get.focusScope?.unfocus();
    String? password = await LBottomSheet.passwordBottomSheet();
    print(password);
    state.sendLoadding = true;
    LLoading.showLoading();
    await Future.delayed(const Duration(seconds: 1));
    LLoading.dismiss();
    state.sendLoadding = false;
  }
}