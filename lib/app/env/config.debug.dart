part of './env.dart';

class _AssetsConfigDebug implements _AssetsConfig {
  @override
  String verifierAvatarUrl = 'https://api.plugchain.network/static';
}

class _ChainInfoDebug implements _ChainInfo {
  @override
  String appChainId = 'plugchain-test';
  @override
  String addressPrefix = 'gx';
}

class _UrlInfoDebug implements _UrlInfo {
  @override
  String backEndSite = 'https://api.plugchain.network/static';
  @override
  String chainToolRpcUrl = 'https://api.plugchain.network/static';
  @override
  String chainInfoRpcUrl = 'https://api.plugchain.network/static';
}