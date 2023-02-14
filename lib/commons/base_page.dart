import 'package:entrance_test/commons/configs/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BasePage<T extends BaseController> extends GetView<T> {
  const BasePage({Key? key}) : super(key: key);

  onInit(BuildContext context) {
    controller.onError = (errorMessage) {
      Get.snackbar(
        '',
        errorMessage,
        duration: const Duration(seconds: 4),
        animationDuration: const Duration(milliseconds: 800),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        titleText: const Text(
          '',
          style: TextStyle(fontSize: 1),
        ),
        messageText: Center(
          child: Text(
            errorMessage,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: AppColors.errorColor,
      );
    };

    controller.onSuccess = (message) {
      Get.snackbar(
        '',
        message,
        duration: const Duration(seconds: 4),
        animationDuration: const Duration(milliseconds: 800),
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        titleText: const Text(
          '',
          style: TextStyle(fontSize: 1),
        ),
        messageText: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        backgroundColor: AppColors.primary,
      );
    };

    controller.onLoading = (isLoading) {
      if (isLoading) {
        EasyLoading.show();
      } else {
        EasyLoading.dismiss();
      }
    };
  }
}
