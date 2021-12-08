import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/basic/home/home.controller.dart';

class BasicHomePage extends GetView<BasicHomePageController> {
  const BasicHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BasicHomePageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget(''.tr),
        description: Text(''.tr, style: Get.textTheme.bodyText1),
      ),
      body: Container(),
    );
  }
}