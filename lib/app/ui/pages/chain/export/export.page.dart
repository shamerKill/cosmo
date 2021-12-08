import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/bottomBar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/chain/export/export.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class ChainExportPage extends GetView<ChainExportPageController> {
  const ChainExportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainExportPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(backgroundColor: appTheme.colors.pageBackgroundColorBasic),
      headerBar: Row(),
      basicBackgroundColor: true,
      body: Container(
        child: Text('主链'),
      ),
      bottomNavigationBar: LBottomNavigation(),
    );
  }
}