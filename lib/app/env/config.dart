part of './env.dart';

const firstApiDomain = '47.108.78.19';
const firstRpcApi = '$firstApiDomain:3333';
const firstBrowserApi = '$firstApiDomain:9998';
const firstWebApi = '$firstApiDomain:9999';

/// 资源配置
abstract class _AssetsConfig {
  /// 节点默认头像前缀
  late String verifierAvatarUrl;

  /// 账户昵称默认前缀
  late String accountDefaultPre;
}

/// 链信息
abstract class _ChainInfo {
  /// 链id
  late String appChainId;

  /// 地址前缀
  late String addressPrefix;

  /// pvm链id
  late int pvmChainId;
}

/// 接口地址
abstract class _UrlInfo {
  /// 后台接口地址
  late String backEndSite;

  /// 浏览器后台接口地址
  late String browserEndSite;

  /// 链26657
  late String chainToolRpcUrl;

  /// 链1317
  late String chainInfoRpcUrl;
  // 9090接口地址
  late String chainMoreRpcUrl;
  // 8545
  late String chainPvmRpcUrl;
}
