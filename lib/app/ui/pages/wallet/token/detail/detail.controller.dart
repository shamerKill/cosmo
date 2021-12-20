import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';

class WalletTokenDetailPageState {
  // 当前代币详情
  final Rx<TokenModel> _tokenInfo = TokenModel().obs;
  TokenModel get tokenInfo => _tokenInfo.value;
  set tokenInfo (TokenModel value) => _tokenInfo.value = value;
  // 当前代币是否已经添加
  final Rx<bool> _isAdd = false.obs;
  bool get isAdd => _isAdd.value;
  set isAdd (bool value) => _isAdd.value = value;
}

class WalletTokenDetailPageController extends GetxController {
  WalletTokenDetailPageController();
  WalletTokenDetailPageState state = WalletTokenDetailPageState();

  @override
  onInit() {
    super.onInit();
    String? token = Get.parameters['token'];
    if (token == null) return Get.back();
    state.tokenInfo
      ..symbol = 'p$token'
      ..minUnit = token
      ..name = 'p$token'
      ..amount = '10000123'
      ..scale = 6
      ..initialSupply = '10086111234123'
      ..maxSupply = '100000000000000'
      ..owner = 'gx1ax3kr9ut96pj4f84cs644de30han5ulxwpa65d'
      ..mintable = true
      ..remarks = '你好么'
      ..logo = 'http://via.placeholder.com/43x46';
  }

  // 代币移除/添加
  onTokenToggle() async {
    LLoading.showLoading();
    await Future.delayed(const Duration(milliseconds: 500));
    state._isAdd.toggle();
    LLoading.dismiss();
  }

}