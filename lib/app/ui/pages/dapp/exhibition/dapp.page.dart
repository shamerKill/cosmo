import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/bottomBar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/pages/dapp/exhibition/dapp.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/string.dart';

class DappExhibitionPage extends GetView<DappExhibitionPageController> {
  const DappExhibitionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DappExhibitionPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(backgroundColor: appTheme.colors.pageBackgroundColorBasic),
      headerBar: Padding(
        padding: EdgeInsets.only(
          left: appTheme.sizes.padding,
          right: appTheme.sizes.padding,
          top: appTheme.sizes.paddingSmall,
        ),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  LInput(
                    inputHeight: appTheme.sizes.basic * 80,
                    radiusCircular: true,
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      size: appTheme.sizes.iconSize * 0.9,
                    ),
                  ),
                  Positioned(
                    child: InkWell(
                      onTap: controller.onGoToSearch,
                      splashColor: appTheme.colors.transparent,
                      highlightColor: appTheme.colors.transparent,
                      child: Container(
                        width: appTheme.sizes.infinity,
                        height: appTheme.sizes.basic * 80,
                        color: appTheme.colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall),
            ),
            InkWell(
              onTap: controller.onGoToQrScan,
              splashColor: appTheme.colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall, top: appTheme.sizes.paddingSmall, bottom: appTheme.sizes.paddingSmall),
                child: Icon(
                  const IconData(0xe6de, fontFamily: 'plugIcon'),
                  color: appTheme.colors.textBlack
                ),
              ),
            ),
          ],
        ),
      ),
      basicBackgroundColor: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
          Container(
            decoration: BoxDecoration(
              color: appTheme.colors.pageBackgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Obx(() => LViewImage(
                    url: state.topBanner,
                    width: appTheme.sizes.basic * 690,
                    height: appTheme.sizes.basic * 240,
                  )),
                ),
                if (state.localDappTab != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabBar(
                        isScrollable: true,
                        controller: state.localDappTab,
                        labelColor: appTheme.colors.textBlack,
                        unselectedLabelColor: appTheme.colors.textGray,
                        indicatorColor: appTheme.colors.textBlack,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
                            child: Text('收藏'.tr),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
                            child: Text('最近'.tr),
                          ),
                        ],
                      ),
                      Obx(() => (state.localDappTabIndex == 0) ? InkWell(
                        onTap: controller.onGoToCollection,
                        child: Row(
                          children: [
                            Text('全部', style: Get.textTheme.bodyText1),
                            Icon(
                              Icons.chevron_right_outlined,
                              size: appTheme.sizes.fontSizeSmall,
                              color: appTheme.colors.textGray,
                            ),
                            Padding(padding: EdgeInsets.only(right: appTheme.sizes.paddingSmall)),
                          ],
                        ),
                      ) : Container()),
                    ],
                  ),
                if (state.localDappTab != null)
                  SizedBox(
                    height: 170.0 * appTheme.sizes.basic,
                    child: TabBarView(
                      controller: state.localDappTab,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(() => Row(
                            children: [
                              for (DappModel _item in state.collectList)
                                _LocalDappItem(item: _item, goToDapp: controller.onGoToDapp)
                            ],
                          )),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(() => Row(
                            children: [
                              for (DappModel _item in state.latelyList)
                                _LocalDappItem(item: _item, goToDapp: controller.onGoToDapp)
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          Expanded(
            child: Obx(() => Container(
              width: appTheme.sizes.infinity,
              decoration: BoxDecoration(
                color: appTheme.colors.pageBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(appTheme.sizes.radius),
                  topRight: Radius.circular(appTheme.sizes.radius),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: state.reomoteDappTab == null ? null
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: appTheme.sizes.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: appTheme.colors.borderColor,
                            width: appTheme.sizes.basic,
                          ),
                        ),
                      ),
                      child: TabBar(
                        isScrollable: true,
                        controller: state.reomoteDappTab,
                        labelColor: appTheme.colors.textBlack,
                        unselectedLabelColor: appTheme.colors.textGray,
                        indicatorColor: appTheme.colors.textBlack,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: [
                          for (DappRemoteTypeModel _item in state.remoteDappType)
                            Padding(
                              padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall, bottom: appTheme.sizes.paddingSmall / 2),
                              child: Text(_item.name),
                            ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall / 2)),
                    Expanded(
                      child: TabBarView(
                        controller: state.reomoteDappTab,
                        children: [
                          for (List<DappModel> _list in state.remoteDappList)
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  for (DappModel _item in _list)
                                    _RemoteDappItem(item: _item, goToDapp: controller.onGoToDapp)
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
            )),
          ),
        ],
      ),
      bottomNavigationBar: const LBottomNavigation(),
    );
  }
}

class _LocalDappItem extends StatelessWidget {
  const _LocalDappItem({ Key? key, required this.item, required this.goToDapp }) : super(key: key);
  final DappModel item;
  final Function(String link) goToDapp;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToDapp(item.address),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: appTheme.sizes.paddingSmall,
          horizontal: appTheme.sizes.paddingSmall,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(appTheme.sizes.basic * 2.0),
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.colors.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                color: appTheme.colors.pageBackgroundColor, 
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                ),
                clipBehavior: Clip.antiAlias,
                child: LViewImage(
                  url: item.logo,
                  width: appTheme.sizes.basic * 66.0,
                  height: appTheme.sizes.basic * 66.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall * 0.8),
              child: Text(StringTool.hideAddressCenter(item.title, startLen: 3, endLen: 0)),
            ),
          ],
        ),
      ),
    );
  }
}

class _RemoteDappItem extends StatelessWidget {
  const _RemoteDappItem({ Key? key, required this.item, required this.goToDapp }) : super(key: key);
  final DappModel item;
  final Function(String link) goToDapp;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToDapp(item.address),
      child: Padding(
        padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(appTheme.sizes.basic * 2.0),
              decoration: BoxDecoration(
                border: Border.all(color: appTheme.colors.borderColor),
                borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                color: appTheme.colors.pageBackgroundColor, 
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
                ),
                clipBehavior: Clip.antiAlias,
                child: LViewImage(
                  url: item.logo,
                  width: appTheme.sizes.basic * 66.0,
                  height: appTheme.sizes.basic * 66.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: appTheme.sizes.padding),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(
                  top: appTheme.sizes.paddingSmall,
                  bottom: appTheme.sizes.paddingSmall,
                  right: appTheme.sizes.padding,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: appTheme.colors.borderColor.withOpacity(0.6)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringTool.hideAddressCenter(item.title, startLen: 15, endLen: 0)),
                    Text(
                      item.description,
                      style: Get.textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}