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
              LAppBar.defaultHeaderTextWidget('addressesBook'.tr),
              Obx(() => Visibility(
                visible: !state.isSelect,
                child: LButton(
                  radius: true,
                  height: appTheme.sizes.basic * 56,
                  onPressed: controller.onCreateAddress,
                  child: const Icon(Icons.add),
                )
              )),
            ],
          ),
      ),
      singleScroll: true,
      body: Obx(() => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: appTheme.sizes.padding),
          ),
          for (var _item in controller.dataAddress.state.addressList)
            InkWell(
              splashColor: appTheme.colors.transparent,
              onTap: () => controller.onEditAddress(_item),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: appTheme.colors.borderColor)),
                ),
                padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_item.name),
                              Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall / 2)),
                              Text(_item.address, style: Get.textTheme.bodyText1),
                            ],
                          ),
                        ),
                        Icon(
                          const IconData(0xe658, fontFamily: 'plugIcon'),
                          color: appTheme.colors.textGray,
                          size: appTheme.sizes.iconSize * 0.6,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall),
                    ),
                    Container(
                      width: appTheme.sizes.infinity,
                      padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall / 2, horizontal: appTheme.sizes.paddingSmall),
                      decoration: BoxDecoration(
                        color: appTheme.colors.pageBackgroundColorBasic,
                        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius / 2)),
                      ),
                      child: Text('remark'.tr + ': ' + _item.remarks, style: Get.textTheme.bodyText1),
                    ),
                  ],
                ),
              ),
            ),
        ],
      )),
    );
  }
}