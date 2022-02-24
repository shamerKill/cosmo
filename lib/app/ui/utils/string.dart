import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:plug/app/data/models/interface/interface.dart';

class StringTool {
  // 比较字符串大小
  static bool asciiABiggerThanB (String aItem, String bItem) {
    Uint8List _aList = const AsciiCodec().encode(aItem);
    Uint8List _bList = const AsciiCodec().encode(bItem);
    int _listLength = _aList.length > _bList.length ? _aList.length : _bList.length;
    for (int _i = 0; _i < _listLength; _i++) {
      if (_aList[_i] > _bList[_i]) {
        return true;
      } else if (_aList[_i] < _bList[_i]) {
        return false;
      }
    }
    return false;
  }
  // 隐藏字符串中间
  static String hideAddressCenter(String address, { int startLen = 8, int endLen = 8 }) {
    if (address.length < (startLen + endLen)) return address;
    String result = address.replaceRange(startLen, address.length - endLen, '...');
    return result;
  }
  // 获取网络地址的local
  static String getNetLocal(String address) => Uri.tryParse(address)?.host??'';
  // 根据字符串选择颜色
  static Color stringToColor(String str) {
    const List<Color> tokenBgList = [
      Color(0xff3f8678),
      Color(0xff15212e),
      Color(0xffe44a5d),
      Color(0xff66bfd0),
      Color(0xfff5bf55),
      Color(0xff235777),
      Color(0xff1e2a81),
      Color(0xff0074e4),
    ];
    Uint8List _uList = const AsciiCodec().encode(str);
    int _sum = 0;
    for (int _i in _uList) {
      _sum += _i;
    }
    return tokenBgList[_sum % tokenBgList.length];
  }
  // 数组拼接成字符串
  static String listToString(List<String> list) => list.join(',');
  // 字符串结构成数组
  static List<String> stringToList(String str) => str.split(',');
  // 格式化时间
  static String formatTime(DateTime? date, { String format = 'yyyy-MM-dd HH:mm:ss' }) {
    if (date == null) return '';
    String result = format;
    result = result.replaceAll('yyyy', '${date.year}');
    result = result.replaceFirst('MM', '${date.month < 10 ? '0' : ''}${date.month}');
    result = result.replaceFirst('dd', '${date.day < 10 ? '0' : ''}${date.day}');
    result = result.replaceFirst('HH', '${date.hour < 10 ? '0' : ''}${date.hour}');
    result = result.replaceFirst('mm', '${date.minute < 10 ? '0' : ''}${date.minute}');
    result = result.replaceFirst('ss', '${date.second < 10 ? '0' : ''}${date.second}');
    return result;
  }
  // 判断是否是http url
  static bool isHttpUrl(String url) {
    return RegExp(r'^http:\/\/.+$').hasMatch(url);
  }
  // 判断是否是https url
  static bool isHttpsUrl(String url) {
    return RegExp(r'^https:\/\/.+$').hasMatch(url);
  }
  // 根据节点状态返回文字
  static String getVerifierStatus(VerifierStatusEnum status) {
    switch (status) {
      case VerifierStatusEnum.running: return '运行中';
      case VerifierStatusEnum.offLine: return '已离线';
      case VerifierStatusEnum.jailing: return '监禁中';
      case VerifierStatusEnum.invalid: return '已失效';
    }
  }
  // 创建随机数
  static String getRandomStr() {
    var time = DateTime.now().toIso8601String();
    var random = Random().nextInt(10000);
    return '$time-$random';
  }
  // 判断是否是cosmo链接
  static bool checkCosmoLink(String link) {
    RegExp reg = RegExp(r"^cosmo:.*$");
    return reg.hasMatch(link);
  }
  // 将cosmo链接接取成对象
  static Map<String, dynamic> formatCosmoLink(String link) {
    Map<String, dynamic> result = {};
    var _link = link.replaceFirst(r"cosmo:", "");
    try {
      result = json.decode(_link);
    } catch(e) {}
    return result;
  }
  // 判断是否是plug chain地址
  static bool checkChainAddress(String address) {
    RegExp reg = RegExp(r"^gx[0-9a-zA-Z]{39}$");
    return reg.hasMatch(address);
  }
  // 判断是否是网址
  static bool checkNetAddress(String link) {
    RegExp reg = RegExp(r"^http(s?)://.*$");
    return reg.hasMatch(link);
  }
  /// 检测邮箱
  static bool checkEmail(String email) => RegExp(r"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$").hasMatch(email);
}