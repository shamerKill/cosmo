import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as screen;

import 'package:plug/app/ui/pages/start/start.controller.dart';

class StartPage extends GetView<StartPageController> {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoWidth = 700.0.sp;
    StartPageState state = controller.state;
    double screenWidth = ScreenUtil.getScreenW(context);
    double screenHeight = ScreenUtil.getScreenH(context);

    return Scaffold(
      backgroundColor: const Color(0xff05111c),
      body: Stack(
        children: [
          Positioned(
            width: screenWidth,
            height: screenHeight,
            top: 0.0,
            left: 0.0,
            child: Obx(() => Opacity(
              opacity: state.bgOpacity,
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/start_bg.jpg'),
              ),
            )),
          ),
          Obx(() => Positioned(
            top: (screenHeight - logoWidth.sp) / 2 - state.logoBottomPadding.sp,
            left: (screenWidth - logoWidth.sp) / 2,
            child: SizedBox(
              key: const Key('startLogoImg'),
              width: logoWidth.sp,
              child: Opacity(
                opacity: state.bgOpacity,
                child: const Image(
                  image: AssetImage('assets/images/start_logo.png'),
                  fit: BoxFit.cover
                ),
              ),
            ),
          )),
          Positioned(
            bottom: 50,
            child: Obx(() => Opacity(
              opacity: state.bgOpacity,
              child: SizedBox(
                width: screenWidth,
                child: Center(
                  child: Column(
                    children: const [
                      Text("cosmo wallet", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("L\r\r\r\r\rI\r\r\r\r\rN\r\r\r\r\rK", style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                    ]
                  ),
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }
}