import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/account/admin/admin.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class AccountAdminPage extends GetView<AccountAdminPageController> {
  const AccountAdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountAdminPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(backgroundColor: appTheme.colors.pageBackgroundColor),
      headerBar: LAppBar.defaultHeader(
        backgroundColor: appTheme.colors.pageBackgroundColor,
        actions: IconButton(onPressed: controller.onShowScan, icon: Icon(Icons.qr_code_outlined, color: appTheme.colors.textBlack)),
      ),
      titleBar: LAppBar.defaultTitle(
        backgroundColor: appTheme.colors.pageBackgroundColor,
        title: SizedBox(
          width: appTheme.sizes.infinity,
          child: LAppBar.defaultHeaderTextWidget('管理账户'.tr),
        ),
      ),
      basicBackgroundColor: true,
      padding: EdgeInsets.only(bottom: ScreenUtil.getBottomBarH(context) == 0 ? appTheme.sizes.padding : ScreenUtil.getBottomBarH(context)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: appTheme.colors.pageBackgroundColor,
            padding: EdgeInsets.all(appTheme.sizes.padding),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: appTheme.sizes.paddingSmall),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.logoSize)),
                      color: appTheme.colors.pageBackgroundColorBasic,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image(
                      image: const AssetImage('assets/images/start_bg.png'),
                      width: appTheme.sizes.logoSize,
                      height: appTheme.sizes.logoSize,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
                      Obx(() => Text(state.accountInfo.nickName, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig))),
                      Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall / 2)),
                      Obx(() => Text(state.accountInfo.address, style: Get.textTheme.bodyText1, softWrap: true)),
                    ],
                  ),
                ),
                IconButton(onPressed: controller.onCopyAddress, icon: Icon(const IconData(0xe6fc, fontFamily: 'plugIcon'), color: appTheme.colors.textGray)),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          InkWell(
            onTap: controller.onToBackupAddress,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.padding),
              decoration: BoxDecoration(
                color: appTheme.colors.pageBackgroundColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('备份账户'.tr),
                  ),
                  Obx(() => Row(
                    children: [
                      if (state.accountInfo.createTime != null) Text('未备份'.tr, style: Get.textTheme.bodyText1),
                      Icon(
                        const IconData(0xe658, fontFamily: 'plugIcon'),
                        size: appTheme.sizes.fontSizeSmall,
                        color: appTheme.colors.textGray,
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall, horizontal: appTheme.sizes.padding),
            child: Text('备份账户以便将来恢复账户下的多币种资产'.tr, style: Get.textTheme.bodyText1),
          ),
          InkWell(
            onTap: controller.onEditPassword,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.padding),
              decoration: BoxDecoration(
                color: appTheme.colors.pageBackgroundColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('修改密码'.tr),
                  ),
                  Icon(
                    const IconData(0xe658, fontFamily: 'plugIcon'),
                    size: appTheme.sizes.fontSizeSmall,
                    color: appTheme.colors.textGray,
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          if (state.accountInfo.address != state.useAccountInfo.address) InkWell(
            onTap: controller.onRemoveAccount,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.padding),
              decoration: BoxDecoration(
                color: appTheme.colors.pageBackgroundColor,
              ),
              child: Center(
                child: Text('移除'.tr, style: TextStyle(color: appTheme.colors.errorColor, fontSize: appTheme.sizes.fontSizeBig)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}