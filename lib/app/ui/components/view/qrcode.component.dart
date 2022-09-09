import 'package:flutter/material.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:get/get.dart';

class LQrCodeView extends StatelessWidget {
  const LQrCodeView({Key? key, required this.address, this.hideTitle = false})
      : super(key: key);
  final String address;
  final bool hideTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: appTheme.sizes.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!hideTitle)
            Text('address'.tr,
                style: TextStyle(
                    fontSize: appTheme.sizes.fontSizeBig,
                    fontWeight: FontWeight.bold)),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
          Center(
            child: QrImage(
              data: address,
              version: QrVersions.auto,
              size: appTheme.sizes.basic * 380.0,
              foregroundColor: appTheme.colors.textBlack,
              backgroundColor: appTheme.colors.pageBackgroundColor,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
          Center(
            child: Text(address, style: Get.textTheme.bodyText1),
          ),
          Padding(padding: EdgeInsets.only(bottom: appTheme.sizes.padding)),
        ],
      ),
    );
  }
}
