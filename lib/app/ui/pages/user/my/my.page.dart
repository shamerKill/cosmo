import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/bottomBar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/user/my/my.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class UserMyPage extends GetView<UserMyPageController> {
  const UserMyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserMyPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(backgroundColor: appTheme.colors.pageBackgroundColorBasic),
      headerBar: Row(),
      basicBackgroundColor: true,
      body: Container(
        child: Text('我的'),
      ),
      bottomNavigationBar: LBottomNavigation(),
    );
  }
}