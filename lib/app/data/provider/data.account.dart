import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plug/app/data/models/interface/interface.dart';

class DataAccountState {
  String get accountStorageName => 'accountsList';
  // 本地账户列表
  final RxList<AccountModel> _accountsList = RxList<AccountModel>();
  // 获取所有账户列表
  List<AccountModel> get accountsList => _accountsList;
  // 获取当前账户
  AccountModel? get nowAccount {
    if (!hadAccount) return null;
    int maxWeight = 0;
    for (var element in _accountsList) {
      if (element.weight > maxWeight) {
        maxWeight = element.weight;
      }
    }
    print(_accountsList[maxWeight].toJson());
    return _accountsList[maxWeight];
  }
  // 判断是否有账户
  bool get hadAccount => _accountsList.isNotEmpty;
  // 创建账户时，暂存的账户
  AccountModel? memAccount;
  // 创建账户时，暂存的助记词
  List<String>? memMnemonic;
}

class DataAccountController extends GetxController {
  DataAccountController() {
    _readStorage();
  }

  final DataAccountState state = DataAccountState();

  // 添加账户
  List<AccountModel> addAccount(AccountModel account) {
    state.accountsList.add(account);
    saveAccounts();
    return state.accountsList;
  }
  // 储存账户
  saveAccounts() {
    GetStorage().write(state.accountStorageName, json.encode(state.accountsList.map((e) => e.toJson()).toList()));
  }
  _readStorage() {
    // 读取账户列表
    String? data = GetStorage().read(state.accountStorageName);
    if (data == null) return;
    try {
      List<dynamic> listData = json.decode(data);
      state.accountsList.addAll(listData.map((e) => AccountModel()..setData(e)));
    } catch (e) {}
  }
}