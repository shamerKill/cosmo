import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/account/choose/choose.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class AccountChoosePage extends GetView<AccountChoosePageController> {
  const AccountChoosePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountChoosePageState state = controller.state;
    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(
          actions: InkWell(
        onTap: controller.onChangeLanguage,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: appTheme.sizes.paddingSmall),
          child: Text(
            'language'.tr,
            style: TextStyle(color: appTheme.colors.primaryColor),
          ),
        ),
      )),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/page_start_bg.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter),
        ),
        child: Column(
          children: [
            Expanded(child: Container(), flex: 12),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall),
                  child: Image(
                    image:
                        const AssetImage('assets/images/page_start_logo.png'),
                    height: appTheme.sizes.iconSize,
                  ),
                )
              ],
            ),
            Expanded(child: Container(), flex: 1),
            Padding(
              padding: EdgeInsets.only(
                  left: appTheme.sizes.padding,
                  right: appTheme.sizes.paddingSmall),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(appTheme.sizes.radius)),
                          color: appTheme.colors.pageBackgroundColor,
                        ),
                        padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('createAccount'.tr,
                                    style: TextStyle(
                                      fontSize: appTheme.sizes.fontSizeBig,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: appTheme.sizes.paddingSmall / 2)),
                                Text('createAccountStart'.tr,
                                    style: TextStyle(
                                      fontSize: appTheme.sizes.fontSize,
                                      fontWeight: FontWeight.w400,
                                      color: appTheme.colors.textGray,
                                    )),
                              ],
                            ),
                            Expanded(
                              child: Container(),
                              flex: 1,
                            ),
                            Icon(Icons.keyboard_arrow_right_outlined,
                                size: appTheme.sizes.iconSize),
                          ],
                        ),
                      ),
                      onTap: controller.createWallet,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: appTheme.sizes.paddingSmall,
                          right: appTheme.sizes.paddingSmall),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: appTheme.colors.borderColor))),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(appTheme.sizes.radius)),
                          color: appTheme.colors.pageBackgroundColor,
                        ),
                        padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('importAccount'.tr,
                                    style: TextStyle(
                                      fontSize: appTheme.sizes.fontSizeBig,
                                      fontWeight: FontWeight.w600,
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: appTheme.sizes.paddingSmall / 2)),
                                Text('hadAccount'.tr,
                                    style: TextStyle(
                                      fontSize: appTheme.sizes.fontSize,
                                      fontWeight: FontWeight.w400,
                                      color: appTheme.colors.textGray,
                                    )),
                              ],
                            ),
                            Expanded(child: Container(), flex: 1),
                            Icon(Icons.keyboard_arrow_right_outlined,
                                size: appTheme.sizes.iconSize),
                          ],
                        ),
                      ),
                      onTap: controller.importWallet,
                    ),
                    Obx(() => (Column(
                          children: state.hadAccount
                              ? [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: appTheme.sizes.paddingSmall,
                                        right: appTheme.sizes.paddingSmall),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: appTheme
                                                      .colors.borderColor))),
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                appTheme.sizes.radius)),
                                        color:
                                            appTheme.colors.pageBackgroundColor,
                                      ),
                                      padding: EdgeInsets.all(
                                          appTheme.sizes.paddingSmall),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('watchAccount'.tr,
                                                  style: TextStyle(
                                                    fontSize: appTheme
                                                        .sizes.fontSizeBig,
                                                    color: appTheme
                                                        .colors.textGray,
                                                  )),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: appTheme.sizes
                                                              .paddingSmall /
                                                          2)),
                                              Text('watchAccountTip'.tr,
                                                  style: TextStyle(
                                                    fontSize: appTheme
                                                        .sizes.fontSizeSmall,
                                                    fontWeight: FontWeight.w400,
                                                    color: appTheme
                                                        .colors.textGray,
                                                  )),
                                            ],
                                          ),
                                          Expanded(child: Container(), flex: 1),
                                          Icon(
                                              Icons
                                                  .keyboard_arrow_right_outlined,
                                              size: appTheme.sizes.iconSize),
                                        ],
                                      ),
                                    ),
                                    onTap: controller.importWatchWallet,
                                  )
                                ]
                              : [],
                        ))),
                  ],
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: appTheme.colors.borderColor),
                    borderRadius: BorderRadius.all(
                        Radius.circular(appTheme.sizes.radius))),
              ),
            ),
            Obx(() =>
                Expanded(child: Container(), flex: state.hadAccount ? 3 : 5)),
          ],
        ),
      ),
    );
  }
}
