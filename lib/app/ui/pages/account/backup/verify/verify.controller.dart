import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:plug/app/env/env.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/utils/string.dart';

class AccountBackupVerifyPageState {
  /// 原助记词列表
  final RxList<String> _mnemonicList = RxList();
  List<String> get mnemonicList => _mnemonicList;

  /// 随机助记词列表
  final RxList<String> _mnemonicRandomList = RxList();
  List<String> get mnemonicRandomList => _mnemonicRandomList;

  /// 选择助记词列表
  final RxList<String> _mnemonicSelectList = RxList();
  List<String> get mnemonicSelectList => _mnemonicSelectList;

  /// 助记词选择是否正确
  final Rx<bool> _selectSuccess = false.obs;
  bool get selectSuccess => _selectSuccess.value;
  set selectSuccess (bool value) => _selectSuccess.value = value;
}

class AccountBackupVerifyPageController extends GetxController {
  AccountBackupVerifyPageController();
  AccountBackupVerifyPageState state = AccountBackupVerifyPageState();

  @override
  onInit() {
    super.onInit();
    state._mnemonicList.addAll([
      'purchase','kiwi','gloom','margin','frozen','diagram','cry','sort','chalk','parade','coach','manual'
    ]);
    _randomList();
  }

  _randomList () {
    if (Env.envConfig.isRelease) {
      state._mnemonicRandomList
        ..addAll(state._mnemonicList)
        ..sort((aItem, bItem) => StringTool.asciiABiggerThanB(aItem, bItem) ? 1 : -1);
    } else {
      state._mnemonicRandomList.addAll(state._mnemonicList);
    }
  }

  selectMnemonic(String word) {
    var index = state._mnemonicSelectList.indexOf(word);
    if (index < 0) {
      state._mnemonicSelectList.add(word);
    } else {
      state._mnemonicSelectList.removeAt(index);
    }
    state.selectSuccess = listEquals(state._mnemonicSelectList, state._mnemonicList);
  }

  // 下一步
  stepFunc () {
    Get.offAllNamed(PlugRoutesNames.walletHome);
  }
}