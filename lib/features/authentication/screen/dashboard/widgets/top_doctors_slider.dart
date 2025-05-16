import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/cards/book_appointment_card.dart';

class TTopDoctorsSlider extends StatelessWidget {
  const TTopDoctorsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: TBookAppointmentCard(
              width: 300,
            ),
          )
        ],
        options: CarouselOptions(
            viewportFraction: 0.8,
            enlargeCenterPage: false,
            padEnds: false,
            height: 230));
  }
}
