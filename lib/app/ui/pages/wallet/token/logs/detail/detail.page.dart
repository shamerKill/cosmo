import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/pages/wallet/token/logs/detail/detail.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class WalletTokenLogsDetailPage
    extends GetView<WalletTokenLogsDetailPageController> {
  const WalletTokenLogsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletTokenLogsDetailPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: Obx(() => LAppBar.defaultHeaderTextWidget(state.logTypeTitle)),
        description: Padding(
          padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall),
          child: Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (BuildContext _context) {
                    return Row(
                      children: [
                        Icon(
                            state.logDetail.status ==
                                    TransferLogStatusEnum.success
                                ? const IconData(0xe81e, fontFamily: 'plugIcon')
                                : (state.logDetail.status ==
                                        TransferLogStatusEnum.fail
                                    ? const IconData(0xe60c,
                                        fontFamily: 'plugIcon')
                                    : const IconData(0xe815,
                                        fontFamily: 'plugIcon')),
                            size: appTheme.sizes.iconSize / 1.5,
                            color: state.logDetail.status ==
                                    TransferLogStatusEnum.success
                                ? appTheme.colors.primaryColor
                                : (state.logDetail.status ==
                                        TransferLogStatusEnum.fail
                                    ? appTheme.colors.errorColor
                                    : appTheme.colors.textGrayBig)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: appTheme.sizes.fontSize / 2),
                          child: Text(
                            state.logDetail.status ==
                                    TransferLogStatusEnum.success
                                ? 'success'.tr
                                : (state.logDetail.status ==
                                        TransferLogStatusEnum.fail
                                    ? 'fail'.tr
                                    : 'waiting'.tr),
                            style: TextStyle(
                              color: state.logDetail.status ==
                                      TransferLogStatusEnum.success
                                  ? appTheme.colors.primaryColor
                                  : (state.logDetail.status ==
                                          TransferLogStatusEnum.fail
                                      ? appTheme.colors.errorColor
                                      : appTheme.colors.textGrayBig),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                  Text(StringTool.formatTime(state.logDetail.time),
                      style: Get.textTheme.bodyText1),
                ],
              )),
        ),
      ),
      basicBackgroundColor: true,
      body: Container(
        decoration: BoxDecoration(
          color: appTheme.colors.pageBackgroundColor,
          borderRadius:
              BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: appTheme.sizes.padding,
            vertical: appTheme.sizes.paddingSmall),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 交易数量
              _WalletTokenLogsDetailItem(
                title: 'volume'.tr,
                child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.amountVolume.isEmpty
                              ? const Text('----')
                              : Container(),
                          for (var item in state.amountVolume)
                            Text(item.amount + '\r' + item.symbol),
                        ])),
              ),
              // 手续费
              _WalletTokenLogsDetailItem(
                title: 'fee'.tr,
                child: Obx(() => Text(NumberTool.amountToBalance(
                        state.logDetail.fee.amount,
                        scale: state.logDetail.fee.scale) +
                    '\r' +
                    state.logDetail.fee.symbol)),
              ),
              // 交易区块
              _WalletTokenLogsDetailItem(
                title: 'transferInBlockHeight'.tr,
                child: Obx(() => SelectableText(
                      state.logDetail.blockHeight.toString(),
                      style: TextStyle(color: appTheme.colors.primaryColor),
                    )),
              ),
              // 交易哈希
              _WalletTokenLogsDetailItem(
                title: 'hash'.tr,
                copyCallback: () => controller.onCopyText(state.logDetail.hash),
                child: Obx(() => Text(
                      state.logDetail.hash,
                      style: TextStyle(color: appTheme.colors.primaryColor),
                    )),
              ),
              // 交易详情
              _WalletTokenLogsDetailItem(
                title: 'transferInfo'.tr,
                copyCallback: () => controller.onCopyText(state.showInputText),
                child: SizedBox(
                  height: appTheme.sizes.basic * 200.0,
                  child: SingleChildScrollView(
                    child: Obx(() => Text(
                          state.showInputText,
                          style: TextStyle(color: appTheme.colors.primaryColor),
                        )),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: appTheme.sizes.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: controller.goToDetail,
                      child: Text(
                        'goToDetail'.tr,
                        style: TextStyle(
                          color: appTheme.colors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationStyle: TextDecorationStyle.dashed,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WalletTokenLogsDetailItem extends StatelessWidget {
  const _WalletTokenLogsDetailItem({
    Key? key,
    required this.title,
    required this.child,
    this.copyCallback,
  }) : super(key: key);
  final String title;
  final Widget child;
  final void Function()? copyCallback;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Get.textTheme.bodyText1),
          if (copyCallback != null)
            (InkWell(
              onTap: copyCallback,
              child: Icon(
                const IconData(0xe6fc, fontFamily: 'plugIcon'),
                size: appTheme.sizes.iconSize / 1.5,
                color: appTheme.colors.textGray,
              ),
            )),
        ],
      ),
      Padding(
          padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall / 2)),
      LAnimationView(child: child),
      Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
    ]);
  }
}
