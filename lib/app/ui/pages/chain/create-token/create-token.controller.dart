import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.base-coin.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/wallet.dart';

class ChainCreateTokenPageState {
  // 手续费
  final Rx<String> _fee = ''.obs;
  String get fee => _fee.value;
  set fee (String value) => _fee.value = value;
  // 发行费用
  final Rx<String> _createFee = ''.obs;
  String get createFee => _createFee.value;
  set createFee (String value) => _createFee.value = value;
  // 代币是否已创建
  final Rx<bool> _isExist = false.obs;
  bool get isExist => _isExist.value;
  set isExist (bool value) => _isExist.value = value;
  // 是否在等待中
  final Rx<bool> _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  set isLoading (bool value) => _isLoading.value = value;
}

class ChainCreateTokenPageController extends GetxController {
  ChainCreateTokenPageController();
  ChainCreateTokenPageState state = ChainCreateTokenPageState();
  TextEditingController coinNameTextController = TextEditingController();
  TextEditingController coinSymbolTextController = TextEditingController();
  TextEditingController coinTotalVolumeTextController = TextEditingController();
  TextEditingController coinScaleVolumeTextController = TextEditingController(text: scaleList[0]);
  TextEditingController coinMintableVolumeTextController = TextEditingController(text: mintableList[0]);
  FocusNode coinSymbolFocusNode = FocusNode();
  // 精度列表
  static List<String> scaleList = ['0', '1', '2', '3', '4', '5', '6', '7', '8'];
  // 可增发列表
  static List<String> mintableList = ['是'.tr, '否'.tr];
  
  
  DataCoinsController dataCoins = Get.find();
  DataAccountController dataAccount = Get.find();

  @override
  onReady() {
    _getFee();
    coinSymbolFocusNode.addListener(() {
      symbolFeeFocus(coinSymbolFocusNode.hasFocus);
    });
  }

  // 获取手续费
  _getFee() async {
    var result = await httpToolServer.getChainFee();
    state.fee = result.data??'';
  }
  symbolFeeFocus(bool type) {
    if (type == false) _getTokenCreateFee();
  }
  // 获取代币发行费用
  _getTokenCreateFee() async {
    if (coinSymbolTextController.text == '') return;
    LLoading.showLoading();
    state.createFee = '';
    var result = await httpToolApp.getChainCreateTokenFee(coinSymbolTextController.text);
    LLoading.dismiss();
    if (result.status == 0 && result.data != null) {
      if (result.data['exist'] == true) {
        state.isExist = true;
      } else {
        state.isExist = false;
      }
      state.createFee = NumberTool.amountToBalance(result.data['issue_fee']['amount']);
    }
  }
  // 修改精度
  onExchangeScale() async {
    var oldScale = BigInt.parse(coinScaleVolumeTextController.text);
    Get.focusScope?.unfocus();
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: LBottomSheet.selectSheetChild(
        selected: scaleList.indexWhere((e) => e == coinScaleVolumeTextController.text),
        labelList: scaleList,
        successCallBack: (int type) {
          coinScaleVolumeTextController.text = scaleList[type];
          if (coinTotalVolumeTextController.text != '') {
            BigInt total = BigInt.parse(coinTotalVolumeTextController.text);
            var scale = BigInt.parse(scaleList[type]);
            if (scale > oldScale) {
              total = total * BigInt.from(pow(10, (scale - oldScale).toInt()));
            } else if (scale < oldScale) {
              total = total ~/ BigInt.from(pow(10, (oldScale - scale).toInt()));
            }
            coinTotalVolumeTextController.text = NumberTool.getNumberInt(total.toString());
          }
          Get.back();
        }
      ),
    );
  }
  // 修改是否可增发
  onExchangeMintable() {
    Get.focusScope?.unfocus();
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: LBottomSheet.selectSheetChild(
        selected: mintableList.indexWhere((e) => e == coinMintableVolumeTextController.text),
        labelList: mintableList,
        successCallBack: (int type) {
          coinMintableVolumeTextController.text = mintableList[type];
          Get.back();
        }
      ),
    );
  }
  // 开始发行
  createToken() async {
    if (!RegExp(r'^[az][a-z0-9]{2,7}$').hasMatch(coinSymbolTextController.text)) return LToast.warning('简称仅可使用小写字母和数字'.tr);
    if (
      coinNameTextController.text == '' || !RegExp(r'^[az][a-z0-9]{2 ,7}$').hasMatch(coinSymbolTextController.text) || coinTotalVolumeTextController.text == '' || state.createFee == '' || state.isLoading
    ) return LToast.warning('信息有误'.tr);
    var _pass = await LBottomSheet.passwordBottomSheet();
    if (_pass == null) return;
    LLoading.showLoading();
    var mnemonicList = await WalletTool.decryptMnemonic(dataAccount.state.nowAccount!.stringifyRaw, _pass);
    if (mnemonicList == null) {
      LLoading.dismiss();
      return LToast.warning('密码输入错误'.tr);
    }
    Get.focusScope?.unfocus();
    state.isLoading = true;
    var result = await WalletTool.createToken(
      mnemonic: mnemonicList,
      name: coinNameTextController.text,
      symbol: coinSymbolTextController.text,
      minUnit: coinSymbolTextController.text,
      initialSupply: coinTotalVolumeTextController.text,
      maxSupply: coinTotalVolumeTextController.text,
      mintable: coinMintableVolumeTextController.text == mintableList[0],
      scale: coinScaleVolumeTextController.text,
      gasAll: state.fee,
    );
    if (result.status == -10001) return LToast.error('ErrorWithSendCallback'.tr);
    if (result.status == -10002) return LToast.error('ErrorWithSendTimeout'.tr);
    if (result.status == 2) return LToast.error('ErrorWithCoinName'.tr);
    if (result.status == 3) return LToast.error('ErrorWithCoinMinUnit'.tr);
    if (result.status == 4) return LToast.error('ErrorWithCoinSymbol'.tr);
    if (result.status == 5) return LToast.error('ErrorWithCoinTotalSupply'.tr);
    if (result.status == 6) return LToast.error('ErrorWithCoinInitSupply'.tr);
    if (result.status == 7) return LToast.error('ErrorWithCoinScale'.tr);
    if (result.status == 8) return LToast.error('ErrorWithCoinSymbolRepeat'.tr);
    if (result.status != 0) return LToast.error('ErrorWithSendUnknown'.tr);
    LToast.success('SuccessWithSend'.tr);
    dataAccount.updateAccount(
      dataAccount.state.nowAccount!..tokenList.add(
        TokenModel()
          ..symbol = coinSymbolTextController.text
          ..name = coinNameTextController.text
          ..minUnit = coinSymbolTextController.text
          ..initialSupply = coinTotalVolumeTextController.text
          ..maxSupply = coinTotalVolumeTextController.text
          ..mintable = coinMintableVolumeTextController.text == mintableList[0]
          ..owner = dataAccount.state.nowAccount!.address
          ..scale = int.parse(coinScaleVolumeTextController.text)
      )
    );
    coinSymbolTextController.text = '';
    coinNameTextController.text = '';
    coinTotalVolumeTextController.text = '';
    coinScaleVolumeTextController.text = scaleList[0];
    coinMintableVolumeTextController.text = mintableList[0];
    state.createFee = '';
  }
}