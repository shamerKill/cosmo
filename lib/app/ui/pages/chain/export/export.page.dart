import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/bottomBar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/chain/export/delegate/delegate.page.dart';
import 'package:plug/app/ui/pages/chain/export/export.controller.dart';
import 'package:plug/app/ui/pages/chain/export/proposal/proposal.page.dart';
import 'package:plug/app/ui/theme/theme.dart';

class ChainExportPage extends GetView<ChainExportPageController> {
  const ChainExportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainExportPageState state = controller.state;
    return LScaffold(
      statusBar: LAppBar.defaultStatus(
          backgroundColor: appTheme.colors.pageBackgroundColorBasic),
      headerBar: Container(
        height: appTheme.sizes.titleBarHeight * 0.8,
        padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
        child: Row(
          children: [
            Expanded(
              child: Obx(() => TabBar(
                  controller: state.pageTabController,
                  isScrollable: true,
                  labelStyle: TextStyle(
                      fontSize: appTheme.sizes.fontSizeBig,
                      fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(
                      color: appTheme.colors.textBlack,
                      fontSize: appTheme.sizes.fontSize),
                  labelColor: appTheme.colors.textBlackBig,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: appTheme.colors.primaryColor,
                  tabs: state.accountInfo.accountClass == EnumAccountClass.watch ? [
                    SizedBox(
                      width: appTheme.sizes.basic * 150,
                      height: appTheme.sizes.basic * 60,
                      child: Center(child: Text('pledge'.tr)),
                    )
                  ] : [
                    SizedBox(
                      width: appTheme.sizes.basic * 150,
                      height: appTheme.sizes.basic * 60,
                      child: Center(child: Text('pledge'.tr)),
                    ),
                    SizedBox(
                      width: appTheme.sizes.basic * 200,
                      height: appTheme.sizes.basic * 60,
                      child: Center(child: Text('proposal'.tr)),
                    ),
                  ])),
            ),
            Obx(() => state.accountInfo.accountClass == EnumAccountClass.watch ? Container() : InkWell(
              onTap: controller.onCreateToken,
              child: Container(
                decoration: BoxDecoration(
                  color: appTheme.colors.textBlack,
                  borderRadius:
                      BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                ),
                height: appTheme.sizes.basic * 44,
                padding: EdgeInsets.symmetric(
                  horizontal: appTheme.sizes.paddingSmall,
                ),
                child: Center(
                  child: Text('issueToken'.tr,
                      style: TextStyle(
                        color: appTheme.colors.hightColor.withOpacity(0.9),
                        fontSize: appTheme.sizes.fontSizeSmall,
                      )),
                ),
              ),
            )),
          ],
        ),
      ),
      basicBackgroundColor: true,
      hidHorizontalPadding: true,
      body: Obx(() => TabBarView(
        controller: state.pageTabController,
        children: state.accountInfo.accountClass == EnumAccountClass.watch ? 
          [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
            child: const ChainExportDelegatePage(),
          ),
        ]: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
            child: const ChainExportDelegatePage(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
            child: const ChainExportProposalPage(),
          ),
        ],
      )),
      bottomNavigationBar: const LBottomNavigation(),
    );
  }
}
