import 'package:flutter/material.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LButton extends StatelessWidget {
  const LButton({
    Key? key,
    this.onPressed,
    this.child,
    this.width,
    this.height,
    this.disabled,
    this.radius,
    this.contrast = false
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget? child;
  final double? width;
  final double? height;
  final bool? disabled;
  final bool? contrast;
  final bool? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height??appTheme.sizes.buttonHeight,
      child: ElevatedButton(
        child: child,
        onPressed: disabled == true ? null : onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(contrast == true ? appTheme.colors.borderColor : null),
          overlayColor: MaterialStateProperty.all(contrast == true ? appTheme.colors.primaryColor.withOpacity(0.1) : null),
        ),
      ),
    );
  }
}