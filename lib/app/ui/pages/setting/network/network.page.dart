import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/setting/network/network.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class UserNetworkPage extends GetView<UserNetworkPageController> {
  const UserNetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserNetworkPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('networkSwitch'.tr),
      ),
      basicBackgroundColor: true,
      singleScroll: true,
      hidHorizontalPadding: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: appTheme.sizes.padding,
              horizontal: appTheme.sizes.padding,
            ),
            child: Text('mainNetwork'.tr, style: Get.textTheme.bodyText1),
          ),
          Obx(() => Column(
                children: [
                  for (NetWorkModel _item in state.mainNetList)
                    InkWell(
                      onTap: () =>
                          controller.exchangeNoNet(_item.id, network: _item),
                      child: Container(
                        height: appTheme.sizes.fontSize * 4,
                        decoration: BoxDecoration(
                          color: appTheme.colors.pageBackgroundColor,
                          border: Border(
                              bottom: BorderSide(
                                  color: appTheme
                                      .colors.pageBackgroundColorBasic)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: appTheme.sizes.padding,
                            horizontal: appTheme.sizes.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_item.name),
                            if (state.nowNetId == _item.id)
                              Icon(
                                  const IconData(0xe81e,
                                      fontFamily: 'plugIcon'),
                                  size: appTheme.sizes.iconSize * 0.8)
                          ],
                        ),
                      ),
                    ),
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: appTheme.sizes.padding,
              horizontal: appTheme.sizes.padding,
            ),
            child: Text('testNetwork'.tr, style: Get.textTheme.bodyText1),
          ),
          Obx(() => Column(
                children: [
                  for (NetWorkModel _item in state.testNetList)
                    InkWell(
                      onTap: () =>
                          controller.exchangeNoNet(_item.id, network: _item),
                      child: Container(
                        height: appTheme.sizes.fontSize * 4,
                        decoration: BoxDecoration(
                          color: appTheme.colors.pageBackgroundColor,
                          border: Border(
                              bottom: BorderSide(
                                  color: appTheme
                                      .colors.pageBackgroundColorBasic)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: appTheme.sizes.padding,
                            horizontal: appTheme.sizes.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_item.name),
                            if (state.nowNetId == _item.id)
                              Icon(
                                  const IconData(0xe81e,
                                      fontFamily: 'plugIcon'),
                                  size: appTheme.sizes.iconSize * 0.8)
                          ],
                        ),
                      ),
                    ),
                ],
              )),
        ],
      ),
    );
  }
}
