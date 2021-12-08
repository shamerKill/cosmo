import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/account/create/accountCreate.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';


class AccountCreatePage extends GetView<AccountCreateController> {
  const AccountCreatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountCreateState state = controller.state;
    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('createWalletPageTitle'.tr),
        description: Text('createWalletPageDescription'.tr, style: Get.textTheme.bodyText1),
      ),
      singleScroll: true,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.basic * 50),
            child: Obx(() => LInput(
              labelText: 'inputPassword'.tr,
              disabled: state.createLoading,
              textController: controller.passwordController,
              visibilityPass: state.passwordShow,
              keyboardType: TextInputType.visiblePassword,
              passOnPress: () => controller.togglePasswordView('password'),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.basic * 20),
            child: Obx(() => LInput(
              labelText: 'inputPasswordAgain'.tr,
              disabled: state.createLoading,
              textController: controller.rePasswordController,
              visibilityPass: state.rePasswordShow,
              keyboardType: TextInputType.visiblePassword,
              passOnPress: () => controller.togglePasswordView('rePassword'),
            )),
          ),
        ],
      ),
      footer: Column(
        children: [
          Row(
            children: [
              Obx(() => Checkbox(
                value: state.agreement,
                onChanged: controller.toogleAgreement,
              )),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text('argumentsClickTip_1'.tr, style: Get.textTheme.bodyText1),
                      InkWell(
                        child: Text('argumentsClickTip_2'.tr, style: Get.textTheme.bodyText1?.copyWith(color: appTheme.colors.primaryColor)),
                        onTap: controller.goToUserAgreement,
                      ),
                      Text('argumentsClickTip_3'.tr, style: Get.textTheme.bodyText1),
                      InkWell(
                        child: Text('argumentsClickTip_4'.tr, style: Get.textTheme.bodyText1?.copyWith(color: appTheme.colors.primaryColor)),
                        onTap: controller.goToUserPrivacy,
                      ),
                    ]
                  ),
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
              child: Text('startCreateButton'.tr),
              disabled: state.createLoading,
              onPressed: state.canCreate ? controller.createAccount : null,
            )),
          ),
        ],
      ),
    );
  }
}