import 'dart:async';
import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.account.dart';
import 'package:plug/app/data/provider/data.config.dart';
import 'package:plug/app/data/provider/data.dapp-address.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/evm/evmClient.dart';
import 'package:plug/app/ui/utils/http.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';
import 'package:plug/app/ui/utils/wallet.dart';
import 'package:web3dart/crypto.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 所有权限列表
List<String> _permissionListAll = [
  'accountAddress', // 账户地址
  'accountAddressType', // 账户地址类型
  'tokenTransferSend', // 发送交易
  'contractCall', // 合约数据获取调用
  'contractSend', // 合约发送调用
];

class DappWebviewPageState {
  // 网址
  final Rx<String> _link = ''.obs;
  String get link => _link.value;
  set link (String value) => _link.value = value;
  // 网页标题
  final Rx<String> _title = ''.obs;
  String get title => _title.value;
  set title (String value) => _title.value = value;
  // 网页描述
  final Rx<String> _description = ''.obs;
  String get description => _description.value;
  set description (String value) => _description.value = value;
  // logo
  final Rx<String> _logo = ''.obs;
  String get logo => _logo.value;
  set logo (String value) => _logo.value = value;
  // webview控制器
  final Rx<WebViewController?> _webviewController = Rx(null);
  WebViewController? get webviewController => _webviewController.value;
  set webviewController (WebViewController? value) => _webviewController.value = value;
  // 加载进度
  final Rx<double> _webProgress = 0.0.obs;
  double get webProgress => _webProgress.value;
  set webProgress (double value) => _webProgress.value = value;
  // webview是否有历史
  final Rx<bool> _webviewHasHistory = false.obs;
  bool get webviewHasHistory => _webviewHasHistory.value;
  set webviewHasHistory (bool value) => _webviewHasHistory.value = value;
  // 当前已授权权限列表
  final RxList<String> permissionListAllow = RxList();
}

class DappWebviewPageController extends GetxController with GetTickerProviderStateMixin {
  DappWebviewPageController();
  DappWebviewPageState state = DappWebviewPageState();
  DataAccountController dataAccount = Get.find<DataAccountController>();
  DataConfigController dataConfig = Get.find();

  late Animation<double> _animation;
  late AnimationController _animationController;
  // 定时器
  List<Timer> timersControllers = [];
  // 获取收藏Dapp/最近的Dapp
  DataDappAddressController dataDappAddress = Get.find();
  // 当前账户
  AccountModel? _accountInfo;

  @override
  onInit() {
    super.onInit();
    try {
      String? link = Get.parameters['link'];
      if (link == null) return Get.back();
      String _link = utf8.decode(base64Url.decode(link));
      state.link = _link;
      _accountInfo = dataAccount.state.nowAccount;
    } catch (e) {
      return Get.back();
    }
    // 动画控制器
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _watchHistory();
  }
  @override
  onClose() {
    for (var timer in timersControllers) {
      timer.cancel();
    }
  }

  // 监听获取当前webview是否有历史
  _watchHistory() {
    Timer.periodic(const Duration(milliseconds: 100), (Timer timeController) async {
      timersControllers.add(timeController);
      if (state.webviewController == null) return;
      bool memCanGoBack = await state.webviewController!.canGoBack();
      state.webviewHasHistory = memCanGoBack;
    });
  }

