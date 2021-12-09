import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LDesTipView extends StatelessWidget {
  const LDesTipView({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: appTheme.sizes.basic * 10, right: appTheme.sizes.paddingSmall),
          child: Image.asset("assets/images/page_item_pex.png", width: appTheme.sizes.basic * 30),
        ),
        Expanded(
          child: Text(
            text,
            style: Get.textTheme.bodyText1,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}