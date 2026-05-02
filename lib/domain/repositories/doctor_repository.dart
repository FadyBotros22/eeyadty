import '../models/doctor/doctor_appointment.dart';
import '../models/doctor/doctor_user.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class DoctorRepository {
  // ─── Profile ──────────────────────────────────────────────────────────────

  Future<DoctorUser> fetchProfile() async {
    final userId = SupabaseManager.currentUserId;
    if (userId == null) return DoctorUser.empty();

    final data = await SupabaseManager.getDoctorProfile(userId);
    if (data == null) return DoctorUser.empty();

    return DoctorUser.fromJson({
      ...data,
      'email': SupabaseManager.currentUser?.email ?? '',
    });
  }

  // ─── Appointments ─────────────────────────────────────────────────────────

  Future<List<DoctorAppointment>> fetchTodayAppointments() async {
    final userId = SupabaseManager.currentUserId;
    if (userId == null) return [];

    final today = DateTime.now();
    final start = DateTime(today.year, today.month, today.day);
    final end = start.add(const Duration(days: 1));

    final data = await SupabaseManager.client
        .from('appointments')
        .select('id, patient_name, date_time, status')
        .eq('doctor_id', userId)
        .gte('date_time', start.toIso8601String())
        .lt('date_time', end.toIso8601String())
        .order('date_time');

    return data.map((e) => DoctorAppointment.fromJson(e)).toList();
  }

  Future<List<DoctorAppointment>> fetchAppointmentsByDate(
      DateTime date) async {
    final userId = SupabaseManager.currentUserId;
    if (userId == null) return [];

    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    final data = await SupabaseManager.client
        .from('appointments')
        .select('id, patient_name, date_time, status')
        .eq('doctor_id', userId)
        .gte('date_time', start.toIso8601String())
        .lt('date_time', end.toIso8601String())
        .order('date_time');

    return data.map((e) => DoctorAppointment.fromJson(e)).toList();
  }

  Future<List<DoctorAppointment>> fetchRecentPatients() async {
    final userId = SupabaseManager.currentUserId;
    if (userId == null) return [];

    final data = await SupabaseManager.client
        .from('appointments')
        .select('id, patient_name, date_time, status')
        .eq('doctor_id', userId)
        .order('date_time', ascending: false)
        .limit(5);

    return data.map((e) => DoctorAppointment.fromJson(e)).toList();
  }

  // ─── Auth ─────────────────────────────────────────────────────────────────

  Future<void> signOut() => SupabaseManager.signOut();
}