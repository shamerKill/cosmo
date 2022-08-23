part of './env.dart';

class _AssetsConfigDebug implements _AssetsConfig {
  @override
  String verifierAvatarUrl = 'http://$firstRpcApi/static';
  @override
  String accountDefaultPre = 'cosmo';
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
  String browserEndSite = 'https://www.plugchain.network';
  @override
  String chainToolRpcUrl = 'http://$firstRpcApi/rawrpc';
  @override
  String chainInfoRpcUrl = 'http://$firstRpcApi/rawapi';
  @override
  String chainMoreRpcUrl = 'http://$firstRpcApi/web_rpc';
  @override
  String chainPvmRpcUrl = 'http://$firstRpcApi/ethraw/';
}