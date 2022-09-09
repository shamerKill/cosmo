import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LButton extends GetView<LButtonController> {
  const LButton(
      {Key? key,
      this.onPressed,
      this.child,
      this.width,
      this.height,
      this.disabled,
      this.radius,
      this.contrast = false})
      : super(key: key);

  final void Function()? onPressed;
  final Widget? child;
  final double? width;
  final double? height;
  final bool? disabled;
  final bool? contrast;
  final bool? radius;

  @override
  Widget build(BuildContext context) {
    LButtonController controller = Get.put(LButtonController());
    return SizedBox(
      width: width,
      height: height ?? appTheme.sizes.buttonHeight,
      child: ElevatedButton(
        child: child,
        onPressed: disabled == true
            ? null
            : (onPressed == null
                ? null
                : () async {
                    // 定时
                    if (controller.state.pressLoading) return;
                    controller.state.pressLoading = true;
                    await Future.delayed(const Duration(milliseconds: 200));
                    controller.state.pressLoading = false;
                    if (onPressed != null) onPressed!();
                  }),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              contrast == true ? appTheme.colors.borderColor : null),
          overlayColor: MaterialStateProperty.all(contrast == true
              ? appTheme.colors.primaryColor.withOpacity(0.1)
              : null),
          foregroundColor: MaterialStateProperty.all(
              contrast == true ? appTheme.colors.textGrayBig : null),
          shape: radius == true
              ? MaterialStateProperty.all(const StadiumBorder())
              : null,
        ),
      ),
    );
  }
}

class LButtonState {
  final Rx<bool> _pressLoading = false.obs;
  bool get pressLoading => _pressLoading.value;
  set pressLoading(bool value) => _pressLoading.value = value;
}

class LButtonController extends GetxController {
  LButtonController();
  LButtonState state = LButtonState();
}
