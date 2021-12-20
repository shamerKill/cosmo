import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/user/addressBook/list/list.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class UserAddressBookListPage extends GetView<UserAddressBookListPageController> {
  const UserAddressBookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAddressBookListPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LAppBar.defaultHeaderTextWidget('地址簿'.tr),
            LButton(
              radius: true,
              height: appTheme.sizes.basic * 56,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      singleScroll: true,
      body: Obx(() => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding),
          ),
          for (var _item in state.addressList)
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: appTheme.colors.borderColor)),
              ),
              padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
              child: Column(
                children: [
                  
                ],
              ),
            )
        ],
      )),
    );
  }
}