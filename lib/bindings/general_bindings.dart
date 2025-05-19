import 'package:get/get.dart';
import 'package:medicare/features/appointment/controller/rating_controller.dart';
import 'package:medicare/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(RatingController());
  }
}
