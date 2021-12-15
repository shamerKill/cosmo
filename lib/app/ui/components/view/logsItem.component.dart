import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/number.dart';
import 'package:plug/app/ui/utils/string.dart';

class LLogsItemView extends GetView {
  const LLogsItemView({
    Key? key,
    required this.item,
  }) : super(key: key);
  final TransferLogModel item;

  @override
  Widget build(BuildContext context) {
    LLogsItemViewController controller = Get.put(LLogsItemViewController());

    return Container(
      padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: appTheme.colors.borderColor)),
      ),
      child: Row(
        children: [
          controller.getIcon(item.type),
          Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.getTitle(item),
                Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall / 3)),
                Text(StringTool.formatTime(item.time), style: Get.textTheme.bodyText1),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                NumberTool.amountToBalance(item.items.first.coin.amount, scale: item.items.first.coin.scale)
                + '\r' +
                item.items.first.coin.symbol,
              ),
              Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall / 2)),
              Icon(
                IconData(item.status == TransferLogStatusEnum.success ? 0xe81e : (
                  item.status == TransferLogStatusEnum.fail ? 0xe60c : 0xe815
                ), fontFamily: 'plugIcon'),
                size: appTheme.sizes.iconSize / 1.5,
                color: item.status == TransferLogStatusEnum.success ? appTheme.colors.primaryColor : (
                  item.status == TransferLogStatusEnum.fail ? appTheme.colors.errorColor : appTheme.colors.textGrayBig
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LLogsItemViewState {
}

class LLogsItemViewController extends GetxController {
  LLogsItemViewController();
  LLogsItemViewState state = LLogsItemViewState();

  Widget getIcon(TransferLogTypeEnum type) {
    Color bgColor = appTheme.colors.primaryColor;
    int iconPoint = 0xe6f6;
    if (type == TransferLogTypeEnum.receive) { // 转入
      bgColor = StringTool.stringToColor('0');
      iconPoint = 0xe6f6;
    } else if (type == TransferLogTypeEnum.send) { // 转出
      bgColor = StringTool.stringToColor('1');
      iconPoint = 0xe6f7;
    }
    return Container(
      width: appTheme.sizes.basic * 60.0,
      height: appTheme.sizes.basic * 60.0,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.basic * 60.0)),
      ),
      child: Icon(
        IconData(iconPoint, fontFamily: 'plugIcon'),
        color: appTheme.colors.hightColor,
        size: appTheme.sizes.iconSize,
      ),
    );
  }
  // TODO: 交易分类
  Widget getTitle(TransferLogModel item) {
    if (item.type == TransferLogTypeEnum.receive) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '转账至'.tr + '\r'),
            TextSpan(
              text: StringTool.hideAddressCenter(item.items.first.toAddress, startLen: 4, endLen: 8),
              style: TextStyle(color: appTheme.colors.primaryColor),
            ),
          ]
        ),
      );
    } if (item.type == TransferLogTypeEnum.send) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: StringTool.hideAddressCenter(item.items.first.formAddress, startLen: 4, endLen: 8),
              style: TextStyle(color: appTheme.colors.primaryColor),
            ),
            TextSpan(text: '\r' + '转入'.tr),
          ]
        ),
      );
    }
    return Text('');
  }
}
