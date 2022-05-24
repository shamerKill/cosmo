import 'dart:io';
import 'package:dio/dio.dart' as dio;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plug/app/ui/components/function/bottomSheet.component.dart';
import 'package:plug/app/ui/components/function/loading.component.dart';
import 'package:plug/app/ui/components/function/toast.component.dart';
import 'package:plug/app/ui/theme/theme.dart';
import 'package:plug/app/data/services/net.services.dart';
import 'package:plug/app/ui/utils/string.dart';

class UserProblemsPageState {
  // 截图地址
  final RxList<String> picList = RxList();
}

class UserProblemsPageController extends GetxController {
  UserProblemsPageController();
  UserProblemsPageState state = UserProblemsPageState();
  // 标题
  TextEditingController emailController = TextEditingController();
  // 描述
  TextEditingController descController = TextEditingController();

  // 提交问题反馈
  onSubmitProblems() async {
    Get.focusScope?.unfocus();
    if (!StringTool.checkEmail(emailController.text) || descController.text == '' || state.picList.isEmpty) return LToast.warning('请检查数据'.tr);
    var type = await LBottomSheet.promptBottomSheet(title: '是否需要提交问题?'.tr);
    if (type != true) return;
    LLoading.showLoading();
    dio.FormData _formData = dio.FormData.fromMap({
      'email': emailController.text,
      'content': descController.text,
      'images': await dio.MultipartFile.fromFile(state.picList[0]),
    });
    var result = await httpToolServer.postProblems(_formData);
    LLoading.dismiss();
    if (result.status != 0) {
      LToast.warning(result.message);
    }
    LToast.success('反馈成功'.tr);
    emailController.text = '';
    descController.text = '';
    state.picList.clear();
  }
  // 选择图片
  onSelectPicture() {
    LBottomSheet.baseBottomSheet(
      showClose: false,
      child: LBottomSheet.selectSheetChild(
        labelList: ['相册选取'.tr, '相机拍摄'.tr],
        successCallBack: _onSelectPicType
      ),
    );
  }
  // 选择图片类型
  _onSelectPicType(int type) async {
    Get.back();
    // 相机
    if (type == 0) {
      try {
        final ImagePicker _picker = ImagePicker();
        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
        if (image == null) return;
        if (state.picList.contains(image.path)) return;
        state.picList.add(image.path);
      } catch(e) {}
    // 相册
    } else if (type == 1) {
      try {
        final ImagePicker _picker = ImagePicker();
        final XFile? image = await _picker.pickImage(source: ImageSource.camera);
        if (image == null) return;
        if (state.picList.contains(image.path)) return;
        state.picList.add(image.path);
      } catch(e) {}
    }
  }
  // 长按删除图片
  onLongDelete(String path) async {
    bool? result = await LBottomSheet.promptBottomSheet(
      title: '是否移除当前图片?',
    );
    if (result != true) return;
    state.picList.remove(path);
  }
  // 展示图片
  onShowPic(String path) {
    Get.bottomSheet(
      InkWell(
        onTap: Get.back,
        child: Container(
          height: appTheme.sizes.infinity,
          width: appTheme.sizes.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: appTheme.sizes.paddingSmall,
            vertical: appTheme.sizes.paddingBig * 2,
          ),
          child: Image.file(
            File(path),
            fit: BoxFit.contain
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}