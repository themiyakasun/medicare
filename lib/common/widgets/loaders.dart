import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/utils/constants/colors.dart';

class TLoaders {
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.neutralsWhite,
        backgroundColor: TColors.darkPurple,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: const Icon(
          Icons.check,
          color: TColors.neutralsWhite,
        ));
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.neutralsWhite,
        backgroundColor: TColors.coolOrange,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.warning,
          color: TColors.neutralsWhite,
        ));
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TColors.neutralsWhite,
        backgroundColor: TColors.warning,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.warning,
          color: TColors.neutralsWhite,
        ));
  }
}
