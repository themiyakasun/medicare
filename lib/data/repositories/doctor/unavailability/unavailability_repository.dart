import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medicare/features/appointment/models/unavailability_model.dart';
import 'package:medicare/utils/exceptions/firebase_exceptions.dart';
import 'package:medicare/utils/exceptions/format_exceptions.dart';
import 'package:medicare/utils/exceptions/platform_exceptions.dart';

class UnavailabilityRepository extends GetxController {
  static UnavailabilityRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<UnavailabilityModel>> fetchUnavailability(String doctorId) async {
    try {
      final doctorRef = _db.collection('Doctors').doc(doctorId);
      final snapshot = await _db
          .collection('Unavailability')
          .where('Doctor', isEqualTo: doctorRef)
          .get();
      return snapshot.docs
          .map((doc) => UnavailabilityModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong in unavailability, Please try again';
    }
  }
}
