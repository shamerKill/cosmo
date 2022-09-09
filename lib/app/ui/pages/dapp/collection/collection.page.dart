import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/pages/dapp/collection/collection.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class DappCollectionPage extends GetView<DappCollectionPageController> {
  const DappCollectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LAppBar.defaultHeaderTextWidget('myCollections'.tr),
            Text('deleteOrCollection'.tr,
                style: TextStyle(color: appTheme.colors.primaryColor)),
          ],
        ),
        description: Padding(
            padding: EdgeInsets.only(bottom: appTheme.sizes.paddingSmall)),
      ),
      basicBackgroundColor: true,
      body: Container(
        decoration: BoxDecoration(
          color: appTheme.colors.pageBackgroundColor,
          borderRadius:
              BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
        ),
        child: Obx(() => ReorderableListView(
              onReorder: controller.onReorder,
              children: [
                for (DappModel _item
                    in controller.dataDappAddress.state.dappCollectList)
                  _DappCollectionListItem(
                    key: Key(_item.address + _item.title),
                    dapp: _item,
                    onDelete: () => controller.onDeleteItem(controller
                        .dataDappAddress.state.dappCollectList
                        .indexOf(_item)),
                  ),
              ],
            )),
      ),
    );
  }
}

class _DappCollectionListItem extends StatelessWidget {
  const _DappCollectionListItem({
    Key? key,
    required this.dapp,
    this.onPressed,
    this.onDelete,
  }) : super(key: key);
  final DappModel dapp;
  final void Function()? onPressed;
  final void Function()? onDelete;

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
              url: dapp.logo,
              width: appTheme.sizes.basic * 60,
              height: appTheme.sizes.basic * 60,
              isRadius: true,
            ),
            Padding(
                padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall)),
            Expanded(
              child: Text(
                dapp.title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            InkWell(
              splashColor: appTheme.colors.transparent,
              highlightColor: appTheme.colors.transparent,
              onTap: onDelete,
              child: Padding(
                padding: EdgeInsets.all(appTheme.sizes.paddingSmall),
                child: Icon(const IconData(0xe6f3, fontFamily: 'plugIcon'),
                    color: appTheme.colors.textGray),
              ),
            )
          ],
        ),
      ),
    );
  }
}
