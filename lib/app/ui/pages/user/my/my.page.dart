import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/bottomBar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/user/my/my.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class UserMyPage extends GetView<UserMyPageController> {
  const UserMyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserMyPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(backgroundColor: appTheme.colors.pageBackgroundColorBasic),
      headerBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.paddingSmall, vertical: appTheme.sizes.paddingSmall),
        child: Builder(builder: (_) {
          double _height = (context.mediaQuerySize.width - appTheme.sizes.paddingSmall * 4) / 3;
          return Row(
            children: [
              Expanded(
                child: Container(
                  height: _height,
                  decoration: BoxDecoration(
                    color: appTheme.colors.pageBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/my_account.svg',
                        width: appTheme.sizes.iconSize * 1.2,
                        height: appTheme.sizes.iconSize * 1.2,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                      Text('账户管理'.tr),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
              Expanded(
                child: InkWell(
                  onTap: controller.onGoToAddressBookList,
                  child: Container(
                    height: _height,
                    decoration: BoxDecoration(
                      color: appTheme.colors.pageBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/my_address.svg',
                          width: appTheme.sizes.iconSize * 1.2,
                          height: appTheme.sizes.iconSize * 1.2,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                        Text('地址簿'.tr),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
              Expanded(
                child: Container(
                  height: _height,
                  decoration: BoxDecoration(
                    color: appTheme.colors.pageBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/my_news.svg',
                        width: appTheme.sizes.iconSize * 1.2,
                        height: appTheme.sizes.iconSize * 1.2,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                      Text('消息中心'.tr),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
      basicBackgroundColor: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('基本设置', style: Get.textTheme.bodyText1),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          Container(
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: appTheme.sizes.padding,
                    bottom: appTheme.sizes.padding,
                    left: appTheme.sizes.padding,
                    right: appTheme.sizes.padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('DAPP设置'.tr),
                      Icon(const IconData(0xe658, fontFamily: 'plugIcon'), color: appTheme.colors.textGray, size: appTheme.sizes.iconSize  * 0.6),
                    ],
                  ),
                ),
                Container(
                  height: appTheme.sizes.basic,
                  width: appTheme.sizes.infinity,
                  color: appTheme.colors.borderColor.withOpacity(0.4),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: appTheme.sizes.paddingSmall * 0.6,
                    bottom: appTheme.sizes.paddingSmall * 0.6,
                    left: appTheme.sizes.padding,
                    right: appTheme.sizes.paddingSmall,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('指纹设置'.tr),
                      Obx(() => Switch(
                        value: state.enableTouch,
                        onChanged: controller.onToggleTouch,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      )),
                    ],
                  ),
                ),
                Container(
                  height: appTheme.sizes.basic,
                  width: appTheme.sizes.infinity,
                  color: appTheme.colors.borderColor.withOpacity(0.6),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: appTheme.sizes.padding,
                    bottom: appTheme.sizes.padding,
                    left: appTheme.sizes.padding,
                    right: appTheme.sizes.padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('网络切换'.tr),
                      Row(
                        children: [
                          Obx(() => Text(state.network, style: TextStyle(color: appTheme.colors.primaryColor))),
                          Icon(const IconData(0xe658, fontFamily: 'plugIcon'), color: appTheme.colors.textGray, size: appTheme.sizes.iconSize  * 0.6),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: appTheme.sizes.basic,
                  width: appTheme.sizes.infinity,
                  color: appTheme.colors.borderColor.withOpacity(0.8),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('语言切换'.tr),
                      Row(
                        children: [
                          Obx(() => Text(state.language, style: TextStyle(color: appTheme.colors.primaryColor))),
                          Icon(const IconData(0xe658, fontFamily: 'plugIcon'), color: appTheme.colors.textGray, size: appTheme.sizes.iconSize  * 0.6),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          Text('指南', style: Get.textTheme.bodyText1),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          Container(
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('使用指南'.tr),
                      Icon(const IconData(0xe658, fontFamily: 'plugIcon'), color: appTheme.colors.textGray, size: appTheme.sizes.iconSize  * 0.6),
                    ],
                  ),
                ),
                Container(
                  height: appTheme.sizes.basic,
                  width: appTheme.sizes.infinity,
                  color: appTheme.colors.borderColor.withOpacity(0.4),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('用户协议'.tr),
                      Icon(const IconData(0xe658, fontFamily: 'plugIcon'), color: appTheme.colors.textGray, size: appTheme.sizes.iconSize  * 0.6),
                    ],
                  ),
                ),
                Container(
                  height: appTheme.sizes.basic,
                  width: appTheme.sizes.infinity,
                  color: appTheme.colors.borderColor.withOpacity(0.6),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('关于我们'.tr),
                      Icon(const IconData(0xe658, fontFamily: 'plugIcon'), color: appTheme.colors.textGray, size: appTheme.sizes.iconSize  * 0.6),
                    ],
                  ),
                ),
                Container(
                  height: appTheme.sizes.basic,
                  width: appTheme.sizes.infinity,
                  color: appTheme.colors.borderColor.withOpacity(0.8),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('问题反馈'.tr),
                      Icon(const IconData(0xe658, fontFamily: 'plugIcon'), color: appTheme.colors.textGray, size: appTheme.sizes.iconSize  * 0.6),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const LBottomNavigation(),
    );
  }
}