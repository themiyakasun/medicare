import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicare/common/widgets/cards/time_pick_card.dart';

class TTimePickSlider extends StatefulWidget {
  const TTimePickSlider({super.key});

  @override
  State<TTimePickSlider> createState() => _TTimePickSliderState();
}

class _TTimePickSliderState extends State<TTimePickSlider> {
  late String selectedTime;

  final List<String> times = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '1:00 PM',
    '3:00 PM'
  ];

  @override
  void initState() {
    super.initState();
    selectedTime = times[0];
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: times.map((time) {
          return TTimePickCard(
              key: ValueKey(time),
              time: time,
              onTap: () {
                setState(() {
                  selectedTime = time;
                });
              },
              isSelected: selectedTime == time);
        }).toList(),
        options: CarouselOptions(
          viewportFraction: 0.3,
          enlargeCenterPage: false,
          padEnds: false,
          enableInfiniteScroll: false,
          height: 63,
        ));
  }
}
