import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/bottomBar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/dapp/exhibition/dapp.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class DappExhibitionPage extends GetView<DappExhibitionPageController> {
  const DappExhibitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DappExhibitionPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(backgroundColor: appTheme.colors.pageBackgroundColorBasic),
      headerBar: Row(),
      basicBackgroundColor: true,
      body: Container(
        child: Text('生态'),
      ),
      bottomNavigationBar: LBottomNavigation(),
    );
  }
}