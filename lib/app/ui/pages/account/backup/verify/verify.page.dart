import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/pages/account/backup/verify/verify.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';


// TODO: 选择验证
class AccountBackupVerifyPage extends GetView<AccountBackupVerifyPageController> {
  const AccountBackupVerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountBackupVerifyPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('backupMnemonicPageTitle'.tr),
        description: Text('backupMnemonicPageDescription'.tr, style: Get.textTheme.bodyText1),
      ),
      singleScroll: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingBig)),
          Obx(() => Wrap(
            spacing: appTheme.sizes.paddingSmall,
            runSpacing: appTheme.sizes.paddingSmall,
            children: state.mnemonicRandomList.map((item) => InkWell(
              onTap: () => controller.selectMnemonic(item),
              child: Builder(builder: (BuildContext _context) {
                  return Obx(() {
                    bool _itemNoSelected = state.mnemonicSelectList.every((e) => e != item);
                    return LAnimationView(
                      randomKey: false,
                      child: Container(
                        padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                        decoration: BoxDecoration(
                          border: Border.all(color: _itemNoSelected ? appTheme.colors.borderColor : appTheme.colors.primaryColor),
                          borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius))
                        ),
                        child: Text(
                          item,
                          style: Get.textTheme.bodyText1!.copyWith(
                            fontSize: appTheme.sizes.fontSize,
                            color: _itemNoSelected ? null : appTheme.colors.primaryColor
                          ),
                        ),
                      ),
                    );
                  });
                }),
            )).toList(),
          )),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingBig)),
          SingleChildScrollView(
            child: Obx(() => Container(
              width: appTheme.sizes.infinity,
              padding: state.mnemonicSelectList.isEmpty ? null : EdgeInsets.all(appTheme.sizes.padding),
              // height: appTheme.sizes.fontSizeBig * 3 + appTheme.sizes.padding * 10,
              decoration: BoxDecoration(
                color: appTheme.colors.borderColor.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              ),
              child: LAnimationView(
                child: Wrap(
                  spacing: appTheme.sizes.paddingSmall,
                  runSpacing: appTheme.sizes.paddingSmall,
                  children: state.mnemonicSelectList.map((item) => Container(
                    padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                    decoration: BoxDecoration(
                      color: appTheme.colors.pageBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius))
                    ),
                    child: Text(
                      item,
                      style: Get.textTheme.bodyText2!.copyWith(fontSize: appTheme.sizes.fontSizeBig),
                    ),
                  )).toList(),
                ),
              ),
            )),
          ),
        ],
      ),
      footer: Obx(() => LButton(
        child: Text('buttonStep'.tr),
        onPressed: state.selectSuccess ? controller.stepFunc : null,
      )),
    );
  }
}