import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/setting/problems/problems.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class UserProblemsPage extends GetView<UserProblemsPageController> {
  const UserProblemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProblemsPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LAppBar.defaultHeaderTextWidget('backProblem'.tr),
            LButton(
              radius: true,
              height: appTheme.sizes.basic * 56,
              onPressed: controller.onSubmitProblems,
              child: Text('submit'.tr),
            ),
          ],
        ),
        description: Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
      ),
      singleScroll: true,
      basicBackgroundColor: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('email'.tr),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          LInput(
            hintText: 'emailInputHint'.tr,
            textController: controller.emailController,
          ),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          Text('description'.tr),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          LInput(
            hintText: 'problemInputHint'.tr,
            textController: controller.descController,
            maxLines: 5,
            inputHeight: appTheme.sizes.inputHeight * 3,
          ),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          Text('updateScreenshot'.tr),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
          Obx(() => Wrap(
            spacing: appTheme.sizes.paddingSmall,
            runSpacing: appTheme.sizes.paddingSmall,
            children: [
              for (String _pic in state.picList)
                InkWell(
                  onTap: () => controller.onShowPic(_pic),
                  onLongPress: () => controller.onLongDelete(_pic),
                  child: Container(
                    width: appTheme.sizes.basic * 175,
                    height: appTheme.sizes.basic * 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.file(
                      File(_pic),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              if (state.picList.isEmpty)
                InkWell(
                  onTap: controller.onSelectPicture,
                  child: Container(
                    width: appTheme.sizes.basic * 175,
                    height: appTheme.sizes.basic * 175,
                    decoration: BoxDecoration(
                      color: appTheme.colors.textGray.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                    ),
                    child: Icon(Icons.cloud_upload_outlined, color: appTheme.colors.textGray, size: appTheme.sizes.iconSize * 1.5),
                  ),
                ),
            ],
          )),
        ],
      ),
    );
  }
}