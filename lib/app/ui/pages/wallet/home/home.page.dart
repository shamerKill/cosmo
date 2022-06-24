import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/bottomBar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/pages/wallet/home/home.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class BasicHomePage extends GetView<BasicHomePageController> {
  const BasicHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BasicHomePageState state = controller.state;

    // 备份提示弹窗
    if (state.tipBackupView.isEmpty) {
      state.tipBackupView.add(Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
            child: Text('backupMnemonicTipForSafeTitle'.tr, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall),
            child: Text('backupMnemonicTipForSafeTip_1'.tr, style: Get.textTheme.bodyText1),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall),
            child: Text('backupMnemonicTipForSafeTip_2'.tr, style: Get.textTheme.bodyText1),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding, bottom: appTheme.sizes.padding),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: LButton(
                    child: Text('backupMnemonicTipForCancel'.tr),
                    contrast: true,
                    onPressed: controller.onWaitBackup,
                  ),
                ),
                Padding(padding: EdgeInsets.only(right: appTheme.sizes.padding)),
                Expanded(
                  flex: 1,
                  child: LButton(
                    child: Text('backupMnemonicTipForSure'.tr),
                    onPressed: controller.onGoToBackup,
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
    }

    return Obx(() => LScaffold(
      scaffoldKey: state.scaffoldKey,
      statusBar: LAppBar.defaultStatus(),
      headerBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: controller.onTapMenu,
            icon: const Icon(IconData(0xe62d, fontFamily: 'plugIcon')),
            color: appTheme.colors.textGray,
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.paddingSmall, vertical: appTheme.sizes.paddingSmall / 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.padding)),
                    border: Border.all(color: appTheme.colors.primaryColor),
                    color: state.hideInfo ? appTheme.colors.primaryColor.withOpacity(0.1) : null,
                  ),
                  child: Opacity(
                    opacity: state.hideInfo ? 0 : 1,
                    child: Text(
                      StringTool.accountTypeToString(state.accountInfo.accountType),
                      style: TextStyle(color: appTheme.colors.primaryColor,
                    )),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: controller.goToNewsList,
            icon: Stack(
              children: [
                const Icon(IconData(0xe6e6, fontFamily: 'plugIcon')),
                Positioned(
                  right: appTheme.sizes.basic * 2,
                  top: 2,
                  child: Obx(() => Container(
                    width: appTheme.sizes.basic * 14,
                    height: appTheme.sizes.basic * 14,
                    decoration: BoxDecoration(
                      color: state.hadNewsTip ? appTheme.colors.errorColor : null,
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.basic * 14))
                    ),
                  )),
                ),
              ],
            ),
            color: appTheme.colors.textBlack,
          ),
          IconButton(
            onPressed: controller.goToScan,
            icon: const Icon(IconData(0xe6de, fontFamily: 'plugIcon')),
            color: appTheme.colors.textBlack,
          ),
        ],
      ),
      basicBackgroundColor: true,
      onDrawerChanged: controller.onDrawerChanged,
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall, right: appTheme.sizes.paddingSmall, bottom: appTheme.sizes.padding),
          child: Column(
            children: [
              LAppBar.defaultStatus(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => TextButton(
                    onPressed: (state.drawerSelected != '' && state.accountInfo.address != state.drawerSelected) ? () => controller.onChangeAccount(state.drawerSelected) : null,
                    child: Text(
                      'selectToNowAccount'.tr,
                      style: TextStyle(fontSize: appTheme.sizes.fontSizeSmall, color: (state.drawerSelected != '' && state.accountInfo.address != state.drawerSelected) ? null : appTheme.colors.textGray)
                    ),
                  )),
                  Obx(() => TextButton(
                    onPressed: state.drawerSelected != '' ? () => controller.onAdminAccount(state.drawerSelected) : null,
                    child: Opacity(
                      opacity: state.drawerSelected != '' ? 1 : 0.5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('accountAdmin'.tr, style: TextStyle(fontSize: appTheme.sizes.fontSize)),
                          Padding(
                            padding: EdgeInsets.only(left: appTheme.sizes.fontSize * 0.2),
                            child: Icon(const IconData(0xe6da, fontFamily: 'plugIcon'), size: appTheme.sizes.fontSize),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Obx(() => Column(
                    children: state.accountList.map<Widget>((_item) => Padding(
                      padding: EdgeInsets.only(top: appTheme.sizes.padding),
                      child: InkWell(
                        onTap: () => controller.onDrawerSelect(_item.address),
                        onLongPress: () => controller.onCopyAddress(address: _item.address),
                        child: LAnimationView(
                          randomKey: false,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.paddingSmall, vertical: appTheme.sizes.padding),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  StringTool.stringToColor(_item.address),
                                  StringTool.stringToColor(_item.address).withOpacity(0.6),
                                ]..sort((a, b) => state.drawerSelected == _item.address ? 1 : -1),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                              border: Border.all(color: state.drawerSelected == _item.address ? appTheme.colors.primaryColor : appTheme.colors.transparent, width: appTheme.sizes.basic * 4),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(_item.nickName, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig, color: appTheme.colors.hightColor)),
                                          Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
                                          Text(
                                            '(' + StringTool.accountTypeToString(_item.accountType) + ')',
                                            style: TextStyle(color: appTheme.colors.hightColor, fontSize: appTheme.sizes.fontSizeSmall),
                                          ),
                                        ],
                                      ),
                                      Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.5)),
                                      Text(StringTool.hideAddressCenter(_item.address, startLen: 10), style: TextStyle(fontSize: appTheme.sizes.fontSizeSmall, color: appTheme.colors.hightColor)),
                                    ],
                                  ),
                                ),
                                Icon(
                                  _item.address == state.accountInfo.address ? const IconData(0xe81e, fontFamily: 'plugIcon') : const IconData(0xe815, fontFamily: 'plugIcon'),
                                  color: appTheme.colors.hightColor
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )).toList()
                    ..addIf(() => state.accountList.length < 10, Padding(
                      padding: EdgeInsets.only(top: appTheme.sizes.padding),
                      child: InkWell(
                        onTap: controller.onAddAccount,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.paddingSmall, vertical: appTheme.sizes.padding),
                          decoration: BoxDecoration(
                            color: appTheme.colors.borderColor.withOpacity(0.6),
                            borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('addAccount'.tr),
                              Icon(
                                const IconData(0xe6d6, fontFamily: 'plugIcon'),
                                color: appTheme.colors.textGray
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                  )),
                ),
              ),
              Center(
                child: Text('maxAccountLength'.tr, style: Get.textTheme.bodyText1),
              ),
            ],
          ),
        ),
      ),
      body: LScrollView(
        refreshController: controller.accountRefreshController,
        onRefresh: controller.initAccountStorage,
        child: Column(
          children: [
            // 头部
            Builder(builder: (BuildContext _context) {
              // ignore: prefer_function_declarations_over_variables
              var _getBoxDecoration = (List<Color> colors) => BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: colors,
                ),
              );
              var _contextColor = appTheme.colors.hightColor.withOpacity(0.6);
              return Stack(
                children: [
                  // 余额
                  Container(
                    decoration: _getBoxDecoration(appTheme.colors.homeAssetsBg),
                    child: Column(
                      children: [
                        Container(height: appTheme.sizes.basic * 140.0),
                        Obx(() => Container(
                          height: appTheme.sizes.basic * 210.0 * (state.infoBoxHeightScale / 100.0),
                          padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.paddingSmall),
                          child: SingleChildScrollView(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => Text((state.accountInfo.tokenList.isEmpty ? '' : state.accountInfo.tokenList.first.symbol) + 'balance'.tr)),
                                    Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall / 2)),
                                    Obx(() {
                                      var _balance = state.accountInfo.tokenList.isEmpty ? '' : NumberTool.amountToBalance(state.accountInfo.tokenList.first.amount, scale: state.accountInfo.tokenList.first.scale);
                                      return LAnimationView(randomKey: false, child: Text.rich(
                                        TextSpan(
                                          children: _balance == '' ? null : [
                                            TextSpan(
                                              text: NumberTool.formatNumberStr(NumberTool.getNumberInt(_balance)),
                                              style: TextStyle(
                                                fontSize: appTheme.sizes.fontSizeSmall * 1.8,
                                                letterSpacing: -(appTheme.sizes.basic * 1),
                                              ),
                                            ),
                                            TextSpan(text: NumberTool.getNumberDecimalPoint(_balance)),
                                            TextSpan(text: '\r${state.accountInfo.tokenList.first.symbol}'),
                                          ],
                                        ),
                                        style: TextStyle(
                                          fontSize: appTheme.sizes.fontSizeSmall,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ));
                                    }),
                                    Obx(() => LAnimationView(randomKey: false, child: Text(
                                      state.accountAssetsPrice == '' ? '' : '≈\r\$${NumberTool.formatNumberStr(state.accountAssetsPrice)}',
                                      style: TextStyle(
                                        height: 2.5,
                                        color: appTheme.colors.hightColor,
                                        fontSize: appTheme.sizes.fontSizeSmall,
                                      ),
                                    ))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                        InkWell(
                          onTap: controller.onInfoHide,
                          child: Container(
                            height: appTheme.sizes.basic * 80.0,
                            decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: appTheme.colors.borderColor.withOpacity(0.2))),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(() => LAnimationView(randomKey: false, child: Text(state.hideInfo ? 'quickShow'.tr : 'quickHide'.tr, style: TextStyle(color: appTheme.colors.hightColor)))),
                                Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall * 0.5)),
                                Obx(() => LAnimationView(randomKey: false, child: Transform.rotate(
                                  angle: math.pi/2 * (state.hideInfo ? 1 : -1),
                                  child: Icon(
                                    const IconData(0xe60a, fontFamily: 'plugIcon'),
                                    color: appTheme.colors.hightColor,
                                    size: appTheme.sizes.fontSize,
                                  ),
                                ))),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // 地址
                  Positioned(
                    child: Container(
                      height: appTheme.sizes.basic * 140,
                      padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall),
                      decoration: _getBoxDecoration(appTheme.colors.homeAddressBg),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Obx(() => Text(
                              state.accountInfo.address,
                              style: TextStyle(
                                color: _contextColor,
                              ),
                            )),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: controller.onCopyAddress,
                              icon: Icon(Icons.content_copy_rounded, color: _contextColor),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: controller.onShowScan,
                              icon: Icon(Icons.qr_code_outlined, color: _contextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
            // 代币列表
            Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('tokensList'.tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: appTheme.sizes.fontSizeBig, height: 1.4)),
                IconButton(
                  onPressed: controller.onAddToken,
                  icon: Icon(
                    const IconData(0xe6d6, fontFamily: 'plugIcon'),
                    color: appTheme.colors.textGray
                  ),
                  padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall, top: appTheme.sizes.paddingSmall, bottom: appTheme.sizes.paddingSmall),
                  alignment: Alignment.centerRight,
                ),
              ],
            ),
            Obx(() => Column(
              children: state.accountInfo.tokenList.map((_item) => Padding(
                padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall),
                child: InkWell(
                  onTap: () => controller.onToTokenPage(_item),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.padding),
                    decoration: BoxDecoration(
                      color: appTheme.colors.pageBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                    ),
                    child: Row(
                      children: [
                        LViewImage(
                          url: _item.logo,
                          bgColor: StringTool.stringToColor(_item.type == enumTokenType.prc20 ? _item.contractAddress : _item.minUnit),
                          width: appTheme.sizes.basic * 60,
                          height: appTheme.sizes.basic * 60,
                          isRadius: true,
                        ),
                        Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_item.symbol, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig)),
                              Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.2)),
                              Text(
                                '(' + StringTool.tokenTypeToString(_item.type) + ')', style: TextStyle(fontSize: appTheme.sizes.fontSizeSmall, color: appTheme.colors.primaryColor.withOpacity(0.5))
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Obx(() => LAnimationView(
                              randomKey: false,
                              child: Text(
                                state.hideInfo ? NumberTool.getNumberLenStar(6) : NumberTool.formatNumberStr(NumberTool.amountToBalance(_item.amount, scale: _item.scale)),
                                style: TextStyle(fontSize: appTheme.sizes.fontSize),
                              ),
                            )),
                            Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10)),
                            LAnimationView(
                              randomKey: false,
                              child: Text(
                                state.hideInfo ? NumberTool.getNumberLenStar(6) : '≈\r\$${NumberTool.formatNumberStr(NumberTool.numMul(NumberTool.amountToBalance(_item.amount, scale: _item.scale), _item.price))}',
                                style: Get.textTheme.bodyText1,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
              ).toList(),
            )),
          ],
        ),
      ),
      bottomNavigationBar: const LBottomNavigation(),
    ));
  }
}