import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medicare/features/appointment/models/rating_model.dart';
import 'package:medicare/utils/exceptions/firebase_exceptions.dart';
import 'package:medicare/utils/exceptions/format_exceptions.dart';
import 'package:medicare/utils/exceptions/platform_exceptions.dart';

class RatingRepository extends GetxController {
  static RatingRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<RatingModel>> fetchRatings(String doctorId) async {
    try {
      final doctorRef = _db.collection('Doctors').doc(doctorId);
      final snapshot = await _db
          .collection('Ratings')
          .where('Doctor', isEqualTo: doctorRef)
          .get();

      return snapshot.docs.map((doc) => RatingModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong in rating, Please try again';
    }
  }
}
