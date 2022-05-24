import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:plug/app/data/models/interface/interface.dart';

class DataConfigState {
  String get baseStorageName => 'DATACONFIGSTATE';
  final Rx<ConfigAppData> _config = ConfigAppData().obs;
  ConfigAppData get config => _config.value;
  set config (ConfigAppData value) => _config.value = value;
}


class DataConfigController extends GetxController {
  DataConfigController() {
    _readStorage();
  }
  final DataConfigState state = DataConfigState();

  // 更新dapp安全配置
  upSafeViewType(bool type) {
    state.config.safeDappView = type;
    _saveConfig();
  }
  // 更新语言版本
  upLocaleType(Locale locale) {
    state.config.languageType = locale;
    _saveConfig();
  }
  // 修改首页隐藏展示
  upHomeHide(bool type) {
    state.config.homeValueHide = type;
    _saveConfig();
  }
  // 储存配置
  _saveConfig() {
    GetStorage().write(state.baseStorageName, state.config.toJson());
  }
  // 读取本地配置
  _readStorage() {
    String? data = GetStorage().read(state.baseStorageName);
    if (data == null) return;
    state.config.setData(data);
  }
}