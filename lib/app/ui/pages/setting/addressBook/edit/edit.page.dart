import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/setting/addressBook/edit/edit.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class UserAddressBookEditPage
    extends GetView<UserAddressBookEditPageController> {
  const UserAddressBookEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAddressBookEditPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(
          backgroundColor: appTheme.colors.pageBackgroundColorBasic),
      headerBar: LAppBar.defaultHeader(
          backgroundColor: appTheme.colors.pageBackgroundColorBasic),
      titleBar: LAppBar.defaultTitle(
        backgroundColor: appTheme.colors.pageBackgroundColorBasic,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => LAppBar.defaultHeaderTextWidget(
                state.isEdit ? 'editAddress'.tr : 'addAddress'.tr)),
            LButton(
              radius: true,
              height: appTheme.sizes.basic * 56,
              onPressed: controller.onSave,
              child: Text('save'.tr,
                  style: TextStyle(fontSize: appTheme.sizes.fontSize)),
            ),
          ],
        ),
      ),
      basicBackgroundColor: true,
      singleScroll: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding:
                  EdgeInsets.symmetric(vertical: appTheme.sizes.paddingBig)),
          Text('alias'.tr),
          Padding(
              padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          LInput(
            textController: controller.nameController,
            fillColor: appTheme.colors.pageBackgroundColor,
            hintText: 'aliasInputHint'.tr,
          ),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
          Text('address'.tr),
          Padding(
              padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          LInput(
            textController: controller.addressController,
            fillColor: appTheme.colors.pageBackgroundColor,
            hintText: 'addressInputHint'.tr,
            suffixIcon: IconButton(
              icon: const Icon(IconData(0xe6de, fontFamily: 'plugIcon')),
              onPressed: controller.onScanQr,
              splashRadius: appTheme.sizes.iconSize,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
          Text('remark'.tr),
          Padding(
              padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          LInput(
            textController: controller.remarksController,
            fillColor: appTheme.colors.pageBackgroundColor,
            hintText: 'remarkInputHint'.tr,
          ),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
          Obx(() => state.isEdit
              ? TextButton(
                  onPressed: controller.onRemove,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: appTheme.sizes.padding),
                    child: Text('delete'.tr,
                        style: TextStyle(
                            color: appTheme.colors.errorColor,
                            fontSize: appTheme.sizes.fontSizeSmall)),
                  ),
                )
              : Container()),
        ],
      ),
    );
  }
}
