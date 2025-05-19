import 'package:get/get.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/data/repositories/doctor/doctor_repository.dart';
import 'package:medicare/features/personalization/models/doctor_model.dart';

class DoctorController extends GetxController {
  static DoctorController get instance => Get.find();

  final isLoading = false.obs;
  final doctorRepository = Get.put(DoctorRepository());
  RxList<DoctorModel> doctors = <DoctorModel>[].obs;

  @override
  void onInit() {
    fetchDoctors();
    super.onInit();
  }

  void fetchDoctors() async {
    try {
      isLoading.value = true;
      final result = await doctorRepository.fetchDoctors();
      doctors.assignAll(result);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
