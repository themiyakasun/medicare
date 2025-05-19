import 'package:cloud_firestore/cloud_firestore.dart';

class UnavailabilityModel {
  final String id;
  final DocumentReference doctor;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final String reason;

  UnavailabilityModel(
      {required this.id,
      required this.doctor,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.reason});

  Map<String, dynamic> toJson() {
    return {
      'Doctor': doctor,
      'Date': date,
      'StartTime': startTime,
      'EndTime': endTime,
      'Reason': reason
    };
  }

  factory UnavailabilityModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return UnavailabilityModel(
        id: document.id,
        doctor: data['Doctor'],
        date: data['Date'],
        startTime: data['StartTime'],
        endTime: data['EndTime'],
        reason: data['Reason']);
  }
}
