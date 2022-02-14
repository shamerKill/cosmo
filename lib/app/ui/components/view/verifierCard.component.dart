import 'package:flutter/material.dart';
import 'package:plug/app/data/models/interface/interface.dart';
import 'package:plug/app/ui/components/view/image.component.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/ui/utils/string.dart';


class LVerifierStatusNode extends StatelessWidget {
  const LVerifierStatusNode({
    Key? key,
    required this.verifier,
  }) : super(key: key);
  final UserVerifierModel verifier;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            right: appTheme.sizes.paddingSmall * 0.5,
            left: appTheme.sizes.paddingSmall * 0.5,
            top: appTheme.sizes.paddingSmall * 0.5,
            bottom: appTheme.sizes.paddingSmall * 0.5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(appTheme.sizes.radius),
              bottomLeft: Radius.circular(appTheme.sizes.radius),
            ),
            color: (
              verifier.status == VerifierStatusEnum.running ? appTheme.colors.primaryColor : 
                (
                  verifier.status == VerifierStatusEnum.invalid ? appTheme.colors.errorColor : appTheme.colors.warningColor
                )
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              Icon(
                IconData(verifier.status == VerifierStatusEnum.running ? 0xe81e : 0xe60c, fontFamily: 'plugIcon'),
                color: appTheme.colors.hightColor,
                size: appTheme.sizes.basic * 20.0,
              ),
              Padding(padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall / 2)),
              Text(StringTool.getVerifierStatus(verifier.status), style: TextStyle(color: appTheme.colors.hightColor, fontSize: appTheme.sizes.fontSizeSmall * 0.8))
            ],
          ),
        ),
        Positioned(
          top: appTheme.sizes.zero,
          left: appTheme.sizes.zero,
          child: Container(
            width: appTheme.sizes.basic * 100,
            height: appTheme.sizes.basic * 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  appTheme.colors.hightColor.withOpacity(0.3),
                  appTheme.colors.hightColor.withOpacity(0),
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }
}


class LVerifierCard extends StatelessWidget {
  const LVerifierCard({
    Key? key,
    required this.verifier,
    this.child,
    this.transparentBg,
  }) : super(key: key);
  final UserVerifierModel verifier;
  final Widget? child;
  final bool? transparentBg;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(
        top: appTheme.sizes.paddingSmall,
        bottom: appTheme.sizes.paddingSmall,
        left: appTheme.sizes.padding,
      ),
      decoration: BoxDecoration(
        color: transparentBg == true ? null : appTheme.colors.pageBackgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(appTheme.sizes.radius)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              LViewImage(
                width: appTheme.sizes.basic * 50.0,
                height: appTheme.sizes.basic * 50.0,
                url: verifier.avatar,
                isRadius: true,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: appTheme.sizes.paddingSmall, right: appTheme.sizes.paddingSmall),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      verifier.nickName,
                      style: TextStyle(color: appTheme.colors.textBlackBig)
                    ),
                  ),
                ),
              ),
              LVerifierStatusNode(verifier: verifier,),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: appTheme.sizes.paddingSmall,
              right: appTheme.sizes.padding,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: appTheme.colors.borderColor, width: appTheme.sizes.basic)),
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: appTheme.sizes.padding,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}