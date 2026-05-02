import '../models/appointment/appointment.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class AppointmentRepository {
  Future<AppResult<List<Appointment>>> getAppointments(
      String clientId) async {
    try {
      final raw = await SupabaseManager.getClientAppointments(clientId);
      final appointments = raw.map((e) {
        final serviceRaw = e['services'];
        return Appointment.fromJson({
          ...e,
          'service': serviceRaw,
          'status': e['status'] ?? 'pending',
        });
      }).toList();
      return AppResult.success(appointments);
    } catch (e) {
      return AppResult.failure('Failed to load appointments.');
    }
  }

  Future<AppResult<Appointment>> bookAppointment({
    required String clientId,
    required String serviceId,
    required String date,
    required String time,
    String? notes,
  }) async {
    try {
      final data = await SupabaseManager.bookAppointment({
        'client_id': clientId,
        'service_id': serviceId,
        'appointment_date': date,
        'appointment_time': time,
        'notes': notes ?? '',
        'status': 'pending',
      });
      return AppResult.success(Appointment.fromJson(data));
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
