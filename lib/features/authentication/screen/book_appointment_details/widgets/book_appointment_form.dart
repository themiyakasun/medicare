import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/loaders.dart';
import 'package:medicare/features/appointment/controller/appointment_controller.dart';
import 'package:medicare/features/appointment/controller/availability_controller.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/features/personalization/models/doctor_model.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/helpers/helper_functions.dart';

class TBookAppointmentForm extends StatelessWidget {
  const TBookAppointmentForm({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    final concernController = TextEditingController();
    final descriptionController = TextEditingController();

    return Form(
        child: Column(
      spacing: TSizes.xl,
      children: [
        TextFormField(
          controller: concernController,
          decoration: const InputDecoration(labelText: 'Select Concern'),
        ),
        TextFormField(
          controller: descriptionController,
          decoration: const InputDecoration(
            labelText: 'Description',
            alignLabelWithHint: true,
          ),
          maxLines: 5,
          minLines: 3,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              final controller = Get.find<AvailabilityController>();
              final appointmentController = Get.find<AppointmentController>();
              final userController = Get.find<UserController>();

              final selectedDate = controller.selectedDate.value;
              final rawTime = controller.availableTimeSlots.isNotEmpty
                  ? controller.availableTimeSlots.first
                  : null;

              if (rawTime == null) {
                TLoaders.errorSnackBar(
                    title: 'Select Time', message: 'Please choose a time slot');
                return;
              }

              final startTimeString = rawTime.split('-')[0]; // e.g., "09:00"
              final selectedDateString =
                  selectedDate.toIso8601String().split('T')[0];

              final startTime =
                  DateTime.parse('$selectedDateString $startTimeString:00');
              final endTime = startTime.add(Duration(minutes: 30));

              await appointmentController.bookAppointment(
                doctorRef:
                    FirebaseFirestore.instance.doc('Doctors/${doctor.id}'),
                userRef: FirebaseFirestore.instance
                    .doc('Users/${userController.user.value.id}'),
                type: 'physical',
                concern: concernController.text,
                description: descriptionController.text,
                dayOfWeek:
                    THelperFunctions.getWeekdayName(selectedDate.weekday),
                date: selectedDate,
                startTime: startTime,
                endTime: endTime,
                sessionLength: 30,
                sessionPrice: doctor.sessionPrice,
              );
            },
            child: Text('Book Apartment'),
          ),
        )
      ],
    ));
  }
}
