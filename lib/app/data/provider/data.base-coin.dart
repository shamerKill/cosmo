import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/utils/http.dart';

class DataCoinsState {
  String get baseCoinName => 'BASECOINNAME';
  // 是否已经初始化
  final Rx<bool> _isInit = false.obs;
  bool get isInit => _isInit.value;
  set isInit (bool value) => _isInit.value = value;
  // 基础币
  final Rx<TokenModel> _baseCoin = TokenModel().obs;
  TokenModel get baseCoin => _baseCoin.value;
  set baseCoin (TokenModel value) => _baseCoin.value = value;
}


class DataCoinsController extends GetxController {
  DataCoinsController() {
    _readStorage();
    _init();
  }
  final DataCoinsState state = DataCoinsState();

  _init() async {
    TokenModel? token = await httpToolApp.getBaseCoin();
    state.isInit = true;
    if (token != null) {
      state.baseCoin.setData(token.toJson());
      saveAccounts();
    }
  }
  // 储存基础币
  saveAccounts() {
    GetStorage().write(state.baseCoinName, state.baseCoin.toJson());
  }
  // 读取本地数据币
  _readStorage() {
    String? data = GetStorage().read(state.baseCoinName);
    if (data != null) state.baseCoin.setData(data);
  }
}