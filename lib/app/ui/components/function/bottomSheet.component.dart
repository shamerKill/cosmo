import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/components/function/button.component.dart';
import 'package:plug/app/ui/components/function/input.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LBottomSheet {
  static Future<T?> baseBottomSheet<T>({
    Widget? child,
    bool horizontalPadding = false,
    bool showClose = true,
  }) {
    return Get.bottomSheet<T>(
      Container(
        decoration: BoxDecoration(
          color: appTheme.colors.pageBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(appTheme.sizes.radius * 2),
            topRight: Radius.circular(appTheme.sizes.radius * 2),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: SingleChildScrollView(
          padding: horizontalPadding
              ? EdgeInsets.symmetric(horizontal: appTheme.sizes.padding)
              : null,
          child: Column(
            children: [
              // 顶部关闭
              if (showClose)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: Get.back,
                      icon: Icon(Icons.close, size: appTheme.sizes.iconSize),
                      padding: EdgeInsets.symmetric(
                          vertical: appTheme.sizes.paddingSmall,
                          horizontal: appTheme.sizes.paddingSmall),
                    ),
                  ],
                ),
              if (child != null) child,
              // 底部尺寸
              Padding(
                  padding: EdgeInsets.only(
                      bottom: Get.bottomBarHeight == 0
                          ? appTheme.sizes.paddingBig * 2
                          : Get.bottomBarHeight.sp)),
            ],
          ),
        ),
      ),
      enableDrag: true,
      isDismissible: true,
      barrierColor: appTheme.colors.pageConTrastColor.withOpacity(0.5),
    );
  }

  static Future<String?> passwordBottomSheet() {
    TextEditingController passwordController = TextEditingController();

    bool _visiblePassword = false;
    return baseBottomSheet<String>(
      showClose: false,
      child: Builder(
        builder: (BuildContext _) {
          return StatefulBuilder(builder: (_, setBottomSheetState) {
            return Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: appTheme.sizes.titleBarHeight,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text('accountPassword'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: appTheme.sizes.fontSizeBig,
                              fontWeight: FontWeight.bold)),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.close,
                              color: appTheme.colors.textBlack,
                              size: appTheme.sizes.iconSize),
                          onPressed: Get.back,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              bottom: appTheme.sizes.paddingSmall)),
                      LInput(
                        textController: passwordController,
                        labelText: 'inputPassword'.tr,
                        visibilityPass: _visiblePassword,
                        passOnPress: () {
                          setBottomSheetState(() {
                            _visiblePassword = !_visiblePassword;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          LToast.info('forgetPasswordTip'.tr);
                        },
                        child: Text('passwordForget'.tr,
                            style: Get.textTheme.bodyText1
                                ?.copyWith(fontSize: appTheme.sizes.fontSize)),
                      ),
                      LButton(
                        width: appTheme.sizes.infinity,
                        height: appTheme.sizes.buttonHeight * 0.9,
                        child: Text('sure'.tr),
                        onPressed: () =>
                            Get.back(result: passwordController.text),
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
        },
      ),
    );
  }

  static Future<bool?> promptBottomSheet({String? title, Widget? message}) {
    return baseBottomSheet<bool>(
      showClose: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: appTheme.sizes.padding),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
            if (title != null)
              Text(title,
                  style: TextStyle(
                      fontSize: appTheme.sizes.fontSizeBig,
                      fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(top: appTheme.sizes.paddingSmall)),
            if (message != null) message,
            Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
            Row(
              children: [
                Expanded(
                  child: LButton(
                    contrast: true,
                    height: appTheme.sizes.buttonHeight * 0.8,
                    child: Text('cancel'.tr),
                    onPressed: () => Get.back(result: false),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: appTheme.sizes.padding)),
                Expanded(
                  child: LButton(
                    height: appTheme.sizes.buttonHeight * 0.8,
                    child: Text('sure'.tr),
                    onPressed: () => Get.back(result: true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget selectSheetChild({
    required List<String> labelList,
    Function(int)? successCallBack,
    int selected = 0,
  }) {
    return Builder(builder: (BuildContext _context) {
      int _selectValue = selected;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: Get.back,
                  child: Text('cancel'.tr,
                      style: TextStyle(color: appTheme.colors.textGray))),
              TextButton(
                  onPressed: () => (successCallBack != null
                      ? successCallBack(_selectValue)
                      : null),
                  child: Text('sure'.tr)),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: appTheme.sizes.padding)),
          SizedBox(
            width: appTheme.sizes.infinity,
            height: appTheme.sizes.basic * 380,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              itemExtent: appTheme.sizes.basic * 90,
              scrollController:
                  FixedExtentScrollController(initialItem: _selectValue),
              children: [
                for (String _item in labelList)
                  Center(
                    child: Text(_item, style: Get.textTheme.bodyText2),
                  ),
              ],
              onSelectedItemChanged: (value) {
                _selectValue = value;
              },
            ),
          ),
        ],
      );
    });
  }
}
