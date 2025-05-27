import 'package:get/get.dart';
import 'package:medicare/features/appointment/controller/appointment_controller.dart';
import 'package:medicare/features/appointment/controller/availability_controller.dart';
import 'package:medicare/features/appointment/controller/rating_controller.dart';
import 'package:medicare/utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.lazyPut(() => RatingController());
    Get.put(AvailabilityController());
    Get.lazyPut(() => AppointmentController());
  }
}