  // webview报错
  onWebviewError(WebResourceError error) {
    switch (error.description) {
      // 不安全的网址
      case 'net::ERR_CLEARTEXT_NOT_PERMITTED':
        LToast.warning('ErrorWithWebUnsafe'.tr);
        break;
    }
    if (state.webviewHasHistory) {
      state.webviewController?.goBack();
    } else {
      Get.back();
    }
  }
  // webview开始加载
  onWebviewStarted(String link) {
  }
  // webview创建成功
  onWebviewCreated(WebViewController webviewController) {
    state.webviewController = webviewController;
  }
  // webview加载成功
  onWebviewFinished(String link) async {
    if (state.webviewController == null) return;
    state.link = link;
    state.title = await state.webviewController?.getTitle()??'';
    String? _description = await state.webviewController?.runJavascriptReturningResult('var __descList = document.getElementsByName(\'description\'); if (__descList.length !== 0) { __descList[0].content; }');
    if (_description != null) state.description = _description;
    String? _logo = await state.webviewController?.runJavascriptReturningResult('(function(){var list=document.getElementsByTagName("link");for(var i=0;i<list.length;i++){var item=list[i];if(/icon/.test(item.getAttribute("rel")))return item.href}})()');
    if (_logo != null) state.logo = _logo.replaceAll('"', '').replaceAll("'", '');
    _finishDappLatelyList();
  }
  // webview加载进度
  onWebviewProgress(int progress) {
    double _value = progress / 100.0;
    if (_value < state.webProgress) state.webProgress = _value;
    _animationController.repeat();
    _animation = Tween(begin: state.webProgress, end: _value).animate(_animationController)
      ..addListener(() {
        state.webProgress = _animation.value;
      });
    _animationController.forward();
  }
  // webview路由拦截
  FutureOr<NavigationDecision> onNavigationDelegate(NavigationRequest request) async {
    if (StringTool.isHttpsUrl(request.url)) return NavigationDecision.navigate;
    if (StringTool.isHttpUrl(request.url)) LToast.warning('ErrorWithWebUnsafe'.tr);
    return NavigationDecision.prevent;
  }
  // 关闭页面
  onCloseWebview() {
    Get.back();
  }
  // 是否允许返回
  Future<bool> onWillPop() async {
    if (state.webviewHasHistory) {
      state.webviewController?.goBack();
      return false;
    }
    return true;
  }
  // 更多工具
  onShowMoreTool() async {
    await LBottomSheet.baseBottomSheet(
      child: WebViewMoreTool(
        onShare: _onShare,
        onCopyLink: _onCopyLink,
        onRefresh: _onRefresh,
        onCollection: _onCollection,
      ),
    );
  }
  // 分享
  _onShare() {
    if (state.webProgress != 1.0) return LToast.info('noLoaded'.tr);
    LToast.error('canNotShare'.tr);
    Get.back();
  }
  // 复制链接
  _onCopyLink() async {
    String? link = await state.webviewController?.currentUrl();
    if (link == null) return;
    FlutterClipboard.copy(link);
    LToast.success('SuccessWithCopy'.tr);
    Get.back();
  }
  // 刷新
  _onRefresh() {
    state.webviewController?.reload();
    Get.back();
  }
  // 收藏
  _onCollection() async {
    if (state.webProgress != 1.0) return LToast.info('noLoaded'.tr);
    var index = dataDappAddress.state.dappCollectList.indexWhere((item) => item.address == state.link);
    if (index >= 0) LToast.warning('collected'.tr);
    var ele = DappModel();
    ele.logo = state.logo;
    ele.title = state.title;
    ele.description = state.description;
    ele.address = state.link;
    dataDappAddress.state.dappCollectList.add(ele);
    dataDappAddress.saveData();
    LToast.success('SuccessWithCollected'.tr);
    Get.back();
  }
  // 完善处理当前地址历史并添加记录
  _finishDappLatelyList() {
    var index = dataDappAddress.state.dappLatelyList.indexWhere((item) => item.address == state.link);
    if (index < 0) return;
    var ele = dataDappAddress.state.dappLatelyList[index];
    ele.logo = state.logo == '' ? ele.logo : state.logo;
    ele.title = state.logo == '' ? ele.logo : state.title;
    ele.description = state.logo == '' ? ele.logo : state.description;
    ele.address = state.logo == '' ? ele.logo : state.link;
    dataDappAddress.state.dappLatelyList.replaceRange(index, index + 1, [ele]);
    dataDappAddress.saveData();
  }

