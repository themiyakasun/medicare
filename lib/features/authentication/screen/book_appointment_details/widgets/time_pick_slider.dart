import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/cards/time_pick_card.dart';
import 'package:medicare/features/appointment/controller/availability_controller.dart';

class TTimePickSlider extends StatefulWidget {
  const TTimePickSlider({super.key});

  @override
  State<TTimePickSlider> createState() => _TTimePickSliderState();
}

class _TTimePickSliderState extends State<TTimePickSlider> {
  late String selectedTime;
  final controller = Get.find<AvailabilityController>();

  @override
  void initState() {
    super.initState();
    selectedTime = ''; // Initially no time is selected
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final times = controller.availableTimeSlots;

      if (times.isEmpty) {
        return const Center(child: Text("No available time slots"));
      }

      // If selectedTime not in updated list, reset it
      if (!times.contains(selectedTime)) {
        selectedTime = times.first;
      }

      return CarouselSlider(
        items: times.map((time) {
          return TTimePickCard(
            key: ValueKey(time),
            time: time,
            onTap: () {
              setState(() {
                selectedTime = time;
              });
              // Optionally: store selected time in controller too
            },
            isSelected: selectedTime == time,
          );
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 0.3,
          enlargeCenterPage: false,
          padEnds: false,
          enableInfiniteScroll: false,
          height: 63,
        ),
      );
    });
  }
}
