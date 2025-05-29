import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/data/repositories/authentication/authentication_repository.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/utils/constants/enums.dart';
import 'package:medicare/utils/helpers/network_manager.dart';
import 'package:medicare/utils/popups/full_screen_loader.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class LoginController extends GetxController {
  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  // @override
  // void onInit() {
  //   email.text = localStorage.read('REMEMBER_ME_EMAIL');
  //   password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  //   super.onInit();
  // }

  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.processing);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      if (userCredential.user != null) {
        await userController.fetchUserRecord();
      }

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance
          .screenRedirect(userController.user.value.role);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.processing);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials, AppRole.patient);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance
          .screenRedirect(userController.user.value.role);
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
