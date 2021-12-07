import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/account/import/import.controller.dart';

class AccountImportPage extends GetView<AccountImportPageController> {
  const AccountImportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AccountImportPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      body: Container(),
    );
  }
}