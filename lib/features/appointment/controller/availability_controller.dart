import 'package:get/get.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/data/repositories/doctor/availability/availability_repository.dart';
import 'package:medicare/features/appointment/models/availability_model.dart';

class AvailabilityController extends GetxController {
  static AvailabilityController get instance => Get.find();

  final isLoading = false.obs;
  final availabilityRepository = Get.put(AvailabilityRepository());

  Future<List<AvailabilityModel>> fetchAvailability(String doctorId) async {
    try {
      isLoading.value = true;
      return await availabilityRepository.fetchAvailability(doctorId);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    } finally {
      isLoading.value = false;
    }
  }
}
