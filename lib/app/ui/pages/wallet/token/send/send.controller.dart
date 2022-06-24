import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/evm/evmClient.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';
import 'package:plug/app/ui/utils/wallet.dart';

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
  final Rx<bool> _sendLoading = false.obs;
  bool get sendLoading => _sendLoading.value;
  set sendLoading (bool value) => _sendLoading.value = value;
}

class WalletTokenSendPageController extends GetxController {
  WalletTokenSendPageController();
  WalletTokenSendPageState state = WalletTokenSendPageState();
  // 地址controller
  TextEditingController addressController = TextEditingController();
  // 数量controller
  TextEditingController volumeController = TextEditingController();

  DataAccountController dataAccount = Get.find();
  DataCoinsController dataCoins = Get.find();

  @override
  void onReady() async {
    String? tokenIndent = Get.parameters['token'];
    if (dataAccount.state.nowAccount == null || tokenIndent == null) return Get.back();
    state.accountInfo = dataAccount.state.nowAccount!;
    for (var _item in state.accountInfo.tokenList) {
      if (_item.minUnit == tokenIndent || _item.contractAddress == tokenIndent) {
        state.tokenInfo = _item;
      }
    }
    if (state.tokenInfo.minUnit != tokenIndent && state.tokenInfo.contractAddress != tokenIndent) {
      LToast.warning('sendWarningTip'.tr + '(' + tokenIndent + ')');
      return Get.back();
    }
    _checkUriParameters();
    LLoading.showBgLoading();
    await _getInit();
    LLoading.dismiss();
  }

  @override
  onClose() {
    LLoading.dismiss();
  }
  // 判断链接内参数
  _checkUriParameters() {
    var address = Get.parameters['address'];
    var volume = Get.parameters['volume'];
    if (address != null) addressController.text = address;
    if (volume != null) volumeController.text = volume;
  }

  _getInit() async {
    var result = await Future.wait([
      // 账户余额
      httpToolApp.getAccountBalance(dataAccount.state.nowAccount!.address, state.tokenInfo.type == enumTokenType.prc10 ? state.tokenInfo.minUnit : state.tokenInfo.contractAddress),
      // 手续费
      httpToolServer.getChainFee(),
    ]);
    var _balance = result[0];
    var _fee = result[1];
    if (_balance != null && _balance.status == 0) {
      state.tokenInfo.amount = _balance.data;
      state._tokenInfo.refresh();
    }
    state.fee = _fee?.data??'0.0002';
  }

  // 前往地址簿
  onGoToAddressList() async {
    dynamic address = await Get.toNamed(PlugRoutesNames.userAddressBookList, arguments: 'select');
    if (address != null) {
      addressController.text = address;
    }
  }
  // 扫码事件
  onScanQr() async {
    var address = await Get.toNamed(PlugRoutesNames.walletQrScanner, parameters: { 'result': 'true' });
    if (address is! String || !StringTool.checkChainAddress(address)) return LToast.error('ErrorWithAddressType'.tr);
    addressController.text = address;
  }
  // 全部划转
  onAllSend() {
    if (dataCoins.state.baseCoin.minUnit == state.tokenInfo.minUnit) {
      int canUseVolume = int.parse(state.tokenInfo.amount) - int.parse(NumberTool.balanceToAmount(state.fee));
      volumeController.text = NumberTool.amountToBalance(canUseVolume.toString(), scale: state.tokenInfo.scale);
    } else {
      volumeController.text = NumberTool.amountToBalance(state.tokenInfo.amount, scale: state.tokenInfo.scale);
    }
  }
  // 确认转账
  onSend() async {
    Get.focusScope?.unfocus();
    if (addressController.text == '') return LToast.warning('ErrorWithAddressInput'.tr);
    var _transferValue = NumberTool.balanceToAmount(volumeController.text);
    var douValue = double.tryParse(_transferValue);
    if (
      douValue == null || douValue == 0.0
    ) return LToast.warning('ErrorWithVolumeInput'.tr);
    String? password = await LBottomSheet.passwordBottomSheet();
    if (password == null) return;
    LLoading.showLoading();
    var mnemonicList = await WalletTool.decryptMnemonic(dataAccount.state.nowAccount!.stringifyRaw, password);
    if (mnemonicList == null) {
      LLoading.dismiss();
      return LToast.warning('ErrorWithPasswordInput'.tr);
    }
    Get.focusScope?.unfocus();
    state.sendLoading = true;
    HttpToolResponse result;
    if (state.tokenInfo.type == enumTokenType.prc10) {
      result = await WalletTool.transfer(
        mnemonic: mnemonicList,
        toAddress: addressController.text,
        volume: NumberTool.balanceToAmount(volumeController.text, scale: state.tokenInfo.scale),
        gasAll: NumberTool.balanceToAmount(state.fee),
        denom: state.tokenInfo.minUnit,
      );
    } else {
      result = await EvmClient(mnemonic: mnemonicList).sendAsync(
        StringTool.anyToHex(state.tokenInfo.contractAddress),
        EvmClient.toolFormatContractData(
          'transfer(address,uint256)',
          [
            StringTool.anyToHex(addressController.text),
            EvmClient.toolFormatVolumeToHex(double.tryParse(volumeController.text)??0, scale: state.tokenInfo.scale),
          ],
        ),
      );
    }
    state.sendLoading = false;
    _getInit();
    LLoading.dismiss();
    if (result.status == -10001) return LToast.error('ErrorWithSendCallback'.tr);
    if (result.status == -10002) return LToast.error('ErrorWithSendTimeout'.tr);
    if (result.status != 0) return LToast.error('ErrorWithSendUnknown'.tr);
    LToast.success('SuccessWithSend'.tr);
    addressController.text = '';
    volumeController.text = '';
    _getInit();
  }
}