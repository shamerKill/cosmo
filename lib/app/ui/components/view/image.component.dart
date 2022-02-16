import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plug/app/ui/theme/theme.dart';

class LViewImage extends GetView<LViewImageController> {
  const LViewImage({
    Key? key,
    this.url,
    this.bgColor,
    required this.width,
    required this.height,
    this.isRadius = false,
  }) : super(key: key);
  final String? url;
  final Color? bgColor;
  final double width;
  final double height;
  final bool isRadius;

  @override
  Widget build(BuildContext context) {
    LViewImageController controller = Get.put(LViewImageController());

    if (url == null || url == '') {
      return Container(
        width: width,
        height: height,
        color: bgColor??appTheme.colors.transparent,
      );
    }
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url!,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: isRadius ? BorderRadius.all(Radius.circular(width)) : null,
          image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: appTheme.colors.borderColor,
          borderRadius: isRadius ? BorderRadius.all(Radius.circular(width)) : null,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: appTheme.colors.borderColor,
          borderRadius: isRadius ? BorderRadius.all(Radius.circular(width)) : null,
        ),
      ),
    );
  }
}


class LViewImageState {
}

class LViewImageController extends GetxController {
  LViewImageController();
  LViewImageState state = LViewImageState();
}