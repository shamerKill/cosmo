import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter/material.dart';

class StringTool {
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
  static String hideAddressCenter(String address, { int startLen = 8, int endLen = 8 }) {
    if (address.length < (startLen + endLen)) return address;
    String result = address.replaceRange(startLen, address.length - endLen, '...');
    return result;
  }
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
}