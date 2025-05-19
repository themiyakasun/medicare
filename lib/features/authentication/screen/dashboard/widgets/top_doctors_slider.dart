import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/cards/book_appointment_card.dart';
import 'package:medicare/features/personalization/controllers/doctor_controller.dart';

class TTopDoctorsSlider extends StatelessWidget {
  const TTopDoctorsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DoctorController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: Text('Loading'),
        );
      }
      if (controller.doctors.isEmpty) {
        return const Center(child: Text('No Data Found'));
      }

      return CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.8,
          enlargeCenterPage: false,
          enableInfiniteScroll: false,
          padEnds: false,
          height: 230,
        ),
        items: controller.doctors.map((doctor) {
          return TBookAppointmentCard(
            width: 300,
            doctor: doctor,
          );
        }).toList(),
      );
    });
  }
}
