import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:medicare/features/authentication/screen/book_appointment_info/book_appointment_info.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TBookAppointmentForm extends StatelessWidget {
  const TBookAppointmentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      spacing: TSizes.xl,
      children: [
        TextFormField(
          decoration: const InputDecoration(labelText: 'Select Concern'),
        ),
        TextFormField(
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
            onPressed: () => Get.to(() => BookAppointmentInfoScreen()),
            child: Text('Book Apartment'),
          ),
        )
      ],
    ));
  }
}
