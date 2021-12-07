part of './env.dart';

/// 资源配置
abstract class _AssetsConfig {
  /// 节点默认头像前缀
  late String veriferAvatarUrl;
}

/// 链信息
abstract class _ChainInfo {
  /// 链id
  late String appChainId;
  /// 地址前缀
  late String addressPrefix;
}

/// 接口地址
abstract class _UrlInfo {
  /// 后台接口地址
  late String backEndSite;
  /// 链26657
  late String chainToolRpcUrl;
  /// 链1317
  late String chainInfoRpcUrl;
}

