import 'package:cloud_firestore/cloud_firestore.dart';

class RatingModel {
  final String id;
  final String appointment;
  final DocumentReference doctor;
  final double rating;
  final String review;
  DateTime? date;

  RatingModel(
      {required this.id,
      required this.appointment,
      required this.doctor,
      required this.rating,
      required this.review,
      this.date});

  static RatingModel empty() => RatingModel(
      id: '',
      appointment: '',
      doctor: FirebaseFirestore.instance.doc('Doctors/dskadj'),
      rating: 0.0,
      review: '');

  Map<String, dynamic> toJson() {
    return {
      'Appointment': appointment,
      'Doctor': doctor,
      'Rating': rating,
      'Review': review,
      'Date': date = DateTime.now()
    };
  }

  factory RatingModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return RatingModel(
        id: document.id,
        appointment:
            data.containsKey('Appointment') ? data['Appointment'] ?? '' : '',
        doctor: data['Doctor'] as DocumentReference,
        rating: (data['Rating'] as num).toDouble(),
        review: data['Review'] ?? '',
        date: data.containsKey('Date')
            ? data['Date']?.toDate() ?? DateTime.now()
            : DateTime.now(),
      );
    } else {
      return empty();
    }
  }
}
