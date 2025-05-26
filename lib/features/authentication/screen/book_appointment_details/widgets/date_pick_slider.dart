import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/cards/date_pick_card.dart';
import 'package:medicare/features/appointment/controller/availability_controller.dart';
import 'package:medicare/utils/helpers/helper_functions.dart';

class TDatePickSlider extends StatefulWidget {
  const TDatePickSlider({super.key, required this.doctorId});
  final String doctorId;

  @override
  State<TDatePickSlider> createState() => _TDatePickSliderState();
}

class _TDatePickSliderState extends State<TDatePickSlider> {
  late DateTime selectedDate;
  final controller = Get.find<AvailabilityController>();
  List<DateTime> availableDates = [];

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    _loadAvailableDates();
  }

  Future<void> _loadAvailableDates() async {
    await controller.fetchAvailability(widget.doctorId);

    final availableDays = controller.getAvailableDaysOfWeek();

    final today = DateTime.now();
    final remaining = 6;

    final weekDates = List.generate(
      remaining + 1,
      (i) => today.add(Duration(days: i)),
    ).where((date) {
      final weekdayName = THelperFunctions.getWeekdayName(date.weekday);
      return availableDays.contains(weekdayName);
    }).toList();

    setState(() {
      availableDates = weekDates;
      selectedDate =
          availableDates.isNotEmpty ? availableDates.first : DateTime.now();
      if (availableDates.isNotEmpty) {
        controller.onDateSelected(selectedDate, widget.doctorId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: availableDates.map((date) {
        return TDatePickCard(
          key: ValueKey(date),
          date: date,
          isSelected: DateUtils.isSameDay(date, selectedDate),
          onTap: () {
            setState(() {
              selectedDate = date;
            });
            controller.onDateSelected(date, widget.doctorId);
          },
        );
      }).toList(),
      options: CarouselOptions(
        viewportFraction: 0.2,
        enlargeCenterPage: false,
        padEnds: false,
        enableInfiniteScroll: false,
        height: 94,
      ),
    );
  }
}
