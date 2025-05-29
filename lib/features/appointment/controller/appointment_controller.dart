import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/success_screen.dart';
import 'package:medicare/data/repositories/appointment/appoinment_repository.dart';
import 'package:medicare/data/services/stripe_service.dart';
import 'package:medicare/features/appointment/controller/availability_controller.dart';
import 'package:medicare/features/appointment/models/appointment_model.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/features/patient/screens/appointments/appointments.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/features/personalization/models/doctor_model.dart';
import 'package:medicare/utils/constants/enums.dart';
import 'package:medicare/utils/helpers/helper_functions.dart';
import 'package:medicare/utils/popups/full_screen_loader.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';
import 'package:uuid/uuid.dart';

class AppointmentController extends GetxController {
  static AppointmentController get instance => Get.find();

  final appointmentRepository = Get.put(AppointmentRepository());
  final UserController userController = Get.find<UserController>();
  final concern = TextEditingController();
  final description = TextEditingController();

  final RxBool isLoading = true.obs;
  final RxList<AppointmentModel> patientAppointments = <AppointmentModel>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   if (userController.user.value.id.isNotEmpty &&
  //       userController.user.value.role == AppRole.patient) {
  //     fetchPatientAppointments();
  //   } else if (userController.user.value.id.isEmpty) {
  //     ever(userController.user, (callback) {
  //       if (userController.user.value.id.isNotEmpty &&
  //           userController.user.value.role == AppRole.patient) {
  //         fetchPatientAppointments();
  //       }
  //     });
  //   }
  // }

  Future<void> bookAppointment(
      {required DoctorModel doctor, required String type}) async {
    try {
      final availabilityController = Get.find<AvailabilityController>();
      final userController = Get.find<UserController>();

      final selectedDate = availabilityController.selectedDate.value;
      final rawTime = availabilityController.availableTimeSlots.isNotEmpty
          ? availabilityController.availableTimeSlots.first
          : null;

      if (rawTime == null) {
        TLoaders.errorSnackBar(
          title: 'Select Time',
          message: 'Please choose a time slot',
        );
        return;
      }

      if (concern.text == '' || description.text == '') {
        TLoaders.errorSnackBar(
            title: 'Emtpy Fields',
            message: 'Concern and Description must not empty!');
        return;
      }

      final paymentSuccess =
          await StripeService.instance.makePayment(doctor.sessionPrice);

      if (!paymentSuccess) {
        TLoaders.errorSnackBar(
            title: "Booking Failed", message: 'Payement not success');
        return;
      }

      final startTimeString = rawTime.split('-')[0];
      final selectedDateString = selectedDate.toIso8601String().split('T')[0];
      final startTime =
          DateTime.parse('$selectedDateString $startTimeString:00');
      final endTime = startTime.add(Duration(minutes: 30));

      final id = const Uuid().v4();
      final now = DateTime.now();

      final appointment = AppointmentModel(
        id: id,
        doctor: FirebaseFirestore.instance.doc('Doctors/${doctor.id}'),
        user: FirebaseFirestore.instance
            .doc('Users/${userController.user.value.id}'),
        type: type,
        concern: concern.text,
        description: description.text,
        dayOfWeek: THelperFunctions.getWeekdayName(selectedDate.weekday),
        date: selectedDate,
        startTime: startTime,
        endTime: endTime,
        sessionLength: 30,
        sessionPrice: doctor.sessionPrice,
        status: 'booked',
        bookedAt: now,
        updatedAt: now,
      );

      await appointmentRepository.createAppointment(appointment);

      TLoaders.successSnackBar(
          title: "Success", message: "Appointment booked successfully.");

      Get.off(() => SuccessScreen(
            image: TImages.successAnimation,
            title: 'Your appointment booked successfully',
            subTitle: 'Make sure to attend on $selectedDate',
            onPressed: () => PatientAppointmentsScreen(),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: "Booking Failed", message: e.toString());
    }
  }

  Future<void> fetchPatientAppointments() async {
    try {
      isLoading.value = true;
      if (userController.user.value.id.isEmpty) {
        TLoaders.warningSnackBar(
            title: 'User Not Found',
            message: 'Cannot fetch appointments without user login.');
        isLoading.value = false;
        return;
      }
      if (userController.user.value.role != AppRole.patient) {
        TLoaders.errorSnackBar(
            title: 'Not a Patient', message: 'This section is for patients.');
        isLoading.value = false;
        return;
      }

      final appointments = await appointmentRepository
          .fetchAppointmentsForPatient(userController.user.value.id);
      patientAppointments.assignAll(appointments);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!',
          message: 'Failed to fetch appointments: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> cancelAppointment(String appointmentId) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Cancelling your appointment....', TImages.processing);

      await appointmentRepository.deleteAppointment(appointmentId);
      patientAppointments.removeWhere((app) => app.id == appointmentId);
      TLoaders.successSnackBar(
          title: 'Success', message: 'Appointment cancelled successfully.');
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!',
          message: 'Failed to cancel appointment: ${e.toString()}');
    }
  }

  Future<AppointmentModel?> getAppointmentDetails(String appointmentId) async {
    try {
      isLoading.value = true;
      final appointment =
          await appointmentRepository.fetchAppointmentById(appointmentId);
      if (appointment == null) {
        TLoaders.errorSnackBar(
            title: 'Not Found',
            message: 'Appointment details could not be retrieved.');
      }
      return appointment;
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Snap!',
          message: 'Failed to fetch appointment details: ${e.toString()}');
      return null;
    } finally {
      isLoading.value = false;
    }
  }
}
