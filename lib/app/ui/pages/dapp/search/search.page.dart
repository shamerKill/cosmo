import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/dapp/search/search.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class DappSearchPage extends GetView<DappSearchPageController> {
  const DappSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DappSearchPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: Padding(
        padding: EdgeInsets.only(
          left: appTheme.sizes.padding,
          right: appTheme.sizes.padding,
          top: appTheme.sizes.paddingSmall,
        ),
        child: Row(
          children: [
            Expanded(
              child: LInput(
                autoFocus: true,
                inputHeight: appTheme.sizes.basic * 80,
                radiusCircular: true,
                textController: controller.searchController,
                hintText: '搜索项目、币名或输入连接',
                textInputAction: TextInputAction.search,
                onSubmitted: controller.onSearchData,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  size: appTheme.sizes.iconSize * 0.9,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall),
            ),
            InkWell(
              onTap: controller.onSearchBtn,
              splashColor: appTheme.colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall, top: appTheme.sizes.paddingSmall, bottom: appTheme.sizes.paddingSmall),
                child: Text('取消'.tr, style: TextStyle(color: appTheme.colors.primaryColor, fontSize: appTheme.sizes.fontSizeBig)),
              ),
            ),
          ],
        ),
      ),
      basicBackgroundColor: true,
      titleBar: Padding(
        padding: EdgeInsets.only(
          top: appTheme.sizes.padding,
          left: appTheme.sizes.padding,
          right: appTheme.sizes.padding + appTheme.sizes.paddingSmall / 2,
          bottom: appTheme.sizes.paddingSmall,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '搜索历史'.tr,
              style: TextStyle(
                color: appTheme.colors.textGray
              )
            ),
            InkWell(
              child: Icon(
                const IconData(0xe6ed, fontFamily: 'plugIcon'),
                size: appTheme.sizes.iconSize * 0.8,
                color: appTheme.colors.textGray,
              ),
            ),
          ],
        ),
      ),
      singleScroll: true,
      body: Obx(() => Column(
        children: [
          for (DappModel _item in controller.dataDappAddress.state.dappLatelyList)
            Padding(
              padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall * 0.8),
              child: InkWell(
                onTap: () => controller.onClickHistory(_item),
                splashColor: appTheme.colors.transparent,
                highlightColor: appTheme.colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        color: appTheme.colors.transparent,
                        child: Text(
                          _item.address,
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
                    InkWell(
                      onTap: () => controller.onDeleteHistory(_item.address),
                      child: Padding(
                        padding: EdgeInsets.all(appTheme.sizes.paddingSmall / 2),
                        child: Icon(
                          const IconData(0xe60c, fontFamily: 'plugIcon'),
                          color: appTheme.colors.textGray,
                          size: appTheme.sizes.iconSize * 0.8,
                        ),
                      ),
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