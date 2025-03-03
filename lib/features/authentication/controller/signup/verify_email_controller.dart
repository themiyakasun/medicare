import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/common/widgets/success_screen.dart';
import 'package:medicare/data/repositories/authentication/authentication_repository.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email sent',
          message: 'Please Check your inbox and verify your email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();

      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();

        Get.off(() => SuccessScreen(
              image: TImages.successAnimation,
              title: 'Your account created',
              subTitle: 'Your account created',
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  Future<void> checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: TImages.success,
            title: 'Your account created',
            subTitle: 'Your account created',
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
