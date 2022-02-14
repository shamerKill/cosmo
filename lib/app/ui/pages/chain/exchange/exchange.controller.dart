import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';

class ChainExchangePageState {
  // 兑换币种
  final Rx<TokenModel> _startToken = TokenModel().obs;
  TokenModel get startToken => _startToken.value;
  set startToken (TokenModel value) => _startToken.value = value;
  // 兑换币种
  final Rx<TokenModel> _endToken = TokenModel().obs;
  TokenModel get endToken => _endToken.value;
  set endToken (TokenModel value) => _endToken.value = value;
  // 账户信息
  final Rx<AccountModel> _accountInfo = AccountModel().obs;
  AccountModel get accountInfo => _accountInfo.value;
  set accountInfo (AccountModel value) => _accountInfo.value = value;
  // 拥有的需要兑换数量
  final Rx<String> _accountOwnerAmount = ''.obs;
  String get accountOwnerAmount => _accountOwnerAmount.value;
  set accountOwnerAmount (String value) => _accountOwnerAmount.value = value;
  // 账户拥有所需发送的币的数量
  final Rx<String> _sendCoinBalance = ''.obs;
  String get sendCoinBalance => _sendCoinBalance.value;
  set sendCoinBalance (String value) => _sendCoinBalance.value = value;
  // 账户拥有基础币的数量
  final Rx<String> _baseCoinBalance = ''.obs;
  String get baseCoinBalance => _baseCoinBalance.value;
  set baseCoinBalance (String value) => _baseCoinBalance.value = value;
  // 兑换比例
  final Rx<String> _exchangeRate = ''.obs;
  String get exchangeRate => _exchangeRate.value;
  set exchangeRate (String value) => _exchangeRate.value = value;
}

class ChainExchangePageController extends GetxController {
  ChainExchangePageController();
  ChainExchangePageState state = ChainExchangePageState();
  // 转出控制器
  final sendInputController = TextEditingController();
  // 收到控制器
  final receiptInputController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    String? tokenList = Get.parameters['tokenList'];
    if (tokenList == null) return Get.back();
    _initGetData(tokenList);
  }

  _initGetData(String id) {
    state.startToken = (TokenModel()..symbol='ETH')..logo = 'http://via.placeholder.com/40x40'..scale=2..amount='1234512125';
    state.endToken = (TokenModel()..symbol='PLUGCN')..logo = 'http://via.placeholder.com/41x41'..scale=6..amount='400589123415123';
    state.accountOwnerAmount = '400589123415123';
    state.sendCoinBalance = '491912314.12314';
    state.baseCoinBalance = '102412341.1234';
  }
  
  // 监听转入数量
  onListenInputVolume(String volume) {
    computeOutputVolume();
  }
  // 转换兑换方向
  changeExchangeTokenList() {
    var mem = state.startToken;
    state.startToken = state.endToken;
    state.endToken = mem;
    sendInputController.clear();
  }
  // 最大数量转换
  onMaxExchange() {
    sendInputController.value = sendInputController.value.copyWith(text: state.sendCoinBalance);
    computeOutputVolume();
  }
  // 确认兑换
  onExchangeButton() {
  }
  // 根据比例转换输出数量
  computeOutputVolume() {
    receiptInputController.value = receiptInputController.value.copyWith(text: sendInputController.value.text);
  }
}