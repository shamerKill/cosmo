import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/account/admin/exitPassword/exitPassword.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class AccountExitPasswordPage
    extends GetView<AccountExitPasswordPageController> {
  const AccountExitPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountExitPasswordPageState state = controller.state;
    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('editPassword'.tr),
        description: Text('editPassword'.tr, style: Get.textTheme.bodyText1),
      ),
      singleScroll: true,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.basic * 50),
            child: Obx(() => LInput(
                  labelStyle: state.passwordInputError
                      ? TextStyle(color: appTheme.colors.errorColor)
                      : null,
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
                  labelStyle: state.rePasswordInputError
                      ? TextStyle(color: appTheme.colors.errorColor)
                      : null,
                  labelText: 'inputPasswordAgain'.tr,
                  disabled: state.createLoading,
                  textController: controller.rePasswordController,
                  visibilityPass: state.rePasswordShow,
                  keyboardType: TextInputType.visiblePassword,
                  passOnPress: () =>
                      controller.togglePasswordView('rePassword'),
                )),
          ),
        ],
      ),
      footer: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: appTheme.sizes.padding,
            ),
            child: Obx(() => LButton(
                  width: appTheme.sizes.infinity,
                  child: Text('editPassword'.tr),
                  disabled: state.createLoading,
                  onPressed: state.canCreate ? controller.createAccount : null,
                )),
          ),
        ],
      ),
    );
  }
}
