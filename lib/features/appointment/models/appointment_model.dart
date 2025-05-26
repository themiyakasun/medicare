import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModel {
  final String id;
  final DocumentReference doctor;
  final DocumentReference user;
  final String type;
  final String concern;
  final String description;
  final String dayOfWeek;
  final DateTime date;
  final DateTime startTime;
  final DateTime endTime;
  final int sessionLength;
  final double sessionPrice;
  final String status;
  final DateTime bookedAt;
  final DateTime updatedAt;

  AppointmentModel({
    required this.id,
    required this.doctor,
    required this.user,
    required this.type,
    required this.concern,
    required this.description,
    required this.dayOfWeek,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.sessionLength,
    required this.sessionPrice,
    required this.status,
    required this.bookedAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'Doctor': doctor,
      'User': user,
      'Type': type,
      'Concern': concern,
      'Description': description,
      'DayOfWeek': dayOfWeek,
      'Date': date,
      'StartTime': startTime,
      'EndTime': endTime,
      'SessionLength': sessionLength,
      'SessionPrice': sessionPrice,
      'Status': status,
      'BookedAt': bookedAt,
      'UpdatedAt': updatedAt,
    };
  }

  factory AppointmentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return AppointmentModel(
      id: document.id,
      doctor: data['Doctor'] as DocumentReference,
      user: data['User'] as DocumentReference,
      type: data['Type'] ?? 'physical',
      concern: data['Concern'] ?? '',
      description: data['Description'] ?? '',
      dayOfWeek: data['DayOfWeek'] ?? '',
      date: (data['Date'] as Timestamp).toDate(),
      startTime: (data['StartTime'] as Timestamp).toDate(),
      endTime: (data['EndTime'] as Timestamp).toDate(),
      sessionLength: data['SessionLength'] ?? 0,
      sessionPrice: (data['SessionPrice'] as num).toDouble(),
      status: data['Status'] ?? 'booked',
      bookedAt: (data['BookedAt'] as Timestamp).toDate(),
      updatedAt: (data['UpdatedAt'] as Timestamp).toDate(),
    );
  }
}
