import 'package:get/get.dart';
import 'package:medicare/features/authentication/screen/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  void nextPage() {
    Get.to(LoginScreen());
  }
}
