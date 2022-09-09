import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/data/services/net.services.dart';

class WalletTokenDetailPageState {
  // 当前代币详情
  final Rx<TokenModel> _tokenInfo = TokenModel().obs;
  TokenModel get tokenInfo => _tokenInfo.value;
  set tokenInfo(TokenModel value) => _tokenInfo.value = value;
  // 当前代币是否已经添加
  final Rx<bool> _isAdd = false.obs;
  bool get isAdd => _isAdd.value;
  set isAdd(bool value) => _isAdd.value = value;
  // 是否显示按钮
  final Rx<bool> _showButton = true.obs;
  bool get showButton => _showButton.value;
  set showButton(bool value) => _showButton.value = value;
}

class WalletTokenDetailPageController extends GetxController {
  WalletTokenDetailPageController();

  WalletTokenDetailPageState state = WalletTokenDetailPageState();
  DataAccountController dataAccount = Get.find();
  DataCoinsController dataCoins = Get.find();

  @override
  onReady() {
    String? tokenId = Get.parameters['token'];
    if (tokenId == null) return Get.back();
    if (tokenId == dataCoins.state.baseCoin.minUnit) state.showButton = false;
    if (tokenId.startsWith(Env.envConfig.chainInfo.addressPrefix) &&
        tokenId.length == 41) {
      _getTokenPrc20(tokenId);
    } else {
      _getTokenPrc10(tokenId);
    }
  }

  // 获取币种
  _getTokenPrc10(String tokenId) async {
    LLoading.showLoading();
    var _token = dataAccount.state.nowAccount?.tokenList
        .firstWhereOrNull((_token) => _token.minUnit == tokenId);
    if (_token != null) state.isAdd = true;
    _token ??= await httpToolApp.getCoinInfo(tokenId);
    if (_token != null) state.tokenInfo = _token;
    LLoading.dismiss();
  }

  _getTokenPrc20(String tokenId) async {
    LLoading.showLoading();
    var _token = dataAccount.state.nowAccount?.tokenList
        .firstWhereOrNull((_token) => _token.contractAddress == tokenId);
    if (_token != null) state.isAdd = true;
    _token ??= (await httpToolServer.searchTokenInfo(tokenId)).data['token'];
    if (_token != null) state.tokenInfo = _token;
    LLoading.dismiss();
  }

  // 代币移除/添加
  onTokenToggle() async {
    var _account = dataAccount.state.nowAccount;
    if (_account == null) return;
    _account = AccountModel()..setData(_account.toJson());
    LLoading.showLoading();
    await Future.delayed(const Duration(milliseconds: 200));
    if (state.isAdd) {
      var _index = dataAccount.state.nowAccount?.tokenList
          .indexWhere((_item) => _item.minUnit == state.tokenInfo.minUnit);
      if (_index != null) {
        _account.tokenList.removeAt(_index);
        dataAccount.updateAccount(_account);
      }
    } else {
      _account.tokenList.add(state.tokenInfo);
      dataAccount.updateAccount(_account);
    }
    state._isAdd.toggle();
    LLoading.dismiss();
  }
}
