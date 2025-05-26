import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/appointment/controller/appointment_controller.dart';
import 'package:medicare/features/authentication/screen/book_appointment_info/book_appointment_info.dart';
import 'package:medicare/features/personalization/models/doctor_model.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TBookAppointmentForm extends StatelessWidget {
  const TBookAppointmentForm({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    final appointmentController = Get.find<AppointmentController>();

    return Form(
        child: Column(
      spacing: TSizes.xl,
      children: [
        TextFormField(
          controller: appointmentController.concern,
          decoration: const InputDecoration(labelText: 'Select Concern'),
        ),
        TextFormField(
          controller: appointmentController.description,
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
            onPressed: () => Get.to(BookAppointmentInfoScreen(doctor: doctor)),
            child: Text('Book Apartment'),
          ),
        )
      ],
    ));
  }
}
