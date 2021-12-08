import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/bottomBar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/pages/wallet/home/home.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class BasicHomePage extends GetView<BasicHomePageController> {
  const BasicHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BasicHomePageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: Row(
        children: [
          IconButton(
            onPressed: controller.onTapMenu,
            icon: const Icon(IconData(0xe62d, fontFamily: 'PlugIcon')),
            color: appTheme.colors.textBlack,
          ),
          Expanded(flex: 1, child: Container()),
          IconButton(
            onPressed: controller.goToNewsList,
            icon: Stack(
              children: [
                const Icon(IconData(0xe6e6, fontFamily: 'PlugIcon')),
                Positioned(
                  left: appTheme.sizes.iconSize - 10,
                  top: 2,
                  child: Obx(() => Container(
                    width: appTheme.sizes.basic * 14,
                    height: appTheme.sizes.basic * 14,
                    decoration: BoxDecoration(
                      color: state.hadNewsTip ? appTheme.colors.errorColor : null,
                      borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.basic * 14))
                    ),
                  )),
                ),
              ],
            ),
            color: appTheme.colors.textBlack,
          ),
          IconButton(
            onPressed: controller.goToScan,
            icon: const Icon(IconData(0xe6de, fontFamily: 'PlugIcon')),
            color: appTheme.colors.textBlack,
          ),
        ],
      ),
      basicBackgroundColor: true,
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.basic * 10)),
          Builder(builder: (BuildContext _context) {
            // ignore: prefer_function_declarations_over_variables
            var _getBoxDecoration = (List<Color> colors) => BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: colors,
              ),
            );
            var _contextColor = appTheme.colors.hightColor.withOpacity(0.6);
            return Stack(
              children: [
                // 余额
                Container(
                  decoration: _getBoxDecoration(appTheme.colors.homeAssetsBg),
                  child: Column(
                    children: [
                      Container(height: appTheme.sizes.basic * 140.0),
                      Obx(() => Container(
                        height: appTheme.sizes.basic * 210.0 * (state.infoBoxHeightScale / 100.0),
                      )),
                      InkWell(
                        onTap: controller.onInfoHide,
                        child: Container(
                          height: appTheme.sizes.basic * 80.0,
                          decoration: BoxDecoration(
                            border: Border(top: BorderSide(color: appTheme.colors.borderColor.withOpacity(0.2))),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('一键隐藏', style: TextStyle(color: appTheme.colors.hightColor)),
                              Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall * 0.5)),
                              Icon(
                                const IconData(0xe60a, fontFamily: 'PlugIcon'),
                                color: appTheme.colors.hightColor,
                                size: appTheme.sizes.fontSize,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // 地址
                Positioned(
                  child: Container(
                    height: appTheme.sizes.basic * 140,
                    padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall),
                    decoration: _getBoxDecoration(appTheme.colors.homeAddressBg),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Obx(() => Text(
                            state.accountInfo.address,
                            style: TextStyle(
                              color: _contextColor,
                            ),
                          )),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: controller.onCopyAddress,
                            icon: Icon(Icons.content_copy_rounded, color: _contextColor),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: controller.onShowScan,
                            icon: Icon(Icons.qr_code_outlined, color: _contextColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
          
        ],
      ),
      bottomNavigationBar: const LBottomNavigation(),
    );
  }
}