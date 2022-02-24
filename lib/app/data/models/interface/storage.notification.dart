part of './interface.dart';

/// 消息数据模型
class NotificationModel extends _StorageBaseAbstract {
  /// id
  String get id => _id;
  set id (String value) { _id = value; _saveKey(); }
  String _id = '';
  /// 标题
  String get title => _title;
  set title (String value) { _title = value; _saveKey(); }
  String _title = '';
  /// 时间
  String? get time => _time;
  set time (String? value) { _time = value; _saveKey(); }
  String? _time;
  /// 内容
  List<String> get context => _context;
  set context (List<String> value) { _context = value; _saveKey(); }
  List<String> _context = [];
  /// 展示模版id/默认为0
  /// 
  /// 0：富文本
  int get template => _template;
  set template (int value) { _template = value; _saveKey(); }
  int _template = 0;
  /// 是否已读
  bool get read => _read;
  set read (bool value) { _read = value; _saveKey(); }
  bool _read = false;

  NotificationModel._(): super();
  factory NotificationModel() => create();
  static NotificationModel create() => NotificationModel._();

  @override
  void _saveKey(){
    _valueMap['id'] = id;
    _valueMap['title'] = title;
    _valueMap['time'] = time;
    _valueMap['context'] = context;
    _valueMap['template'] = template;
    _valueMap['read'] = read;
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    id = source['id']??'';
    title = source['title']??'';
    time = source['time']??'';
    context = source['context']??[];
    template = source['template']??'';
    read = source['read']??'';
  }
}