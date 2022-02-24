import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/pages/user/accountList/accountList.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/string.dart';

class UserAccountListPage extends GetView<UserAccountListPageController> {
  const UserAccountListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAccountListPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(
        actions: Obx(() => TextButton(
          onPressed: state.drawerSelected != '' ? () => controller.onAdminAccount(state.drawerSelected) : null,
          child: Opacity(
            opacity: state.drawerSelected != '' ? 1 : 0.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('账户管理'.tr, style: TextStyle(fontSize: appTheme.sizes.fontSize)),
              ],
            ),
          ),
        ))
      ),
      body: Obx(() => Column(
        children: [
          for (AccountModel _item in state.accountList)
            Padding(
              padding: EdgeInsets.only(top: appTheme.sizes.padding),
              child: InkWell(
                onTap: () => controller.onDrawerSelect(_item.address),
                child: LAnimationView(
                  randomKey: false,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.paddingSmall, vertical: appTheme.sizes.padding * 1.2),
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
                              Text(_item.nickName, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig, color: appTheme.colors.hightColor)),
                              Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.5)),
                              Text(StringTool.hideAddressCenter(_item.address, startLen: 20, endLen: 10), style: TextStyle(fontSize: appTheme.sizes.fontSizeSmall, color: appTheme.colors.hightColor)),
                            ],
                          ),
                        ),
                        Icon(
                          const IconData(0xe815, fontFamily: 'plugIcon'),
                          color: appTheme.colors.hightColor
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ]
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
                  Text('addWallet'.tr),
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
      footer: Center(
        child: Text('最多10个账户', style: Get.textTheme.bodyText1),
      ),
    );
  }
}