  // 传入回调参数命名处理 // cosmo$name
  String _formatJsName (String name) => '_cosmo${name[0].toUpperCase()}${name.substring(1)}';
  // webview回掉错误方法
  _webviewGetError(dynamic e) {
    String _error = e is Object ? json.encode(e) : e.toString();
    state.webviewController?.runJavascript('if (typeof window.${_formatJsName('errorCall')} == \'function\') { window.${_formatJsName('errorCall')}(`COSMO ERROR: $_error`); }'); // _cosmoErrorCall
  }
  // 从本地获取当前地址权限
  Future<List<String>> _getPermissionFromLocal() async {
    var url = await state.webviewController?.currentUrl();
    if (url == null) return [];
    var origin = Uri.parse(url).origin;
    if (_accountInfo != null) {
      for (DappModel item in _accountInfo!.dappPermissionList) {
        if (item.address == origin) {
          return item.permissions;
        }
      }
    }
    return [];
  }
  // 验证用户是否赋予权限
  Future<bool> _verifyPermission (WebViewCallData webviewCallData) async {
    // 获取本地权限
    if (state.permissionListAllow.isEmpty) {
      var _list = await _getPermissionFromLocal();
      state.permissionListAllow
          ..clear()
          ..addAll(_list)
          ..refresh();
    }
    // 权限判断
    if (
      webviewCallData.type != 'applyPermission' &&
      webviewCallData.type != 'getPermission' &&
      !state.permissionListAllow.contains(webviewCallData.type)) {
      _webviewGetError('not has permission');
      return false;
    }
    return true;
  }
  // 调用权限弹窗
  _permissionDialog(List<String> _permissionListApply, String _windowAttrName) async {
    bool? type = await LBottomSheet.promptBottomSheet(
      title: 'authorizationPrompt'.tr,
      message: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('authorizationDescription'.tr, style: TextStyle(color: appTheme.colors.textGray, fontSize: appTheme.sizes.fontSizeSmall)),
            ),
            Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
            if (_permissionListApply.contains(_permissionListAll[0])) Text('- ${'authorizationDescriptionAddress'.tr}', style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeSmall)),
            if (_permissionListApply.contains(_permissionListAll[1])) Text('- ${'authorizationDescriptionAddress'.tr}', style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeSmall)),
            if (_permissionListApply.contains(_permissionListAll[2])) Text('- ${'authorizationDescriptionTransfer'.tr}', style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeSmall)),
            if (_permissionListApply.contains(_permissionListAll[3])) Text('- ${'authorizationDescriptionContractCall'.tr}', style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeSmall)),
            if (_permissionListApply.contains(_permissionListAll[4])) Text('- ${'authorizationDescriptionContractSend'.tr}', style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeSmall)),
            Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
            Text('authorizationAuthorizeTip'.tr, style: TextStyle(color: appTheme.colors.textGray, fontSize: appTheme.sizes.fontSizeSmall)),
          ],
        ),
      ),
    );
    // 缓存已授予权限
    List<String> _permissionListAllow = await _getPermissionFromLocal();
    // 判断如果用户允许了权限
    if (type == true) {
      // 获取权限列表
      for (var item in _permissionListApply) {
        if (!_permissionListAllow.contains(item) && _permissionListAll.contains(item)) {
          _permissionListAllow.add(item);
        }
      }
      state.permissionListAllow.addAll(_permissionListAllow);
      // 没有开启安全模式，储存本地账户
      if (!dataConfig.state.config.safeDappView) {
        _accountInfo?.dappPermissionList.add(
          DappModel()
            ..address = Uri.parse(await state.webviewController?.currentUrl()??'').origin
            ..permissions = _permissionListAllow
        );
        dataAccount.updateAccount(_accountInfo);
      }
      state.webviewController?.runJavascript('window.$_windowAttrName = ${json.encode(state.permissionListAllow)};');
    } else {
      _webviewGetError('reject');
    }
  }


  // webview添加方法综合入口
  JavascriptChannel webviewFunction () => JavascriptChannel(
    name: _formatJsName('walletFunction'), // _cosmoWalletFunction
    onMessageReceived: (JavascriptMessage message) {
      // 格式化函数
      try {
        WebViewCallData webviewCallData = WebViewCallData.decodeFromRaw(message.message);
        _switchWebviewFunction(webviewCallData);
      } catch (e) {
        _webviewGetError(e);
      }
    }
  );
  // 分流方法
  _switchWebviewFunction(WebViewCallData webviewCallData) async {
    // 判断权限
    if (!(await _verifyPermission(webviewCallData))) return;
    switch (webviewCallData.type) {
      // 无需权限判断操作
      case 'getPermission': _callGetPermission(webviewCallData.windowAttrName); break;
      case 'applyPermission': _callApplyPermission(webviewCallData.windowAttrName, webviewCallData.data); break;
      // 需要权限判断
      case 'accountAddress': _callGetUserAccountAddress(webviewCallData.windowAttrName); break; // 获取用户地址
      case 'accountAddressType': _callGetUserAccountAddressType(webviewCallData.windowAttrName); break; // 获取用户地址类型
      case 'tokenTransferSend': _callWalletSend(webviewCallData.windowAttrName, webviewCallData.data); break; // 转账
      case 'tokenSwap': _callWalletSwap(webviewCallData.windowAttrName, webviewCallData.data); break; // 交换
      case 'contractCall': _callContractCall(webviewCallData.windowAttrName, webviewCallData.data); break; // 调用合约
      case 'contractSend': _callContractSend(webviewCallData.windowAttrName, webviewCallData.data); break; // 发送合约
    }
  }
  // 读取已授予权限
  _callGetPermission(String _windowAttrName) async {
    if (_windowAttrName == '') _webviewGetError('input type error, windowAttrName can\'t use empty');
    var _list = await _getPermissionFromLocal();
    state.webviewController?.runJavascript('window.$_windowAttrName = ${json.encode(_list)};');
  }
  // 申请权限
  _callApplyPermission(String _windowAttrName, dynamic _permissionList) async {
    if (_permissionList is! List) _webviewGetError('input type error, need data as list with string');
    if (_windowAttrName == '') _webviewGetError('input type error, windowAttrName can\'t use empty');
    List<String> _permissionListApply = [];
    for (dynamic item in _permissionList) {
      item = item.toString();
      if (_permissionListAll.contains(item)) _permissionListApply.add(item);
    }
    if (_permissionListApply.isEmpty) _permissionDialog(_permissionListApply, _windowAttrName);
  }
  // 获取账户地址
  _callGetUserAccountAddress(String _windowAttrName) {
    state.webviewController?.runJavascript('window.$_windowAttrName = "${_accountInfo?.address}";');
  }
  // 获取账户地址类型
  _callGetUserAccountAddressType(String _windowAttrName) {
    state.webviewController?.runJavascript('window.$_windowAttrName = "${StringTool.accountTypeToString(_accountInfo?.accountType)}";');
  }
  // 发起交易
  _callWalletSend(String _windowAttrName, dynamic sendData) async {
    // 判断传入信息
    if (
      sendData['toAddress'] is! String ||
      !StringTool.checkAddress(sendData['toAddress']) || // 判断地址是否合法
      sendData['volume'] is! String ||
      double.tryParse(sendData['volume']) == null || // 判断数量是否合法
      sendData['gasAll'] is! String ||
      double.tryParse(sendData['gasAll']) == null || // 判断gas是否合法
      sendData['scale'] is! int || // 判断精度是否合法
      sendData['denom'] is! String || // 判断币种是否合法
      (sendData['memo'] != null && sendData['memo'] is! String) || // 判断备注是否合法
      sendData['gasLimit'] is! int // 判断gas限制是否合法
    ) {
      _webviewGetError('input type error, please check');
      state.webviewController?.runJavascript('window.$_windowAttrName = null;');
    } else {
      try {
        String? password = await LBottomSheet.passwordBottomSheet();
        if (password == null) {
          _webviewGetError('input password is empty');
          return state.webviewController?.runJavascript('window.$_windowAttrName = null;');
        }
        List<String>? mnemonicList = await WalletTool.decryptMnemonic(
          _accountInfo?.stringifyRaw??'',
          password,
        );
        if (mnemonicList == null) {
          _webviewGetError('input password error');
          return state.webviewController?.runJavascript('window.$_windowAttrName = null;');
        }
        HttpToolResponse transferResult = await WalletTool.transfer(
          mnemonic: mnemonicList,
          toAddress: sendData['toAddress'],
          volume: NumberTool.balanceToAmount(sendData['volume'], scale: sendData['scale']),
          gasAll: sendData['gasAll'],
          denom: sendData['denom'],
          memo: sendData['memo'],
          gasLimit: sendData['gasLimit'],
          noWait: true,
        );
        state.webviewController?.runJavascript('window.$_windowAttrName = {status: ${transferResult.status}, data: ${json.encode(transferResult.data)}};');
      } catch (e) {
        _webviewGetError(e);
        state.webviewController?.runJavascript('window.$_windowAttrName = null;');
      }
    }
  }
  // swap交易
  _callWalletSwap(String _windowAttrName, dynamic sendData) async {
    // 判断传入信息
    if (
      sendData['poolId'] is! int || // poolId
      sendData['fromSymbol'] is! String || // from token Symbol
      sendData['fromAmount'] is! String ||
      double.tryParse(sendData['fromAmount']) == null || // from token volume
      sendData['toSymbol'] is! String || // to token Symbol
      sendData['feeAmount'] is! String ||
      double.tryParse(sendData['feeAmount']) == null || // gasAll
      sendData['orderPrice'] is! double || // swap price
      sendData['gasAll'] is! String ||
      double.tryParse(sendData['gasAll']) == null // gas all
    ) {
      _webviewGetError('input type error, please check');
      state.webviewController?.runJavascript('window.$_windowAttrName = null;');
    } else {
      try {
        String? password = await LBottomSheet.passwordBottomSheet();
        if (password == null) {
          _webviewGetError('input password is empty');
          return state.webviewController?.runJavascript('window.$_windowAttrName = null;');
        }
        List<String>? mnemonicList = await WalletTool.decryptMnemonic(
          _accountInfo?.stringifyRaw??'',
          password,
        );
        if (mnemonicList == null) {
          _webviewGetError('input password error');
          return state.webviewController?.runJavascript('window.$_windowAttrName = null;');
        }
        HttpToolResponse transferResult = await WalletTool.dexPoolExchange(
          mnemonic: mnemonicList,
          poolId: sendData['poolId'],
          fromSymbol: sendData['fromSymbol'],
          fromAmount: sendData['fromAmount'],
          toSymbol: sendData['toSymbol'],
          feeAmount: sendData['feeAmount'],
          orderPrice: sendData['orderPrice'],
          gasAll: sendData['gasAll'],
        );
        state.webviewController?.runJavascript('window.$_windowAttrName = {status: ${transferResult.status}, data: ${json.encode(transferResult.data)}};');
      } catch (e) {
        _webviewGetError(e);
        state.webviewController?.runJavascript('window.$_windowAttrName = null;');
      }
    }
  }
  // 合约call调用
  _callContractCall(String _windowAttrName, dynamic sendData) async {
    // 判断账户类型
    if (_accountInfo?.accountType != enumAccountType.prc20) {
      _webviewGetError('account type error');
      state.webviewController?.runJavascript('window.$_windowAttrName = null;');
    } else if ( // 判断传入信息
      sendData['contractAddress'] is! String ||
      !StringTool.checkAddress(sendData['contractAddress']) || // 合约地址
      (
        ((
          sendData['callFunc'] is! String || // 合约方法
          (sendData['callArgs'] != null && sendData['callArgs'] is! List) // 合约参数
        ) && (
          sendData['rawData'] is! String || // 没有传递原始数据
          !(sendData['rawData'].startsWith('0x')) // 不是0x开头
        ))
      )
    ) {
      _webviewGetError('input type error, please check');
      state.webviewController?.runJavascript('window.$_windowAttrName = null;');
    } else {
      try {
        String? callResult = sendData['rawData'] is String ?
          (await EvmClient.callContractRaw(sendData['contractAddress'], hexToBytes(sendData['rawData']))) :
          (await EvmClient.callContract(
            sendData['contractAddress'],
            sendData['callFunc'],
            (sendData['callArgs'] as List).map((e) => e.toString()).toList(),
          ));
        state.webviewController?.runJavascript('window.$_windowAttrName = {status: 0, data: $callResult};');
      } catch (e) {
        _webviewGetError({'msg': e.toString()});
        state.webviewController?.runJavascript('window.$_windowAttrName = null;');
      }
    }
  }
  // 合约send调用
  _callContractSend(String _windowAttrName, dynamic sendData) async {
    // 判断账户类型
    if (_accountInfo?.accountType != enumAccountType.prc20) {
      _webviewGetError('account type error');
      state.webviewController?.runJavascript('window.$_windowAttrName = null;');
    } else if ( // 判断传入信息
      sendData['contractAddress'] is! String ||
      !StringTool.checkAddress(sendData['contractAddress']) || // 合约地址
      (
        ((
          sendData['callFunc'] is! String || // 合约方法
          (sendData['callArgs'] != null && sendData['callArgs'] is! List) // 合约参数
        ) && (
          sendData['rawData'] is! String || // 没有传递原始数据
          !(sendData['rawData'].startsWith('0x')) // 不是0x开头
        ))
      )
    ) {
      _webviewGetError('input type error, please check');
      state.webviewController?.runJavascript('window.$_windowAttrName = null;');
    } else {
      try {
        String? password = await LBottomSheet.passwordBottomSheet();
        if (password == null) {
          _webviewGetError('input password is empty');
          return state.webviewController?.runJavascript('window.$_windowAttrName = null;');
        }
        List<String>? mnemonicList = await WalletTool.decryptMnemonic(
          _accountInfo?.stringifyRaw??'',
          password,
        );
        if (mnemonicList == null) {
          _webviewGetError('input password error');
          return state.webviewController?.runJavascript('window.$_windowAttrName = null;');
        }
        HttpToolResponse sendResult = await EvmClient(mnemonic: mnemonicList).sendAsync(
          sendData['contractAddress'],
          sendData['rawData'] is String ? hexToBytes(sendData['rawData']) : EvmClient.toolFormatContractData(
            sendData['callFunc'],
            (sendData['callArgs'] as List).map((e) => e.toString()).toList(),
          ),
        );
        state.webviewController?.runJavascript('window.$_windowAttrName = {status: ${sendResult.status}, data: ${json.encode(sendResult.data)}};');
      } catch (e) {
        _webviewGetError({'msg': e.toString()});
        state.webviewController?.runJavascript('window.$_windowAttrName = null;');
      }
    }
  }
}

