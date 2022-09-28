import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/account/import_watch/import_watch.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class AccountImportWatch extends GetView<AccountImportWatchController> {
  const AccountImportWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountImportWatchState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('watchAccount'.tr),
        description: Text('watchAccountTip'.tr,
            style: Get.textTheme.bodyText1
                ?.copyWith(color: appTheme.colors.primaryColor)),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingBig)),
          LInput(
            inputHeight: appTheme.sizes.basic * 300,
            disabled: state.importLoading,
            textController: controller.addressController,
            maxLines: 10,
            hintText: 'importWatchAccountHint'.tr,
          ),
        ],
      ),
      footer: Column(
        children: [
          Row(
            children: [
              Obx(() => Checkbox(
                    value: state.agreement,
                    onChanged: controller.toggleAgreement,
                  )),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Text('argumentsClickTip_1'.tr,
                        style: Get.textTheme.bodyText1),
                    InkWell(
                      child: Text('argumentsClickTip_2'.tr,
                          style: Get.textTheme.bodyText1
                              ?.copyWith(color: appTheme.colors.primaryColor)),
                      onTap: controller.goToUserAgreement,
                    ),
                    Text('argumentsClickTip_3'.tr,
                        style: Get.textTheme.bodyText1),
                    InkWell(
                      child: Text('argumentsClickTip_4'.tr,
                          style: Get.textTheme.bodyText1
                              ?.copyWith(color: appTheme.colors.primaryColor)),
                      onTap: controller.goToUserPrivacy,
                    ),
                  ]),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: appTheme.sizes.padding,
            ),
            child: Obx(() => LButton(
                  width: appTheme.sizes.infinity,
                  child: Text('importAccountStart'.tr),
                  disabled: state.importLoading,
                  onPressed: state.canImport ? controller.importAccount : null,
                )),
          ),
        ],
      ),
    );
  }
}
