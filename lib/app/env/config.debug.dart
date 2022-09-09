part of './env.dart';

class _AssetsConfigDebug implements _AssetsConfig {
  @override
  String verifierAvatarUrl = 'http://$firstRpcApi/static';
  @override
  String accountDefaultPre = 'pando';
}

class _ChainInfoDebug implements _ChainInfo {
  @override
  String appChainId = 'plugchain_520-1';
  @override
  String addressPrefix = 'gx';
  @override
  int pvmChainId = 520;
}

class _UrlInfoDebug implements _UrlInfo {
  @override
  String backEndSite = 'http://$firstWebApi';
  @override
  String browserEndSite = 'http://$firstBrowserApi';
  @override
  String chainToolRpcUrl = 'http://$firstRpcApi/rawrpc';
  @override
  String chainInfoRpcUrl = 'http://$firstRpcApi/rawapi';
  @override
  String chainMoreRpcUrl = 'http://$firstWebApi/web_rpc';
  @override
  String chainPvmRpcUrl = 'http://$firstWebApi/ethraw/';
}
