import 'dart:convert';

import 'dart:typed_data';

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
}