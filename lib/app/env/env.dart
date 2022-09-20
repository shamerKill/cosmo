library env_config;

part './config.dart';
part './config.debug.dart';
part './config.test.dart';
part 'config.release.dart';

enum EnvType { debug, test, release }

class EnvConfig {
  final EnvType type;
  bool get isRelease => type == EnvType.release;
  bool get isDebug => type == EnvType.debug;
  bool get isTest => type == EnvType.test;
  final _AssetsConfig assets;
  final _ChainInfo chainInfo;
  final _UrlInfo urlInfo;
  EnvConfig({
    required this.type,
    required this.assets,
    required this.chainInfo,
    required this.urlInfo,
  });
}

// 声明的环境
abstract class _EnvName {
  // 环境key
  static const String envKey = "DART_DEFINE_APP_ENV";
  // 环境value
  static const String debug = "debug";
  static const String release = "release";
  static const String test = "test";
}
// 声明的渠道
abstract class EnvChannel {
  // 渠道key
  static const String envKey = "BUILD_CHANNEL";
  // 浏览器 android
  static const String android = "android-browser";
  // ios
  static const String iosTest = "ios-browser";
  // google
  static const String google = "android-google";
}

// 获取的配置信息
class Env {
  // 获取到当前环境
  static const _appEnv = String.fromEnvironment(_EnvName.envKey);
  // 获取到渠道版本
  static const _channel = String.fromEnvironment(EnvChannel.envKey);

  static final EnvConfig _debugConfig = EnvConfig(
    type: EnvType.debug,
    assets: _AssetsConfigDebug(),
    chainInfo: _ChainInfoDebug(),
    urlInfo: _UrlInfoDebug(),
  );
  static final EnvConfig _releaseConfig = EnvConfig(
    type: EnvType.release,
    assets: _AssetsConfigRelease(),
    chainInfo: _ChainInfoRelease(),
    urlInfo: _UrlInfoRelease(),
  );
  static final EnvConfig _testConfig = EnvConfig(
    type: EnvType.test,
    assets: _AssetsConfigTest(),
    chainInfo: _ChainInfoTest(),
    urlInfo: _UrlInfoTest(),
  );

  static EnvConfig get envConfig => _getEnvConfig();

  // 根据不同环境返回对应的环境配置
  static EnvConfig _getEnvConfig() {
    switch (_appEnv) {
      case _EnvName.debug:
        return _debugConfig;
      case _EnvName.release:
        return _releaseConfig;
      case _EnvName.test:
        return _testConfig;
      default:
        return _debugConfig;
    }
  }
  // 获取不同的渠道
  static String? get envChannel {
    if (_channel == EnvChannel.android) return EnvChannel.android;
    if (_channel == EnvChannel.google) return EnvChannel.google;
    if (_channel == EnvChannel.iosTest) return EnvChannel.iosTest;
    return null;
  }
  // 判断渠道是不是android
  static bool get getEnvIsAndroid {
    if (getEnvIsAndroidBrowser || getEnvIsGooglePlay) return true;
    return false;
  }
  // 判断渠道是不是从安卓浏览器下载
  static bool get getEnvIsAndroidBrowser {
    if (_channel == EnvChannel.android) return true;
    return false;
  }
  // 判读渠道是不是ios浏览器下载
  static bool get getEnvIsIosBrowser {
    if (_channel == EnvChannel.iosTest) return true;
    return false;
  }
  // 判断渠道是不是从谷歌商店下载
  static bool get getEnvIsGooglePlay {
    if (_channel == EnvChannel.google) return true;
    return false;
  }
}
