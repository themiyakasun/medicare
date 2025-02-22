import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/animation_loader.dart';
import 'package:medicare/utils/constants/colors.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Material(
          // Wrap with Material to handle Scaffold properties
          color: TColors.neutralsWhite,
          child: Center(
            // Center the content
            child: SingleChildScrollView(
              // Make the content scrollable if it overflows
              child: Container(
                padding: const EdgeInsets.all(20), // Add some padding
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // Important: Minimize Column height
                  children: [
                    // Remove fixed SizedBox - let the content determine spacing
                    TAnimationLoaderWidget(text: text, animation: animation),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    if (Get.isDialogOpen == true) {
      // Check if a dialog is open before trying to close it.
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}
