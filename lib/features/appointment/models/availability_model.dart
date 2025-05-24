import 'package:cloud_firestore/cloud_firestore.dart';

class AvailabilityModel {
  final String id;
  final DocumentReference doctor;
  final String dayOfWeek;
  final List<String> timeSlots;
  final DateTime startTime;
  final DateTime endTime;
  final int sessionLength;

  AvailabilityModel(
      {required this.id,
      required this.doctor,
      required this.dayOfWeek,
      required this.timeSlots,
      required this.startTime,
      required this.endTime,
      required this.sessionLength});

  Map<String, dynamic> toJson() {
    return {
      'Doctor': doctor,
      'DayOfWeek': dayOfWeek,
      'TimeSlots': timeSlots,
      'StartTime': startTime,
      'EndTime': endTime,
      'SessionLength': sessionLength
    };
  }

  factory AvailabilityModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return AvailabilityModel(
        id: document.id,
        doctor: data['Doctor'] as DocumentReference,
        dayOfWeek: data['DayOfWeek'],
        timeSlots: List<String>.from(data['TimeSlots']),
        startTime: data['StartTime'].toDate() ?? DateTime.now(),
        endTime: data['EndTime'].toDate() ?? DateTime.now(),
        sessionLength: data['SessionLength'] ?? 0);
  }
}
