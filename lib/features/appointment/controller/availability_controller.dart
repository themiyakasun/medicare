import 'package:get/get.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/data/repositories/doctor/availability/availability_repository.dart';
import 'package:medicare/features/appointment/models/availability_model.dart';

class AvailabilityController extends GetxController {
  static AvailabilityController get instance => Get.find();

  final isLoading = false.obs;
  final availabilityRepository = Get.put(AvailabilityRepository());
  final availableTimeSlots = <String>[].obs;
  final selectedDate = DateTime.now().obs;
  final RxList<AvailabilityModel> availabilities = <AvailabilityModel>[].obs;

  void onDateSelected(DateTime date, String doctorId) async {
    selectedDate.value = date;
    await fetchTimeSlotsForDate(doctorId, date);
  }

  Future<void> fetchAvailability(String doctorId) async {
    try {
      isLoading.value = true;
      final data = await availabilityRepository.fetchAvailability(doctorId);
      availabilities.assignAll(data);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<String> getAvailableDaysOfWeek() {
    final days = availabilities.map((a) => a.dayOfWeek.trim()).toSet().toList();
    return days;
  }

  Future<void> fetchTimeSlotsForDate(String doctorId, DateTime date) async {
    try {
      isLoading.value = true;
      final times =
          await availabilityRepository.fetchTimeSlotsByDate(doctorId, date);
      availableTimeSlots.assignAll(times);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
