import 'dart:convert';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qr_reader/flutter_qr_reader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:plug/app/routes/routes.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/utils/string.dart';

class WalletQrScannerPageState {
  // 是否已经申请过
  final Rx<bool> _isApplied = false.obs;
  bool get isApplied => _isApplied.value;
  set isApplied (bool value) => _isApplied.value = value;
  // 是否已经获取到权限
  final Rx<bool> _isGetPermission = false.obs;
  bool get isGetPermission => _isGetPermission.value;
  set isGetPermission (bool value) => _isGetPermission.value = value;
  // 是否已经扫描到二维码
  final Rx<bool> _isScanned = false.obs;
  bool get isScanned => _isScanned.value;
  set isScanned (bool value) => _isScanned.value = value;
  // 是否开启了闪光灯
  final Rx<bool> _isOpenedFlashLight = false.obs;
  bool get isOpenedFlashLight => _isOpenedFlashLight.value;
  set isOpenedFlashLight (bool value) => _isOpenedFlashLight.value = value;
  // 判断是否需要带参数返回
  final Rx<bool> _isGetResultBack = false.obs;
  bool get isGetResultBack => _isGetResultBack.value;
  set isGetResultBack (bool value) => _isGetResultBack.value = value;
  // 非官方码
  final RxList<String> warningQrCode = RxList();
}

class WalletQrScannerPageController extends GetxController {
  WalletQrScannerPageController();
  WalletQrScannerPageState state = WalletQrScannerPageState();
  // 控制器
  QrReaderViewController? scanController;
  
  @override
  onReady() async {
    String? needResult = Get.parameters['result'];
    if (needResult != null) state.isGetResultBack = true;
    var permissions = await _permission();
    if (permissions != true) return Get.back();
    state.isGetPermission = true;
  }

  // 检测权限
  Future<bool> _permission() async {
    if (state.isApplied) return false;
    state.isApplied = true;
    var status = await Permission.camera.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      status = await Permission.camera.request();
    }
    if (status.isRestricted) {
      var type = await LBottomSheet.promptBottomSheet(
        title: '您拒绝了授权应用照相机权限'.tr,
        message: Text('请前往设置开启权限?'.tr),
      );
      if (type == true) openAppSettings();
      state.isApplied = true;
      return false;
    }
    if (!status.isGranted) {
      LToast.warning('ErrorWithPermissionCamera'.tr);
      return false;
    }
    state.isApplied = false;
    return true;
  }
  // 开始监听扫码
  startScan()  {
    if (scanController == null) return;
    state.isScanned = false;
    scanController!.startCamera((String result, _) async {
      if (state.isScanned) return;
      if (result == '') return;
      if (state.warningQrCode.firstWhereOrNull((ele) => ele == result) != null) return;
      state.isScanned = true;
      scanController?.stopCamera();
      if (StringTool.checkNetAddress(result) && !state.isGetResultBack) {
        // 网络
        var type = await LBottomSheet.promptBottomSheet(
          title: '提示'.tr,
          message: Text('扫描到网址，是否前往？'.tr),
        );
        if (type == true) {
          return Get.offAndToNamed(PlugRoutesNames.dappWebview, parameters: { 'link': base64.encode(utf8.encode(result)) });
        }
      } else if (StringTool.checkCosmoLink(result)) {
        var data = StringTool.formatCosmoLink(result);
        if (state.isGetResultBack) return Get.back(result: data);
        if (_checkResultJson(data)) {
          return;
        } else {
          await LToast.warning('非官方二维码'.tr);
          state.warningQrCode.add(result);
          return startScan();
        }
      } else if (StringTool.checkChainAddress(result) && !state.isGetResultBack) {
        // 账户地址
        var type = await LBottomSheet.promptBottomSheet(
          title: '提示'.tr,
          message: Text('扫描到Plug Chain地址，是否复制到粘贴板？'.tr),
        );
        if (type == true) {
          onCopyAddress(result);
        }
      } else if (state.isGetResultBack) {
        return Get.back(result: result);
      }
      startScan();
    });
  }
  // 打开图片
  Future scanImage() async {
    try {
      var status = await Permission.photos.status;
      if (status.isDenied || status.isPermanentlyDenied) {
        status = await Permission.photos.request();
      }
      if (!(status.isGranted || status.isLimited)) return LToast.warning('您拒绝了相册权限'.tr);
      state.isGetPermission = false;
      scanController?.stopCamera();
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        state.isGetPermission = true;
        return;
      }
      final result = await FlutterQrReader.imgScan(image.path);
      Get.back(result: result);
    } catch (err) {
      state.isGetPermission = true;
    }
  }
  // 切换闪光灯
  Future flashlight() async {
    if (scanController == null) return;
    final lightType = await scanController?.setFlashlight();
    state.isOpenedFlashLight = lightType??false;
  }
  // 复制到粘贴板
  onCopyAddress(String str) {
    FlutterClipboard.copy(str).then(( value ) => LToast.success('SuccessWithCopy'.tr));
  }
  // 判断扫码json，跳转不同链接
  _checkResultJson(Map<String, dynamic> result) {
    if (result['address'] != null && result['token'] != null) {
      Get.offAndToNamed(
        PlugRoutesNames.walletTokenSend(result['token']),
        parameters: { 'address': result['address'] },
      );
      return true;
    }
    return false;
  }
}