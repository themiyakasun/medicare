import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medicare/features/appointment/models/availability_model.dart';
import 'package:medicare/utils/exceptions/firebase_exceptions.dart';
import 'package:medicare/utils/exceptions/format_exceptions.dart';
import 'package:medicare/utils/exceptions/platform_exceptions.dart';

class AvailabilityRepository extends GetxController {
  static AvailabilityRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<AvailabilityModel>> fetchAvailability(String doctorId) async {
    try {
      final doctorRef = _db.collection('Doctors').doc(doctorId);

      final snapshot = await _db
          .collection('Availability')
          .where('Doctor', isEqualTo: doctorRef)
          .get();

      return snapshot.docs
          .map((doc) => AvailabilityModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e, stackTrace) {
      print("🔥 Error in fetchAvailability: $e");
      print("🧵 StackTrace: $stackTrace");
      throw 'Something went wrong in availability, Please try again';
    }
  }

  Future<List<String>> fetchTimeSlotsByDate(
      String doctorId, DateTime date) async {
    final dayOfWeek = _getDayOfWeek(date);

    final doctorRef = _db.collection('Doctors').doc(doctorId);

    final snapshot = await _db
        .collection("Availability")
        .where("Doctor", isEqualTo: doctorRef)
        .where("DayOfWeek", isEqualTo: dayOfWeek)
        .get();

    if (snapshot.docs.isEmpty) return [];

    return List<String>.from(snapshot.docs.first.data()['TimeSlots']);
  }

  String _getDayOfWeek(DateTime date) {
    return [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ][date.weekday - 1];
  }
}
