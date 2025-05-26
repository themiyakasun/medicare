import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:medicare/data/repositories/appointment/appoinment_repository.dart';
import 'package:medicare/features/appointment/models/appointment_model.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:uuid/uuid.dart';

class AppointmentController extends GetxController {
  static AppointmentController get instance => Get.find();

  final appointmentRepository = Get.put(AppointmentRepository());

  Future<void> bookAppointment({
    required DocumentReference doctorRef,
    required DocumentReference userRef,
    required String type,
    required String concern,
    required String description,
    required String dayOfWeek,
    required DateTime date,
    required DateTime startTime,
    required DateTime endTime,
    required int sessionLength,
    required double sessionPrice,
  }) async {
    try {
      final id = const Uuid().v4();
      final now = DateTime.now();

      final appointment = AppointmentModel(
        id: id,
        doctor: doctorRef,
        user: userRef,
        type: type,
        concern: concern,
        description: description,
        dayOfWeek: dayOfWeek,
        date: date,
        startTime: startTime,
        endTime: endTime,
        sessionLength: sessionLength,
        sessionPrice: sessionPrice,
        status: 'booked',
        bookedAt: now,
        updatedAt: now,
      );

      await appointmentRepository.createAppointment(appointment);

      TLoaders.successSnackBar(
          title: "Success", message: "Appointment booked successfully.");
    } catch (e) {
      TLoaders.errorSnackBar(title: "Booking Failed", message: e.toString());
    }
  }
}
