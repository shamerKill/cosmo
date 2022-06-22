import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/account/admin/verify/verify.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class AccountAdminVerifyPage extends GetView<AccountAdminVerifyPageController> {
  const AccountAdminVerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountAdminVerifyPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: Obx(() => LAppBar.defaultHeaderTextWidget(
          ['verifyByPassword'.tr, 'verifyByMnemonic'.tr][state.type]
        )),
      ),
      singleScroll: true,
      body: Obx(() => state.type == 0 ? (
        // 密码
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: appTheme.sizes.basic * 50),
              child: Obx(() => LInput(
                labelText: 'inputPassword'.tr,
                disabled: state.verifyLoading,
                textController: controller.passwordController,
                visibilityPass: state.passwordShow,
                keyboardType: TextInputType.visiblePassword,
                passOnPress: () => controller.togglePasswordView('password'),
              )),
            ),
          ],
        )
      ) : (
        // 助记词
        Column(
          children: [
            Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingBig)),
            LInput(
              inputHeight: appTheme.sizes.basic * 300,
              disabled: state.verifyLoading,
              textController: controller.mnemonicController,
              maxLines: 10,
              hintText: 'mnemonicInputPlaceholder'.tr,
            ),
          ]
        )
      )),
      footer: LButton(
        child: Text('verification'.tr),
        disabled: state.verifyLoading,
        onPressed: controller.onVerifyCallBack,
      ),
    );
  }
}