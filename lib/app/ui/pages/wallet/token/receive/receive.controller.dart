import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class WalletTokenReceivePageState {
  // 账户信息
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo (AccountModel value) => _accountInfo.value = value;  
  // 币种信息
  final Rx<TokenModel> _tokenInfo = TokenModel().obs;
  TokenModel get tokenInfo => _tokenInfo.value;
  set tokenInfo (TokenModel value) => _tokenInfo.value = value;
}

class WalletTokenReceivePageController extends GetxController {
  WalletTokenReceivePageController();
  WalletTokenReceivePageState state = WalletTokenReceivePageState();

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
    state._accountInfo.refresh();
    state.tokenInfo = TokenModel()
          ..symbol = 'plugcn'
          ..scale = 6
          ..minUnit = 'uplugcn';
  }

  // 分享操作
  onShare() {
    LToast.warning('暂不支持分享'.tr);
  }
  // 复制操作
  onCopy() {
    FlutterClipboard.copy(state.accountInfo.address).then(( value ) => LToast.success('SuccessWithCopy'.tr));
  }
}