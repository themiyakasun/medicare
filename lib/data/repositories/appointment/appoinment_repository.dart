import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare/features/appointment/models/appointment_model.dart';

class AppointmentRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createAppointment(AppointmentModel appointment) async {
    try {
      await _db
          .collection('Appointments')
          .doc(appointment.id)
          .set(appointment.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AppointmentModel>> fetchAppointmentsForPatient(
      String patientId) async {
    try {
      final patientRef = _db.collection('Users').doc(patientId);
      final querySnapshot = await _db
          .collection('Appointments')
          .where('User', isEqualTo: patientRef)
          .orderBy('Date', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => AppointmentModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AppointmentModel>> fetchAppointmentsForDoctor(
      String doctorId) async {
    try {
      final doctorRef = _db.collection('Doctors').doc(doctorId);
      final querySnapshot = await _db
          .collection('Appointments')
          .where('Doctor', isEqualTo: doctorRef)
          .orderBy('Date', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => AppointmentModel.fromSnapshot(doc))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<AppointmentModel?> fetchAppointmentById(String appointmentId) async {
    try {
      final docSnapshot =
          await _db.collection('Appointments').doc(appointmentId).get();
      if (docSnapshot.exists) {
        return AppointmentModel.fromSnapshot(docSnapshot);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateAppointment(AppointmentModel appointment) async {
    try {
      if (appointment.id.isEmpty) {
        throw Exception(
            "Appointment ID cannot be empty for an update operation.");
      }
      await _db
          .collection('Appointments')
          .doc(appointment.id)
          .update(appointment.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAppointment(String appointmentId) async {
    try {
      if (appointmentId.isEmpty) {
        throw Exception(
            "Appointment ID cannot be empty for a delete operation.");
      }
      await _db.collection('Appointments').doc(appointmentId).delete();
    } catch (e) {
      print("Error deleting appointment $appointmentId: $e");
      rethrow;
    }
  }
}
