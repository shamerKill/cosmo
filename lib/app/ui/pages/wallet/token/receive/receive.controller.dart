import 'package:clipboard/clipboard.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';

class WalletTokenReceivePageState {
  // 账户信息
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo(AccountModel value) => _accountInfo.value = value;
  // 币种信息
  final Rx<TokenModel> _tokenInfo = TokenModel().obs;
  TokenModel get tokenInfo => _tokenInfo.value;
  set tokenInfo(TokenModel value) => _tokenInfo.value = value;
}

class WalletTokenReceivePageController extends GetxController {
  WalletTokenReceivePageController();
  WalletTokenReceivePageState state = WalletTokenReceivePageState();

  DataAccountController dataAccount = Get.find();

  @override
  void onReady() {
    String? token = Get.parameters['token'];
    if (dataAccount.state.nowAccount == null || token == null) {
      return Get.back();
    }
    state.accountInfo = dataAccount.state.nowAccount!;
    state._accountInfo.refresh();
    for (var _item in state.accountInfo.tokenList) {
      if (_item.minUnit == token || _item.contractAddress == token) {
        state.tokenInfo = _item;
      }
    }
    state._tokenInfo.refresh();
  }

  // 分享操作
  onShare() {
    LToast.warning('canNotShare'.tr);
  }

  // 复制操作
  onCopy() {
    FlutterClipboard.copy(state.accountInfo.address)
        .then((value) => LToast.success('SuccessWithCopy'.tr));
  }
}
