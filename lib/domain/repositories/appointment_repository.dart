import '../models/appointment/appointment.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class AppointmentRepository {
  Future<AppResult<List<Appointment>>> getAppointments() async {
    try {
      final raw = await SupabaseManager.getClientAppointments();
      final appointments = raw
          .map((e) => Appointment.fromJson(e))
          .toList();
      return AppResult.success(appointments);
    } catch (e) {
      return AppResult.failure('Failed to load appointments.');
    }
  }


  Future<AppResult<String>> bookAppointment({
    required String clientId,
    required String serviceId,
    required String doctorId,
    required String slotId,
    required String date,
    required String time,
    String? notes,
  }) async {
    try {
      await SupabaseManager.bookAppointment(
        doctorId: doctorId,
        slotId: slotId,
        date: date,
        time: time,
        notes: notes,
      );
      return AppResult.success('Appointment booked successfully.');
    } catch (e) {
      return AppResult.failure('Failed to book appointment.');
    }
  }

  Future<AppResult<void>> cancelAppointment(String appointmentId) async {
    try {
      await SupabaseManager.cancelAppointment(appointmentId);
      return AppResult.success(null);
    } catch (e) {
      return AppResult.failure('Failed to cancel appointment.');
    }
  }
}
