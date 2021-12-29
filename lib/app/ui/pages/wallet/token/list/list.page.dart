import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/layout/scroll.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/pages/wallet/token/list/list.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class WalletTokenListPage extends GetView<WalletTokenListPageController> {
  const WalletTokenListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletTokenListPageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: controller.onToggleList,
              splashColor: appTheme.colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    child: Obx(() => Opacity(
                      opacity: state.showType == 0 ? state.animationRatio : (1 - state.animationRatio),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '代币列表'.tr, style: TextStyle(color: appTheme.colors.textBlackBig, fontSize: appTheme.sizes.fontSize * 1.5)),
                            TextSpan(text: '\r/\r', style: TextStyle(color: appTheme.colors.textGray)),
                            TextSpan(text: '已添加'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                          ]
                        ),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                  Positioned(
                    child: Obx(() => Opacity(
                      opacity: state.showType == 1 ? state.animationRatio : (1 - state.animationRatio),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '代币列表'.tr, style: TextStyle(color: appTheme.colors.textGray)),
                            TextSpan(text: '\r/\r', style: TextStyle(color: appTheme.colors.textGray)),
                            TextSpan(text: '已添加'.tr, style: TextStyle(color: appTheme.colors.textBlackBig, fontSize: appTheme.sizes.fontSize * 1.5)),
                          ]
                        ),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
                  ),
                ],
              ),
            ),
            Obx(() => LAnimationView(
              randomKey: false,
              child: state.showType == 0 ? Container() : Text('删除/长按排序'.tr, style: Get.textTheme.bodyText1),
            )),
          ],
        ),
        description: Obx(() => Container(
          padding: EdgeInsets.symmetric(vertical: appTheme.sizes.paddingSmall),
          child: LAnimationView(
            randomKey: false,
            child: state.showType == 0 ? LInput(
              textController: controller.searchTextController,
              onSubmitted: controller.onSearch,
              hintText: '搜索代币名称',
              textInputAction: TextInputAction.search,
              prefixIcon: Icon(Icons.search, color: appTheme.colors.textGray),
            ) : SizedBox(
              height: appTheme.sizes.inputHeight,
              width: appTheme.sizes.infinity,
              child: TextButton(
                child: Text('一键自动获取所有资产'.tr, textAlign: TextAlign.left),
                onPressed: controller.onGetUserAllAssets,
              ),
            ),
          ),
        )),
      ),
      padding: EdgeInsets.only(bottom: (ScreenUtil.getBottomBarH(context) == 0 ? appTheme.sizes.padding : ScreenUtil.getBottomBarH(context))),
      body: TabBarView(
        controller: controller.tabBarController,
        children: [
          LScrollView(
            child: Obx(() => Column(
              children: [
                for (TokenModel _item in state.allTokenList)
                  _WalletTokenListItem(
                    token: _item,
                    onPressed: () => controller.onGoToDetail(_item),
                    icons: InkWell(
                      splashColor: appTheme.colors.transparent,
                      highlightColor: appTheme.colors.transparent,
                      onTap: () => controller.onToggleToken(_item),
                      child: Padding(
                        padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                        child: LAnimationView(
                          randomKey: false,
                          child: controller.checkTokenIsAdd(_item.minUnit) ?
                            Icon(const IconData(0xe81e, fontFamily: 'plugIcon'), size: appTheme.sizes.iconSize * 0.9) :
                            Icon(const IconData(0xe6d6, fontFamily: 'plugIcon'), size: appTheme.sizes.iconSize * 0.9, color: appTheme.colors.textGray),
                        ),
                      ),
                    ),
                  )
              ],
            )),
          ),
          Column(
            children: [
              _WalletTokenListItem(
                token: state.userTokenList.first,
              ),
              Expanded(
                child: Obx(() => ReorderableListView(
                  onReorder: controller.onUserAssetsReorder,
                  children: [
                    for (TokenModel _item in state.userTokenList)
                      if (state.userTokenList.indexOf(_item) != 0) _WalletTokenListItem(
                        key: Key(_item.minUnit + _item.symbol),
                        token: _item,
                        onPressed: () => controller.onGoToDetail(_item),
                        icons: Row(
                          children: [
                            InkWell(
                              splashColor: appTheme.colors.transparent,
                              highlightColor: appTheme.colors.transparent,
                              onTap: () => controller.onLocalRemoveToken(_item),
                              child: Padding(
                                padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                                child: Icon(const IconData(0xe6f3, fontFamily: 'plugIcon'), color: appTheme.colors.textGray),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WalletTokenListItem extends StatelessWidget {
  const _WalletTokenListItem({
    Key? key,
    required this.token,
    this.onPressed,
    this.icons,
  }) : super(key: key);
  final TokenModel token;
  final Widget? icons;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appTheme.sizes.basic * 120,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: appTheme.colors.borderColor)),
      ),
      padding: EdgeInsets.symmetric(
        vertical: appTheme.sizes.paddingSmall,
        horizontal: appTheme.sizes.paddingSmall,
      ),
      child: InkWell(
        onTap: onPressed,
        splashColor: appTheme.colors.transparent,
        highlightColor: appTheme.colors.transparent,
        focusColor: appTheme.colors.transparent,
        hoverColor: appTheme.colors.transparent,
        child: Row(
          children: [
            LViewImage(
              url: token.logo,
              width: appTheme.sizes.basic * 60,
              height: appTheme.sizes.basic * 60,
              isRadius: true,
            ),
            Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
            Text(token.symbol, style: TextStyle(fontSize: appTheme.sizes.fontSizeBig, color: appTheme.colors.textBlack, fontWeight: FontWeight.bold)),
            Text('\r/', style: TextStyle(color: appTheme.colors.textGray)),
            Text(token.name, style: TextStyle(color: appTheme.colors.textGray)),
            Expanded(child: Container()),
            if (icons != null) icons!,
          ],
        ),
      ),
    );
  }
}