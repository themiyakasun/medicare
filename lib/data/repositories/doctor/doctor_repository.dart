import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medicare/features/personalization/models/doctor_model.dart';
import 'package:medicare/utils/exceptions/firebase_exceptions.dart';
import 'package:medicare/utils/exceptions/format_exceptions.dart';
import 'package:medicare/utils/exceptions/platform_exceptions.dart';

class DoctorRepository extends GetxController {
  static DoctorRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<DoctorModel>> fetchDoctors() async {
    try {
      final snapshot = await _db.collection('Doctors').get();
      return snapshot.docs.map((e) => DoctorModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }
}
