part of './interface.dart';

/// app设置
class ConfigAppData extends _StorageBaseAbstract {
  /// 是否开启了dapp安全设置
  bool get safeDappView => _safeDappView;
  set safeDappView(bool value) {
    _safeDappView = value;
    _saveKey();
  }

  bool _safeDappView = false;
  // 是否开启了生物识别
  bool get useBiometrics => _useBiometrics;
  set useBiometrics(bool value) {
    _useBiometrics = value;
    _saveKey();
  }

  bool _useBiometrics = false;
  // 语言版本
  Locale? get languageType => _languageType;
  set languageType(Locale? value) {
    _languageType = value;
    _saveKey();
  }

  Locale? _languageType;

  // 首页是显示或隐藏
  bool get homeValueHide => _homeValueHide;
  set homeValueHide(bool value) {
    _homeValueHide = value;
    _saveKey();
  }

  bool _homeValueHide = false;

  ConfigAppData._() : super();
  factory ConfigAppData() => create();
  static ConfigAppData create() => ConfigAppData._();

  @override
  void _saveKey() {
    _valueMap['safeDappView'] = safeDappView;
    _valueMap['useBiometrics'] = useBiometrics;
    _valueMap['languageType'] = languageType?.toLanguageTag();
    _valueMap['homeValueHide'] = homeValueHide;
  }

  @override
  void setData(String sourceStr) {
    Map<String, dynamic> source = json.decode(sourceStr);
    safeDappView = source['safeDappView'] ?? false;
    useBiometrics = source['useBiometrics'] ?? false;
    languageType = source['languageType'] != null
        ? Locale.fromSubtags(languageCode: source['languageType'])
        : null;
    homeValueHide = source['homeValueHide'] ?? false;
  }
}
