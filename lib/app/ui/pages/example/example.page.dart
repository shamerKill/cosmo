
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/pages/example/example.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class ExamplePage extends GetView<ExamplePageController> {
  const ExamplePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    ExamplePageState state = controller.state;
    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: Obx(() => LAppBar.defaultHeader(title: LAnimationView(child: LAppBar.defaultHeaderTextWidget(state.title.tr)))),
      body: Container(
        decoration: const BoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: appTheme.sizes.basic * 40,
              runSpacing: appTheme.sizes.basic * 20,
              children: [
                ElevatedButton(onPressed: controller.showSnackbar, child: Text('snackbar按钮', style: TextStyle(color: appTheme.colors.hightColor)), style: ButtonStyle(shape: MaterialStateProperty.all(const StadiumBorder()))),
                OutlinedButton(onPressed: controller.changeTheme, child: Text('主题', style: TextStyle(color: appTheme.colors.primaryColor)), style: ButtonStyle(shape: MaterialStateProperty.all(const CircleBorder())), clipBehavior: Clip.antiAlias),
                TextButton(onPressed: controller.setTitle, child: Text('更新标题', style: TextStyle(color: appTheme.colors.primaryColor))),
                ElevatedButton(onPressed: controller.chageLanguage, child: Text('切换语言', style: TextStyle(color: appTheme.colors.hightColor))),
                ElevatedButton(onPressed: controller.linkToCreateAccount, child: Text('createWalletPageTitle'.tr, style: TextStyle(color: appTheme.colors.hightColor))),
                IconButton(onPressed: () {}, icon: const Icon(IconData(0xe81e, fontFamily: 'plugIcon'))),
              ],
            ),
            Center(
              child: SizedBox(
                width: context.width * 0.6,
                child: LInput(
                  textController: controller.inputVolume,
                  onlyNumber: true,
                  hintText: 'volumeForRedeeming'.tr,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                width: context.width * 0.6,
                child: Obx(() => LInput(
                  textController: controller.password,
                  hintText: 'inputPassword'.tr,
                  visibilityPass: state.showPassWrod,
                  passOnPress: state.showPassWrodToggle,
                )),
              ),
            ),
            Center(
              child: ElevatedButton(onPressed: controller.addVolume, child: Text('提交表单', style: TextStyle(color: appTheme.colors.hightColor))),
            ),
            Expanded(
              flex: 1,
              child: LScrollView(
                refreshController: controller.accountRefreshController,
                onLoading: controller.onLoading,
                onRefresh: controller.onRefresh,
                child: Obx(() => Column(
                  children: state.items.map((item) => Card(
                    child: SizedBox(
                      height: 40,
                      child: Center(child: LAnimationView(child: SelectableText(
                        item,
                      ))),
                    ),
                  )).toList(),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}