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
    } catch (e) {
      throw 'Something went wrong in availability, Please try again';
    }
  }
}
