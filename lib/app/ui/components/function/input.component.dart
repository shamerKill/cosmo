
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
    this.visibilityPass,
    this.padding,
    this.passOnPress,
    this.onChanged,
    this.onFocus,
    this.keyboardType,
    this.maxLength,
    this.focusNode,
    this.textAlign,
    this.hintText,
    this.hidBorder = false,
    this.disabled = false,
    this.maxLines = 1,
    this.obscureText = false,
    this.onlyNumber = false,
    this.onlyInt = false,
  }): super(key: key);
  
  final int? maxLines;
  final bool? obscureText;
  final TextEditingController? textController;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final bool? visibilityPass;
  final EdgeInsetsGeometry? padding;
  final TextInputType? keyboardType;
  final bool? disabled;
  final bool? onlyNumber;
  final bool? onlyInt;
  final int? maxLength;
  final bool? hidBorder;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function(bool)? onFocus;
  final void Function()? passOnPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: appTheme.sizes.inputHeight,
      child: TextField(
        controller: textController,
        maxLines: maxLines,
        obscureText: !(visibilityPass??true),
        cursorColor: appTheme.colors.primaryColor,
        onChanged: onChanged,
        style: TextStyle(fontSize: appTheme.sizes.inputFontSize, color: appTheme.colors.textBlack),
        keyboardType: keyboardType??(onlyNumber == true ? TextInputType.number : null),
        enabled: disabled == true ? false : true,
        inputFormatters: onlyNumber == true ? [
          FilteringTextInputFormatter.allow(RegExp(onlyInt == true ? "[0-9]" : "[0-9]+.?[0-9]*"))
        ] : null,
        maxLength: maxLength,
        textAlign: textAlign??TextAlign.start,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
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