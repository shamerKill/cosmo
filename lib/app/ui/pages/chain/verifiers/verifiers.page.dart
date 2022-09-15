import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/verifierCard.component.dart';
import 'package:plug/app/ui/pages/chain/verifiers/verifiers.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';

class ChainVerifiersPage extends GetView<ChainVerifiersPageController> {
  const ChainVerifiersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChainVerifiersPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAppBar.defaultHeaderTextWidget('verifierList'.tr),
        description: Text(''.tr, style: Get.textTheme.bodyText1),
      ),
      basicBackgroundColor: true,
      body: SizedBox(
        height: appTheme.sizes.infinity,
        child: Obx(() => LScrollView(
              refreshController: controller.verifiersRefreshController,
              onRefresh: controller.onRefreshListener,
              onLoading: state.listPage == 0 ? null : controller.onLoadListener,
              child: Column(
                children: [
                  for (var _item in state.verifiesList)
                    Padding(
                      padding: EdgeInsets.only(bottom: appTheme.sizes.padding),
                      child: LVerifierCard(
                        verifier: _item,
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(
                                    top: appTheme.sizes.paddingSmall)),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LAnimationView(
                                        randomKey: false,
                                        child: Text(_item.yieldRate,
                                            style: TextStyle(
                                              color:
                                                  appTheme.colors.primaryColor,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing:
                                                  -1 * appTheme.sizes.basic,
                                            )),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: appTheme.sizes.paddingSmall *
                                                  0.5)),
                                      Text('yearYieldRate'.tr,
                                          style: Get.textTheme.bodyText1)
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            appTheme.sizes.paddingSmall * 0.5)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: LAnimationView(
                                          randomKey: false,
                                          child: Text(
                                              NumberTool.formatNumberStr(
                                                  NumberTool.amountToBalance(
                                                      _item.allPledged)),
                                              style: TextStyle(
                                                letterSpacing:
                                                    -1 * appTheme.sizes.basic,
                                              )),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: appTheme.sizes.paddingSmall *
                                                  0.5)),
                                      Text('totalPledgeQuantity'.tr,
                                          style: Get.textTheme.bodyText1)
                                    ],
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left:
                                            appTheme.sizes.paddingSmall * 0.5)),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: LAnimationView(
                                          randomKey: false,
                                          child: Text(
                                              _item.pledged == ''
                                                  ? 'noPledged'.tr
                                                  : NumberTool.formatNumberStr(
                                                      NumberTool
                                                          .amountToBalance(
                                                              _item.pledged)),
                                              style: _item.pledged == ''
                                                  ? TextStyle(
                                                      color: appTheme
                                                          .colors.textGrayBig)
                                                  : TextStyle(
                                                      color: appTheme
                                                          .colors.primaryColor,
                                                      letterSpacing: -1 *
                                                          appTheme.sizes.basic,
                                                    )),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: appTheme.sizes.paddingSmall *
                                                  0.5)),
                                      Text('myPledge'.tr,
                                          style: Get.textTheme.bodyText1),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: appTheme.sizes.paddingSmall),
                              child: InkWell(
                                onTap: () =>
                                    controller.onVerifierDetailListener(_item),
                                child: Container(
                                  width: appTheme.sizes.infinity,
                                  height: appTheme.sizes.buttonHeight * 0.6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(appTheme.sizes.radius)),
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: appTheme.colors.homeAddressBg,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text('goToDetail'.tr,
                                        style: Get.textTheme.bodyText1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            )),
      ),
    );
  }
}
