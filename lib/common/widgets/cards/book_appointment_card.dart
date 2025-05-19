import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/doctor_details.dart';
import 'package:medicare/features/personalization/models/doctor_model.dart';

class TBookAppointmentCard extends StatelessWidget {
  const TBookAppointmentCard(
      {super.key, this.width, this.showBooking = true, this.doctor});

  final double? width;
  final bool showBooking;
  final DoctorModel? doctor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.08),
            offset: Offset(0, 3),
            blurRadius: 11,
          ),
        ],
      ),
      child: Padding(
          padding: const EdgeInsets.all(12),
          child: TDoctorsDetails(
              userId: doctor?.user.id ?? '',
              speciality: doctor?.speciality ?? '',
              showBooking: showBooking,
              doctorId: doctor?.id ?? '')),
    );
  }
}
