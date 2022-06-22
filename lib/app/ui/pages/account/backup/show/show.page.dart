import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/desTip.component.dart';
import 'package:plug/app/ui/pages/account/backup/show/show.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class AccountBackupShowPage extends GetView<AccountBackupShowPageController> {
  const AccountBackupShowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountBackupShowPageState state = controller.state;

    // 禁止截屏弹窗
    state.screenShotView.add(Column(
      children: [
        Image(
          image: const AssetImage('assets/images/page_backup_screen.png'),
          width: appTheme.sizes.basic * 100,
          height: appTheme.sizes.basic * 100,
        ),
        Padding(
          padding: EdgeInsets.only(top: appTheme.sizes.padding),
          child: Text('notScreenshots'.tr, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig, fontWeight: FontWeight.w700)),
        ),
        Padding(
          padding: EdgeInsets.only(top: appTheme.sizes.padding),
          child: Text(
            'notScreenshotsTip'.tr,
            style: Get.textTheme.bodyText1,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: appTheme.sizes.padding),
          child:  LButton(
            width: appTheme.sizes.infinity,
            onPressed: Get.back,
            child: Text('IAmKnown'.tr),
          ),
        ),
      ],
    ));
    
    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('backupMnemonicList'.tr),
        description: Column(
          children: [
            LDesTipView(text: 'backupMnemonicInfoTip_1'.tr),
            Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
            LDesTipView(text: 'backupMnemonicInfoTip_2'.tr),
          ],
        ),
      ),
      singleScroll: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Builder(builder: (BuildContext _context) {
            double _itemWidth = (context.width - appTheme.sizes.padding * 2 - appTheme.sizes.basic * 2) / 3;
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.colors.borderColor, width: appTheme.sizes.basic),
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                color: appTheme.colors.borderColor.withOpacity(0.1),
              ),
              clipBehavior: Clip.antiAlias,
              child: Obx(() => Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: state.mnemonicList.map<Widget>((item) {
                  return Container(
                    width: _itemWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: appTheme.sizes.paddingSmall,
                      vertical: appTheme.sizes.paddingSmall / 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: appTheme.colors.borderColor, width: appTheme.sizes.basic),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: appTheme.sizes.infinity,
                          child: Text(
                            '${state.mnemonicList.indexOf(item) + 1}',
                            textAlign: TextAlign.right,
                            style: Get.textTheme.bodyText1!.copyWith(fontSize: appTheme.sizes.fontSizeSmall * 0.8),
                          ),
                        ),
                        SelectableText(
                          item,
                          style: TextStyle(
                            fontSize: appTheme.sizes.fontSize,
                            color: appTheme.colors.textBlack.withOpacity(0.8),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                      ],
                    ),
                  );
                }).toList(),
              )),
            );
          }),
        ],
      ),
      footer: Obx(() => LButton(
        width: appTheme.sizes.infinity,
        onPressed: state.backupTimeDown == 0 ? controller.backupStep : null,
        child: LAnimationView(child: Text(
          state.backupTimeDown == 0 ?
          'backupMnemonicSure'.tr :
          '${'backupMnemonicWaiting'.tr}(${state.backupTimeDown}s)',
        )),
      )),
    );
  }
}