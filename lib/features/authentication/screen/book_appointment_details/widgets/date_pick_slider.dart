import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/cards/date_pick_card.dart';

class TDatePickSlider extends StatefulWidget {
  const TDatePickSlider({super.key});

  @override
  State<TDatePickSlider> createState() => _TDatePickSliderState();
}

class _TDatePickSliderState extends State<TDatePickSlider> {
  late List<DateTime> dates;
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    dates = _getDatesToEndOfWeek();
    selectedDate = DateTime.now();
  }

  List<DateTime> _getDatesToEndOfWeek() {
    final today = DateTime.now();
    final remaining = DateTime.saturday - today.weekday;
    return List.generate(remaining + 1, (i) => today.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: dates.map((date) {
        return TDatePickCard(
          key: ValueKey(date),
          date: date,
          isSelected: DateUtils.isSameDay(date, selectedDate),
          onTap: () {
            setState(() {
              selectedDate = date;
            });
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
