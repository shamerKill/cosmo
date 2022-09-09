part of './interface.dart';

/// 网络模型
class NetWorkModel extends _StorageBaseAbstract {
  /// id
  int get id => _id;
  set id(int value) {
    _id = value;
    _saveKey();
  }

  int _id = 0;

  /// 名称
  String get name => _name;
  set name(String value) {
    _name = value;
    _saveKey();
  }

  String _name = '';

  /// 网址列表
  List<String> get addressList => _addressList;
  set addressList(List<String> value) {
    _addressList = value;
    _saveKey();
  }

  List<String> _addressList = [];

  /// 类型
  /// 0 主网
  /// 1 测试网
  int get type => _type;
  set type(int value) {
    _type = value;
    _saveKey();
  }

  int _type = 0;

  NetWorkModel._() : super();
  factory NetWorkModel() => create();
  static NetWorkModel create() => NetWorkModel._();

  @override
  void _saveKey() {
    _valueMap['name'] = name;
    _valueMap['addressList'] = addressList;
    _valueMap['type'] = type;
    _valueMap['id'] = id;
  }

  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    name = source['name'] ?? '';
    addressList = source['addressList'] ?? [];
    type = source['type'] ?? 0;
    id = source['id'] ?? 0;
  }
}
