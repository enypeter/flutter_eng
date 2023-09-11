import 'package:flutter_engr/core/color.dart';
import 'package:get/get.dart';


class CustomSnack {
  static noticeSnackBar({String? title, String? message}) async {
    return Get.snackbar(title ?? '', message ?? '',
        snackStyle: SnackStyle.FLOATING,
        borderRadius: 3.0,
        duration: const Duration(seconds: 4), onTap: (v) {
          Get.back();
        },
        backgroundColor: AppColor.white,
        borderColor: AppColor.blue,
        borderWidth: 0.7,
        colorText: AppColor.blue,
        snackPosition: SnackPosition.TOP);
  }

  static showErrorSnackBar(String title,  message) async {
    return Get.snackbar(title ?? '', message ?? '',
        snackStyle: SnackStyle.FLOATING,
        borderRadius: 3.0,
        duration: const Duration(seconds:6), onTap: (v) {
          Get.back();
        },
        borderColor: AppColor.red,
        borderWidth: 0.7,
        backgroundColor: AppColor.white,
        colorText: AppColor.red ,
        snackPosition: SnackPosition.TOP);
  }


  static showSuccessSnackBar(String title,  message) async {
    return Get.snackbar(title ?? '', message ?? '',
        snackStyle: SnackStyle.FLOATING,
        borderRadius: 3.0,
        duration: const Duration(seconds:6), onTap: (v) {
          Get.back();
        },
        borderColor: AppColor.green,
        borderWidth: 0.7,
        backgroundColor: AppColor.white,
        colorText: AppColor.green ,
        snackPosition: SnackPosition.TOP);
  }
}
