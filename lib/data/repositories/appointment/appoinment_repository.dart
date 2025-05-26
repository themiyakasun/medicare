import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medicare/features/appointment/models/appointment_model.dart';

class AppointmentRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createAppointment(AppointmentModel appointment) async {
    await _db
        .collection("Appointments")
        .doc(appointment.id)
        .set(appointment.toJson());
  }
}
