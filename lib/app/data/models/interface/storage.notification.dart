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
  DateTime? get time => _time;
  set time (DateTime? value) { _time = value; _saveKey(); }
  DateTime? _time;
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
  bool get readed => _readed;
  set readed (bool value) { _readed = value; _saveKey(); }
  bool _readed = false;

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
  }
  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    id = source['id']??'';
    title = source['title']??'';
    time = source['time'] != null ? DateTime.tryParse(source['time']) : null;
    context = source['context']??[];
    template = source['template']??'';
  }
}