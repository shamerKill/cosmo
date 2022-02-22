
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LInput extends StatelessWidget {
  const LInput({
    Key? key,
    this.textController,
    this.labelText,
    this.suffixIcon,
    this.suffixText,
    this.suffix,
    this.prefixIcon,
    this.visibilityPass,
    this.padding,
    this.passOnPress,
    this.onChanged,
    this.onFocus,
    this.onSubmitted,
    this.keyboardType,
    this.maxLength,
    this.focusNode,
    this.autofocus = false,
    this.textAlign,
    this.hintText,
    this.inputHeight,
    this.textInputAction,
    this.fillColor,
    this.radiusCircular,
    this.hidBorder = false,
    this.disabled = false,
    this.maxLines = 1,
    this.obscureText = false,
    this.onlyNumber = false,
    this.onlyInt = false,
  }): super(key: key);
  
  final double? inputHeight;
  final int? maxLines;
  final bool? obscureText;
  final TextEditingController? textController;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final String? suffixText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool? visibilityPass;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final bool? disabled;
  final bool? onlyNumber;
  final bool? onlyInt;
  final int? maxLength;
  final bool? hidBorder;
  final bool? radiusCircular;
  final bool autofocus;
  final Color? fillColor;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function(bool)? onFocus;
  final void Function()? passOnPress;

  @override
  Widget build(BuildContext context) {
    double _height = inputHeight??appTheme.sizes.inputHeight;
    return SizedBox(
      height: _height,
      child: TextField(
        focusNode: focusNode,
        controller: textController,
        maxLines: maxLines,
        obscureText: !(visibilityPass??true),
        cursorColor: appTheme.colors.primaryColor,
        onChanged: onChanged,
        style: TextStyle(fontSize: appTheme.sizes.inputFontSize, color: appTheme.colors.textBlack, height: maxLines == 1 ? null : 1.8),
        keyboardType: keyboardType??(onlyNumber == true ? TextInputType.number : null),
        enabled: disabled == true ? false : true,
        inputFormatters: onlyNumber == true ? [
          FilteringTextInputFormatter.allow(RegExp(onlyInt == true ? "[0-9]" : r"[0-9]+\.?[0-9]*"))
        ] : null,
        maxLength: maxLength,
        textAlign: textAlign??TextAlign.start,
        textInputAction: textInputAction??TextInputAction.next,
        onSubmitted: onSubmitted,
        autofocus: autofocus,
        decoration: InputDecoration(
          fillColor: fillColor,
          contentPadding: EdgeInsets.only(
            top: appTheme.sizes.paddingSmall,
            bottom: appTheme.sizes.paddingSmall,
            left: appTheme.sizes.paddingSmall,
            right: appTheme.sizes.paddingSmall,
          ),
          labelText: labelText,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixText: suffixText,
          suffix: suffix,
          prefixIcon: prefixIcon,
          border: hidBorder == true ? (InputBorder.none) : ((radiusCircular == true) ? (Get.theme.inputDecorationTheme.border as OutlineInputBorder?)?.copyWith(borderRadius: BorderRadius.circular(_height)) : null),
          enabledBorder: hidBorder == true ? (InputBorder.none) : ((radiusCircular == true) ? (Get.theme.inputDecorationTheme.enabledBorder as OutlineInputBorder?)?.copyWith(borderRadius: BorderRadius.circular(_height)) : null),
          focusedBorder: hidBorder == true ? (InputBorder.none) : ((radiusCircular == true) ? (Get.theme.inputDecorationTheme.focusedBorder as OutlineInputBorder?)?.copyWith(borderRadius: BorderRadius.circular(_height)) : null),
          suffixIcon: visibilityPass == null ? suffixIcon : IconButton(
            splashRadius: appTheme.sizes.inputIconSize,
            icon: Icon(
              visibilityPass as bool ? Icons.visibility_outlined : Icons.visibility_off_outlined,
              size: appTheme.sizes.inputIconSize,
              color: appTheme.colors.textGray,
            ),
            onPressed: passOnPress,
          ),
        ),
      ),
    );
  }
}