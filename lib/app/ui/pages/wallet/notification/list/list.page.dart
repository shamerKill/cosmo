import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/pages/wallet/notification/list/list.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class WalletNotificationListPage extends GetView<WalletNotificationListPageController> {
  const WalletNotificationListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletNotificationListPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(
        actions: Obx(() => LAnimationView(
          randomKey: false,
          child: TextButton(
            onPressed: state.isAllRead ? null : controller.onAllRead,
            child: Text('allRead'.tr, style: state.isAllRead ? Get.textTheme.bodyText1 : null,),
          ),
        )),
      ),
      titleBar: LAppBar.defaultTitle(
        title: Padding(
          padding: EdgeInsets.only(bottom: appTheme.sizes.padding),
          child: LAppBar.defaultHeaderTextWidget('messagesCenter'.tr),
        ),
      ),
      basicBackgroundColor: true,
      body: Obx(() => LScrollView(
        refreshController: controller.notificationRefreshController,
        onRefresh: controller.onRefresh,
        onLoading: state.page == 0 ? null : controller.onLoading,
        child: LAnimationView(
          child: Column(
            children: state.listNotification.map((_item) => InkWell(
              onTap: () => controller.onToDetail(_item.id),
              child: Container(
                padding: EdgeInsets.only(
                  top: appTheme.sizes.paddingSmall,
                  bottom: appTheme.sizes.paddingSmall,
                ),
                decoration: BoxDecoration(
                  color: appTheme.colors.pageBackgroundColorBasic,
                  border: Border(
                    bottom: BorderSide(color: appTheme.colors.borderColor.withOpacity(0.5)),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _item.title,
                            style: TextStyle(
                              color: _item.read ? null : appTheme.colors.primaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall / 2)
                          ),
                          Text(
                            _item.time??'',
                            style: Get.textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: appTheme.sizes.padding),
                    ),
                    if (_item.read == false) Container(
                      width: appTheme.sizes.paddingSmall / 2,
                      height: appTheme.sizes.paddingSmall / 2,
                      decoration: BoxDecoration(
                        color: appTheme.colors.errorColor.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.paddingSmall)),
                      ),
                    ),
                    Icon(
                      const IconData(0xe658, fontFamily: 'plugIcon'),
                      color: appTheme.colors.textGray,
                      size: appTheme.sizes.iconSize / 1.5,
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
        ),
      )),
    );
  }
}