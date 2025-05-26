import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  final String id;
  final String degree;
  final String speciality;
  final String bio;
  final int experience;
  final String clinicAddress;
  final double sessionPrice;
  final DocumentReference user;

  DoctorModel({
    required this.id,
    required this.degree,
    required this.speciality,
    required this.bio,
    required this.experience,
    required this.clinicAddress,
    required this.sessionPrice,
    required this.user,
  });

  static DoctorModel empty() => DoctorModel(
      id: '',
      degree: '',
      speciality: '',
      bio: '',
      experience: 0,
      clinicAddress: '',
      sessionPrice: 0.0,
      user: FirebaseFirestore.instance
          .doc('Users/2sab4x2btfQA7wUy6He4y7ekbEf1/'));

  Map<String, dynamic> toJson() {
    return {
      'Degree': degree,
      'Speciality': speciality,
      'Bio': bio,
      'Experience': experience,
      'ClinicAddress': clinicAddress,
      'SessionPrice': sessionPrice,
      'User': user
    };
  }

  factory DoctorModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return DoctorModel(
          id: document.id,
          degree: data['Degree'] ?? '',
          speciality: data['Specialty'] ?? '',
          bio: data['Bio'] ?? '',
          experience: data['Experience'] ?? 0,
          clinicAddress: data['ClinicAddress'] ?? '',
          sessionPrice: (data['SessionPrice'] as num).toDouble(),
          user: data['User'] as DocumentReference);
    } else {
      return empty();
    }
  }
}
