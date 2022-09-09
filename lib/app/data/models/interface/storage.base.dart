part of './interface.dart';

abstract class _StorageBaseAbstract {
  _StorageBaseAbstract() {
    _saveKey();
  }

  /// 键名键值
  final Map<String, dynamic> _valueMap = {};

  /// 对象转为jsonString
  ///
  /// 可以转换 基本类型/子类/list/dateTime
  String toJson() {
    Map<String, dynamic> jsonMap = {};
    for (var key in _valueMap.keys) {
      if (_valueMap[key] is _StorageBaseAbstract) {
        jsonMap[key] = _valueMap[key].toJson();
      } else if (_valueMap[key] is List) {
        jsonMap[key] = _valueMap[key].map((item) {
          if (item is _StorageBaseAbstract) {
            item = item.toJson();
          }
          return item;
        }).toList();
      } else if (_valueMap[key] is DateTime) {
        jsonMap[key] = _valueMap[key].toString();
      } else if (_valueMap[key] is bool ||
          _valueMap[key] is String ||
          _valueMap[key] is num) {
        jsonMap[key] = _valueMap[key];
      } else {
        jsonMap[key] = _valueMap[key].toString();
      }
    }
    return json.encode(jsonMap);
  }

  /// 需要将储存的属性存入_valueMap中
  /// 储存键名/键值
  void _saveKey();

  /// jsonString 转为对象
  void setData(String sourceStr);
}

// class StorageDemo extends _StorageBaseAbstract {

//   String _saveData = '';
//   String get data => _saveData;
//   set data (String value) {
//     _saveData = value;
//     _saveKey();
//   }

//   double _saveVolume = 0.0;
//   double get volume => _saveVolume;
//   set volume (double value) {
//     _saveVolume = value;
//     _saveKey();
//   }

//   StorageEx _saveUser = StorageEx();
//   StorageEx get user => _saveUser;
//   set user (StorageEx value) {
//     _saveUser = value;
//     _saveKey();
//   }

//   StorageDemo._(): super();
//   factory StorageDemo() => create();
//   static StorageDemo create() => StorageDemo._();

//   @override
//   _saveKey(){
//     _valueMap['data'] = _saveData;
//     _valueMap['volume'] = _saveVolume;
//     _valueMap['user'] = _saveUser;
//   }
//   @override
//   void setData(String sourceStr) {
//     Map<String, dynamic> source = json.decode(sourceStr);
//     data = source['data']??'';
//     volume = source['volume']??0.0;
//     user = StorageEx()..setData(source['user']);
//   }
// }

// class StorageEx extends _StorageBaseAbstract {
//   int _saveAge = 0;
//   int get age => _saveAge;
//   set age (int value) {
//     _saveAge = value;
//     _saveKey();
//   }
//   String _saveName = '';
//   String get name => _saveName;
//   set name (String value) {
//     _saveName = value;
//     _saveKey();
//   }

//   StorageEx._(): super();
//   factory StorageEx() => create();
//   static StorageEx create() => StorageEx._();

//   @override
//   _saveKey(){
//     _valueMap['age'] = _saveAge;
//     _valueMap['name'] = _saveName;
//   }
//   @override
//   void setData(String sourceStr) {
//     Map<String, dynamic> source = json.decode(sourceStr);
//     age = source['age']??0;
//     name = source['name']??'';
//   }
// }
