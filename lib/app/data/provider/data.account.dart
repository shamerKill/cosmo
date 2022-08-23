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
    AccountModel? _account;
    for (var element in _accountsList) {
      if (element.weight >= maxWeight) {
        maxWeight = element.weight;
        _account = element;
      }
    }
    return _account;
  }
  // 判断是否有账户
  bool get hadAccount => _accountsList.isNotEmpty;
  // 创建账户时，暂存的账户
  AccountModel? memAccount;
  // 创建账户时，暂存的助记词
  List<String>? memMnemonic;
  // 备份账户时，暂存的地址
  String? memAddress;
}

class DataAccountController extends GetxController {
  DataAccountController() {
    _readStorage();
  }

  final DataAccountState state = DataAccountState();

  // 添加账户
  List<AccountModel> addAccount(AccountModel account) {
    if (checkAccountIsHad(account)) {
      for (int i = 0; i< state.accountsList.length; i++) {
        var item = state.accountsList[i];
        if (item.address == account.address && account.accountType == item.accountType) {
          state.accountsList.removeAt(i);
          break;
        }
      }
    }
    state.accountsList.add(account);
    saveAccounts();
    return state.accountsList;
  }
  bool checkAccountIsHad(AccountModel account) {
    for (var item in state.accountsList) {
      if (item.address == account.address && account.accountType == item.accountType) return true;
    }
    return false;
  }
  // 储存账户
  saveAccounts() {
    GetStorage().write(state.accountStorageName, json.encode(state.accountsList.map((e) => e.toJson()).toList()));
  }
  // 切换账户
  bool exchangeAccount(String _address) {
    if (_address == state.nowAccount!.address) return false;
    for (var item in state.accountsList) {
      if (item.address == _address) {
        var weight = state.nowAccount!.weight;
        state.nowAccount!.weight = item.weight;
        item.weight = weight;
        saveAccounts();
        return true;
      }
    }
    return false;
  }
  // 根据地址获取账户
  AccountModel? getAccountFromAddress(String _address) {
    for (var element in state.accountsList) {
      if (element.address == _address) return element;
    }
    return null;
  }
  // 更新账户处理
  bool updateAccount(AccountModel? _account) {
    if (_account == null) return false;
    for (var _item in state.accountsList) {
      if (_item.address == _account.address) {
        _item.setData(_account.toJson());
        saveAccounts();
        return true;
      }
    }
    return false;
  }
  // 更新账户名称
  bool updateAccountName(String _address, String _nickName) {
    for (var _item in state.accountsList) {
      if (_item.nickName == _nickName) return false;
    }
    for (var _item in state.accountsList) {
      if (_item.address == _address) {
        _item.nickName = _nickName;
        saveAccounts();
        return true;
      }
    }
    return false;
  }
  // 移除账户
  bool removeAccount(AccountModel _account) {
    var _index = state.accountsList.indexWhere((element) => element.address == _account.address);
    if (_index < 0) return false;
    state.accountsList.removeAt(_index);
    saveAccounts();
    return true;
  }
  // 判断账户是否有基础币
  bool checkAccountHadCoin(String address, String minUnit) {
    return getAccountFromAddress(address)?.tokenList.where((element) => element.minUnit == minUnit).isNotEmpty??false;
  }
  _readStorage() {
    // 读取账户列表
    String? data = GetStorage().read(state.accountStorageName);
    if (data == null) return;
    try {
      List<dynamic> listData = json.decode(data);
      state.accountsList.addAll(listData.map((e) => AccountModel()..setData(e)));
    } catch (_) {}
  }
}