// 更多工具弹窗
class WebViewMoreTool extends StatelessWidget {
  const WebViewMoreTool(
    {
      required this.onShare,
      required this.onCopyLink,
      required this.onRefresh,
      required this.onCollection,
      Key? key
    }
  ) : super(key: key);
  final void Function() onShare;
  final void Function() onCopyLink;
  final void Function() onRefresh;
  final void Function() onCollection;
  @override
  Widget build(context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                onTap: onShare,
                child: Column(
                  children: [
                    Container(
                      width: appTheme.sizes.basic * 110.0,
                      height: appTheme.sizes.basic * 110.0,
                      decoration: BoxDecoration(
                        color: appTheme.colors.pageBackgroundColorBasic,
                        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                      ),
                      child: Icon(
                        Icons.share_outlined,
                        size: appTheme.sizes.iconSize,
                        color: appTheme.colors.textGrayBig,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
                      child: Text('share'.tr),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(right: appTheme.sizes.padding)),
              InkWell(
                onTap: onCopyLink,
                child: Column(
                  children: [
                    Container(
                      width: appTheme.sizes.basic * 110.0,
                      height: appTheme.sizes.basic * 110.0,
                      decoration: BoxDecoration(
                        color: appTheme.colors.pageBackgroundColorBasic,
                        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                      ),
                      child: Icon(
                        Icons.copy_outlined,
                        size: appTheme.sizes.iconSize,
                        color: appTheme.colors.textGrayBig,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
                      child: Text('copyLink'.tr),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(right: appTheme.sizes.padding)),
              InkWell(
                onTap: onRefresh,
                child: Column(
                  children: [
                    Container(
                      width: appTheme.sizes.basic * 110.0,
                      height: appTheme.sizes.basic * 110.0,
                      decoration: BoxDecoration(
                        color: appTheme.colors.pageBackgroundColorBasic,
                        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                      ),
                      child: Icon(
                        Icons.refresh_outlined,
                        size: appTheme.sizes.iconSize,
                        color: appTheme.colors.textGrayBig,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
                      child: Text('refresh'.tr),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(right: appTheme.sizes.padding)),
              InkWell(
                onTap: onCollection,
                child: Column(
                  children: [
                    Container(
                      width: appTheme.sizes.basic * 110.0,
                      height: appTheme.sizes.basic * 110.0,
                      decoration: BoxDecoration(
                        color: appTheme.colors.pageBackgroundColorBasic,
                        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                      ),
                      child: Icon(
                        Icons.star_border_outlined,
                        size: appTheme.sizes.iconSize,
                        color: appTheme.colors.textGrayBig,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall),
                      child: Text('collection'.tr),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(right: appTheme.sizes.padding)),
            ],
          ),
        ),
      );
  }
}


// webview 调用方法参数类型
class WebViewCallData {
  WebViewCallData({
    required this.type,
    required this.data,
    required this.windowAttrName,
  });
  final String type; // 类型
  final String windowAttrName; // window字段
  final dynamic data; // 传入数据
  static decodeFromRaw<T>(String rawJson) {
    try {
      var value = json.decode(rawJson);
      if (value['type'] is String && value['windowAttrName'] != null) {
        return WebViewCallData(
          type: value['type'],
          data: value['data'],
          windowAttrName: value['windowAttrName'],
        );
      } else {
        return throw 'input type error, need type as string and data as any and windowAttrName as string';
      }
    } catch (e) {
      rethrow;
    }
  }
}