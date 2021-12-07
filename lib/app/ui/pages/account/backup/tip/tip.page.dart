import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/desTip.component.dart';
import 'package:plug/app/ui/pages/account/backup/tip/tip.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class AccountBackupTipPage extends GetView<AccountBackupTipPageController> {
  const AccountBackupTipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountBackupTipPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      titleBar: const Image(
        image: AssetImage('assets/images/page_backup_bg.png'),
        fit: BoxFit.fitWidth,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('backupTipTitle'.tr, style: TextStyle(fontWeight: FontWeight.bold, fontSize: appTheme.sizes.fontSizeBig)),
                Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
                Text('backupTipDescription'.tr, style: TextStyle(fontSize: appTheme.sizes.fontSize)),
                Container(
                  padding: EdgeInsets.only(top: appTheme.sizes.paddingBig),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: appTheme.colors.borderColor.withOpacity(0.5))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: LViewDesTip(text: 'backupTipDescription_1'.tr),
                ),
                Padding(
                  padding: EdgeInsets.only(top: appTheme.sizes.padding),
                  child: LViewDesTip(text: 'backupTipDescription_2'.tr),
                ),
              ],
            ),
          ),
          LButton(
            width: appTheme.sizes.infinity,
            child: Text('backupTipSure'.tr),
            onPressed: controller.backupNow,
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding),
            child: LButton(
              contrast: true,
              width: appTheme.sizes.infinity,
              child: Text('backupTipLate'.tr, style: TextStyle(color: appTheme.colors.textGrayBig)),
              onPressed: controller.backupLate,
            ),
          ),
        ],
      ),
    );
  }
}