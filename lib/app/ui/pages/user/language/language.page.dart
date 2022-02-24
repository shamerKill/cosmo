import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/translation/translation.dart';
import 'package:plug/app/ui/components/layout/appbar.component.dart';
import 'package:plug/app/ui/components/layout/scaffold.component.dart';
import 'package:plug/app/ui/components/view/animation.component.dart';
import 'package:plug/app/ui/pages/user/language/language.controller.dart';
import 'package:plug/app/ui/theme/theme.dart';

class UserLanguagePage extends GetView<UserLanguagePageController> {
  const UserLanguagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserLanguagePageState state = controller.state;

    return LScaffold(
      statusBar: LAppBar.defaultStatus(),
      headerBar: LAppBar.defaultHeader(),
      titleBar: LAppBar.defaultTitle(
        title: LAnimationView(
          randomKey: false,
          width: appTheme.sizes.infinity,
          child: LAppBar.defaultHeaderTextWidget('languageVersion'.tr)
        ),
        description: Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
      ),
      singleScroll: true,
      basicBackgroundColor: true,
      hidHorizontalPadding: true,
      body: Obx(() => Column(
        children: [
          for (Locale _item in state.languageList)
            InkWell(
              onTap: () => controller.onChangeLanguage(_item),
              child: Container(
                height: appTheme.sizes.fontSize * 4,
                decoration: BoxDecoration(
                  color: appTheme.colors.pageBackgroundColor,
                  border: Border(bottom: BorderSide(color: appTheme.colors.pageBackgroundColorBasic)),
                ),
                padding: EdgeInsets.symmetric(vertical: appTheme.sizes.padding, horizontal: appTheme.sizes.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(plugTranslation.localToString(_item)),
                    if (state.nowLanguage == _item.toLanguageTag())
                      Icon(const IconData(0xe81e, fontFamily: 'plugIcon'), size: appTheme.sizes.iconSize * 0.8)
                  ],
                ),
              ),
            ),
        ],
      )),
    );
  }
}