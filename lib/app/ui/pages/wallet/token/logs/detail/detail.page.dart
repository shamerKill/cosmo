import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/pages/wallet/token/logs/detail/detail.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class WalletTokenLogsDetailPage extends GetView<WalletTokenLogsDetailPageController> {
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
                      state.logDetail.status == TransferLogStatusEnum.success ? const IconData(0xe81e, fontFamily: 'plugIcon') : (
                        state.logDetail.status == TransferLogStatusEnum.fail ? const IconData(0xe60c, fontFamily: 'plugIcon') : const IconData(0xe815, fontFamily: 'plugIcon')
                      ),
                      size: appTheme.sizes.iconSize / 1.5,
                      color: state.logDetail.status == TransferLogStatusEnum.success ? appTheme.colors.primaryColor : (
                        state.logDetail.status == TransferLogStatusEnum.fail ? appTheme.colors.errorColor : appTheme.colors.textGrayBig
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: appTheme.sizes.fontSize / 2),
                      child: Text(
                        state.logDetail.status == TransferLogStatusEnum.success ? '成功'.tr : (
                          state.logDetail.status == TransferLogStatusEnum.fail ? '失败'.tr : '等待中'.tr
                        ),
                        style: TextStyle(
                          color: state.logDetail.status == TransferLogStatusEnum.success ? appTheme.colors.primaryColor : (
                            state.logDetail.status == TransferLogStatusEnum.fail ? appTheme.colors.errorColor : appTheme.colors.textGrayBig
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              Text(StringTool.formatTime(state.logDetail.time), style: Get.textTheme.bodyText1),
            ],
          )),
        ),
      ),
      basicBackgroundColor: true,
      body: Container(
        decoration: BoxDecoration(
          color: appTheme.colors.pageBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
        ),
        padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding, vertical: appTheme.sizes.paddingSmall),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 手续费
              _WalletTokenLogsDetailItem(
                title: 'fee'.tr,
                child: Obx(() => Text(
                  NumberTool.amountToBalance(state.logDetail.fee.amount, scale: state.logDetail.fee.scale)
                  + '\r' +
                  state.logDetail.fee.symbol
                )),
              ),
              // 交易区块
              _WalletTokenLogsDetailItem(
                title: 'transferInBlockHeight'.tr,
                child: Obx(() => SelectableText(
                  state.logDetail.blockHeight.toString()
                  , style: TextStyle(color: appTheme.colors.primaryColor),
                )),
              ),
              // 交易哈希
              _WalletTokenLogsDetailItem(
                title: 'hash'.tr,
                copyCallback: () => controller.onCopyText(state.logDetail.hash),
                child: Obx(() => SelectableText(
                  state.logDetail.hash
                  , style: TextStyle(color: appTheme.colors.primaryColor),
                )),
              ),
              // 交易详情
              _WalletTokenLogsDetailItem(
                title: '交易信息'.tr,
                child: Obx(() => SelectableText(
                  state.logDetail.blockHeight.toString()
                  , style: TextStyle(color: appTheme.colors.primaryColor),
                )),
              ),
              Padding(
                padding: EdgeInsets.only(top: appTheme.sizes.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LButton(
                      onPressed: controller.goToDetail,
                      height: appTheme.sizes.buttonHeight * 0.8,
                      child: Text('查看详情'.tr),
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
    this.action,
    this.hidBorder = false,
  }) : super(key: key);
  final String title;
  final Widget child;
  final Widget? action;
  final bool hidBorder;
  final void Function()? copyCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Get.textTheme.bodyText1),
            if (copyCallback != null) (
              InkWell(
                onTap: copyCallback,
                child: Icon(
                  const IconData(0xe6fc, fontFamily: 'plugIcon'),
                  size: appTheme.sizes.iconSize / 1.5,
                  color: appTheme.colors.textGray,
                ),
              )
            ),
            if (action != null) action!,
          ],
        ),
        Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall / 2)),
        LAnimationView(
          child: child
        ),
        Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
        if (!hidBorder) DottedLine(dashColor: appTheme.colors.borderColor),
      ]
    );
  }
}