import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:dart_bech32/dart_bech32.dart' as bech32;
import 'package:get/get.dart';
import 'package:web3dart/crypto.dart' as crypto;

import 'package:flutter/material.dart';
import 'package:plug/app/data/models/interface/interface.dart';

class StringTool {
  // 比较字符串大小
  static bool asciiABiggerThanB(String aItem, String bItem) {
    Uint8List _aList = const AsciiCodec().encode(aItem);
    Uint8List _bList = const AsciiCodec().encode(bItem);
    int _listLength =
        _aList.length > _bList.length ? _aList.length : _bList.length;
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
  static String hideAddressCenter(String address,
      {int startLen = 8, int endLen = 8}) {
    if (address.length < (startLen + endLen)) return address;
    String result =
        address.replaceRange(startLen, address.length - endLen, '...');
    return result;
  }

  // 获取网络地址的local
  static String getNetLocal(String address) =>
      Uri.tryParse(address)?.host ?? '';
  // 根据字符串选择颜色
  static Color stringToColor(String str) {
    const List<Color> tokenBgList = [
      Color(0xff00CC66),
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
  static String formatTime(DateTime? date,
      {String format = 'yyyy-MM-dd HH:mm:ss'}) {
    if (date == null) return '';
    String result = format;
    result = result.replaceAll('yyyy', '${date.year}');
    result =
        result.replaceFirst('MM', '${date.month < 10 ? '0' : ''}${date.month}');
    result =
        result.replaceFirst('dd', '${date.day < 10 ? '0' : ''}${date.day}');
    result =
        result.replaceFirst('HH', '${date.hour < 10 ? '0' : ''}${date.hour}');
    result = result.replaceFirst(
        'mm', '${date.minute < 10 ? '0' : ''}${date.minute}');
    result = result.replaceFirst(
        'ss', '${date.second < 10 ? '0' : ''}${date.second}');
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
      case VerifierStatusEnum.running:
        return 'verifierNodeRunning'.tr;
      case VerifierStatusEnum.offLine:
        return 'verifierNodeOffline'.tr;
      case VerifierStatusEnum.jailing:
        return 'verifierNodeJailing'.tr;
      case VerifierStatusEnum.invalid:
        return 'verifierNodeInvalid'.tr;
    }
  }

  // 创建随机数
  static String getRandomStr() {
    var time = DateTime.now().toIso8601String();
    var random = Random().nextInt(10000);
    return '$time-$random';
  }

  // 判断是否是pando链接
  static bool checkCosmoLink(String link) {
    RegExp reg = RegExp(r"^pando:.*$");
    return reg.hasMatch(link);
  }

  // 将pando链接接取成对象
  static Map<String, dynamic> formatCosmoLink(String link) {
    Map<String, dynamic> result = {};
    var _link = link.replaceFirst(r"pando:", "");
    try {
      result = json.decode(_link);
    } catch (e) {
      result = {};
    }
    return result;
  }

  // 判断是否是plug chain地址
  static bool checkChainAddress(String address) {
    RegExp reg = RegExp(r"^gx[0-9a-zA-Z]{39}$");
    return reg.hasMatch(address);
  }

  // 判断是否是hex地址
  static bool checkHexAddress(String address) {
    RegExp reg = RegExp(r"^0x[0-9a-zA-Z]{40}$");
    return reg.hasMatch(address);
  }

  // 判断是否是plug/hex地址
  static bool checkAddress(String address) {
    return checkChainAddress(address) || checkHexAddress(address);
  }

  // 判断是否是网址
  static bool checkNetAddress(String link) {
    RegExp reg = RegExp(r"^http(s?)://.*$");
    return reg.hasMatch(link);
  }

  /// 检测邮箱
  static bool checkEmail(String email) =>
      RegExp(r"^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$")
          .hasMatch(email);

  /// 账户类型切换
  static String accountTypeToString(EnumAccountType? type) =>
      type == EnumAccountType.prc20 ? 'PRC20' : 'PRC10';
  static EnumAccountType accountStringToType(String? str) =>
      str == 'PRC20' ? EnumAccountType.prc20 : EnumAccountType.prc10;

  /// 代币类型切换
  static String tokenTypeToString(EnumTokenType? type) =>
      type == EnumTokenType.prc20 ? 'PRC20' : 'PRC10';
  static EnumTokenType tokenStringToType(String? str) =>
      str == 'PRC20' ? EnumTokenType.prc20 : EnumTokenType.prc10;
  // hex转bech32
  static String hexToBech32(String hexAddress) {
    return bech32.bech32.encode(bech32.Decoded(
      prefix: 'gx',
      words: bech32.bech32.toWords(crypto.hexToBytes(hexAddress)),
    ));
  }

  // bech32转hex
  static String bech32ToHex(String bech32Address) {
    return '0x' +
        crypto.bytesToHex(bech32.bech32
            .fromWords(bech32.bech32.decode(bech32Address, 1023).words));
  }

  // 任意地址转bech32
  static String anyToBech32(String address) {
    if (checkAddress(address)) return address;
    return hexToBech32(address);
  }

  // 任意地址转hex
  static String anyToHex(String address) {
    if (checkHexAddress(address)) return address;
    return bech32ToHex(address);
  }

  // 网站内容转码
  static String webInfoToBase(String input) {
    return 'data:text/html;base64,' + base64Encode(const Utf8Encoder().convert('''
      <!DOCTYPE html>
      <head>
        <meta charset="utf-8">
        <style>
          * {
            font-size: 40px;
          }
        </style>
      </head>
      <body>
        $input
      </body>
      </html>
    '''));
  }
}
