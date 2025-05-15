import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medicare/features/authentication/screen/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  void nextPage() {
    final storage = GetStorage();
    storage.write('IsFirstTime', false);
    Get.to(LoginScreen());
  }
}
