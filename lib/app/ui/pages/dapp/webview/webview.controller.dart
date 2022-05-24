import 'dart:async';
import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/data/provider/data.dapp-address.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/string.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
}

class DappWebviewPageController extends GetxController with GetTickerProviderStateMixin {
  DappWebviewPageController();
  DappWebviewPageState state = DappWebviewPageState();
  late Animation<double> _animation;
  late AnimationController _animationController;
  // 定时器
  List<Timer> timersControllers = [];
  // 获取收藏Dapp/最近的Dapp
  DataDappAddressController dataDappAddress = Get.find();

  @override
  onInit() {
    super.onInit();
    try {
      String? link = Get.parameters['link'];
      if (link == null) return Get.back();
      String _link = utf8.decode(base64Url.decode(link));
      state.link = _link;
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
        LToast.warning('当前网址不安全，无法访问');
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
    if (StringTool.isHttpUrl(request.url)) LToast.warning('当前网址不安全，无法访问');
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
    if (state.webProgress != 1.0) return LToast.info('未加载完成');
    LToast.error('暂不支持分享');
    Get.back();
  }
  // 复制链接
  _onCopyLink() async {
    String? link = await state.webviewController?.currentUrl();
    if (link == null) return;
    FlutterClipboard.copy(link);
    LToast.success('复制成功');
    Get.back();
  }
  // 刷新
  _onRefresh() {
    state.webviewController?.reload();
    Get.back();
  }
  // 收藏
  _onCollection() async {
    if (state.webProgress != 1.0) return LToast.info('未加载完成');
    var index = dataDappAddress.state.dappCollectList.indexWhere((item) => item.address == state.link);
    if (index >= 0) LToast.warning('已添加收藏');
    var ele = DappModel();
    ele.logo = state.logo;
    ele.title = state.title;
    ele.description = state.description;
    ele.address = state.link;
    dataDappAddress.state.dappCollectList.add(ele);
    dataDappAddress.saveData();
    LToast.success('收藏成功');
    Get.back();
  }
  // 完善处理当前地址历史
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
}

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
                      child: Text('分享'.tr),
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
                      child: Text('复制链接'.tr),
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
                      child: Text('刷新'.tr),
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
                      child: Text('收藏'.tr),
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