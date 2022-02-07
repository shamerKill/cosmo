import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/pages/chain/export/transaction/transaction.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class ChainExportTransactionPage extends GetView<ChainExportTransactionPageController> {
  const ChainExportTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChainExportTransactionPageController());
    ChainExportTransactionPageState state = controller.state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
        InkWell(
          onTap: controller.onGoToMyTransactionList,
          child: Container(
            height: appTheme.sizes.basic * 80,
            width: appTheme.sizes.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: appTheme.colors.homeAssetsBg,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('我的交易列表'.tr, style: TextStyle(color: appTheme.colors.hightColor, fontSize: appTheme.sizes.fontSizeSmall)),
                Padding(padding: EdgeInsets.only(right: appTheme.sizes.basic * 5.0)),
                Icon(
                  const IconData(0xe60a, fontFamily: 'plugIcon'),
                  color: appTheme.colors.hightColor,
                  size: appTheme.sizes.basic * 18.0,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: appTheme.sizes.paddingSmall,
            bottom: appTheme.sizes.paddingSmall,
          ),
          child: Text(
            '当前交易池'.tr,
            style: TextStyle(
              color: appTheme.colors.textBlackBig,
              fontWeight: FontWeight.bold,
            )
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (TransitionPoolData _item in state.poolLlist)
                  Padding(
                    padding: EdgeInsets.only(bottom: appTheme.sizes.padding),
                    child: Container(
                      padding: EdgeInsets.only(top: appTheme.sizes.padding, left: appTheme.sizes.paddingSmall, right: appTheme.sizes.paddingSmall),
                      decoration: BoxDecoration(
                        color: appTheme.colors.pageBackgroundColor,
                        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: appTheme.sizes.basic * 100,
                                height: appTheme.sizes.basic * 56,
                                child: Stack(
                                  children: [
                                    LViewImage(
                                      width: appTheme.sizes.basic * 56,
                                      height: appTheme.sizes.basic * 56,
                                      url: _item.startToken.logo,
                                      isRadius: true,
                                    ),
                                    Positioned(
                                      left: appTheme.sizes.basic * 40,
                                      top: 0,
                                      child: LViewImage(
                                        width: appTheme.sizes.basic * 56,
                                        height: appTheme.sizes.basic * 56,
                                        url: _item.endToken.logo,
                                        isRadius: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: appTheme.sizes.paddingSmall,
                                    right: appTheme.sizes.paddingSmall,
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      '${_item.startToken.symbol}-${_item.endToken.symbol}',
                                      style: TextStyle(
                                        color: appTheme.colors.textBlackBig,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: appTheme.sizes.basic * 58.0,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text('兑换'.tr, style: TextStyle(color: appTheme.colors.primaryColor)),
                                  style: OutlinedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    side: BorderSide(color: appTheme.colors.primaryColor),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
                          InkWell(
                            onTap: () => controller.onGoToPoolDetail(_item.id),
                            child: Container(
                              width: appTheme.sizes.infinity,
                              height: appTheme.sizes.buttonHeight * 0.8,
                              decoration: BoxDecoration(
                                border: Border(top: BorderSide(color: appTheme.colors.borderColor, width: appTheme.sizes.basic)),
                              ),
                              child: Center(
                                child: Text('查看详情', style: TextStyle(color: appTheme.colors.textGrayBig)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ]
            ),
          ),
        ),
      ],
    );
  }
}