import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/data/repositories/authentication/authentication_repository.dart';
import 'package:medicare/data/repositories/user/user_repository.dart';
import 'package:medicare/features/authentication/screen/signup/verify_email.dart';
import 'package:medicare/features/personalization/models/user_model.dart';
import 'package:medicare/utils/helpers/network_manager.dart';
import 'package:medicare/utils/popups/full_screen_loader.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...', TImages.processing);

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailandPassword(
              email.text.trim(), password.text.trim());

      final newUser = UserModel(
          id: userCredential.user!.uid,
          name: name.text.trim(),
          email: email.text.trim(),
          phoneNumber: '',
          profilePicture: '');

      final userRepository = Get.put(UserRepository());

      await userRepository.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
