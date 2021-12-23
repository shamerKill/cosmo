import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/user/about/about.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class UserAboutPage extends GetView<UserAboutPageController> {
  const UserAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAboutPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      basicBackgroundColor: true,
      singleScroll: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingBig)),
          Image(
            image: const AssetImage('assets/images/logo_icon.png'),
            width: appTheme.sizes.logoSize * 2,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: appTheme.sizes.padding,
              bottom: appTheme.sizes.paddingSmall,
            ),
            child: Obx(() => Text(
              state.appName,
              style: TextStyle(
                fontSize: appTheme.sizes.fontSizeBig * 1.2,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: appTheme.sizes.padding * 2,
            ),
            child: Obx(() => Text(
              state.appVersion,
              style: TextStyle(color: appTheme.colors.textGray),
            )),
          ),
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
                      Text('版本日志'.tr),
                      Icon(const IconData(0xe658, fontFamily: 'plugIcon'), color: appTheme.colors.textGray, size: appTheme.sizes.iconSize  * 0.6),
                    ],
                  ),
                ),
                Container(
                  height: appTheme.sizes.basic,
                  width: appTheme.sizes.infinity,
                  color: appTheme.colors.borderColor,
                ),
                InkWell(
                  onTap: controller.onUpdateVersion,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('版本更新'.tr),
                        if (state.hadUpdate == '')
                          Text('暂无版本更新', style: Get.textTheme.bodyText1)
                        else 
                          Row(
                            children: [
                              Text('v ${state.hadUpdate}', style: Get.textTheme.bodyText1),
                              Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall / 2)),
                              Container(
                                width: appTheme.sizes.radius / 2,
                                height: appTheme.sizes.radius / 2,
                                decoration: BoxDecoration(
                                  color: appTheme.colors.primaryColor,
                                  borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: appTheme.sizes.padding,
            ),
          ),
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
                      Text('网站'.tr),
                      Obx(() => SelectableText(
                        state.webSite,
                        style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeSmall),
                      )),
                    ],
                  ),
                ),
                Container(
                  height: appTheme.sizes.basic,
                  width: appTheme.sizes.infinity,
                  color: appTheme.colors.borderColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Twitter'.tr),
                      Obx(() => SelectableText(
                        state.twitterSite,
                        style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeSmall),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}