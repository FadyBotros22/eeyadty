import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/doctor/doctor_appointment.dart';
import '../models/doctor/doctor_user.dart';

class DoctorRepository {
  final _client = Supabase.instance.client;

  // ── Profile ──────────────────────────────────────────────────────────────

  Future<DoctorUser> fetchProfile() async {
    final user = _client.auth.currentUser;
    if (user == null) return DoctorUser.empty();

    final data = await _client
        .from('profiles')
        .select('id, full_name, email, avatar_url')
        .eq('id', user.id)
        .single();

    return DoctorUser.fromJson({...data, 'email': user.email ?? ''});
  }

  // ── Appointments ─────────────────────────────────────────────────────────

  /// Today's appointments for the Schedule tab
  Future<List<DoctorAppointment>> fetchTodayAppointments() async {
    final user = _client.auth.currentUser;
    if (user == null) return [];

    final today = DateTime.now();
    final start = DateTime(today.year, today.month, today.day);
    final end = start.add(const Duration(days: 1));

    final data = await _client
        .from('appointments')
        .select('id, patient_name, date_time, status')
        .eq('doctor_id', user.id)
        .gte('date_time', start.toIso8601String())
        .lt('date_time', end.toIso8601String())
        .order('date_time');

    return data.map((e) => DoctorAppointment.fromJson(e)).toList();
  }

  /// Appointments for a given date (calendar picker)
  Future<List<DoctorAppointment>> fetchAppointmentsByDate(
      DateTime date) async {
    final user = _client.auth.currentUser;
    if (user == null) return [];

    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));

    final data = await _client
        .from('appointments')
        .select('id, patient_name, date_time, status')
        .eq('doctor_id', user.id)
        .gte('date_time', start.toIso8601String())
        .lt('date_time', end.toIso8601String())
        .order('date_time');

    return data.map((e) => DoctorAppointment.fromJson(e)).toList();
  }

  /// Last 5 bookings for the Patients tab
  Future<List<DoctorAppointment>> fetchRecentPatients() async {
    final user = _client.auth.currentUser;
    if (user == null) return [];

    final data = await _client
        .from('appointments')
        .select('id, patient_name, date_time, status')
        .eq('doctor_id', user.id)
        .order('date_time', ascending: false)
        .limit(5);

    return data.map((e) => DoctorAppointment.fromJson(e)).toList();
  }

  // ── Auth ─────────────────────────────────────────────────────────────────

  Future<void> signOut() async {
    await _client.auth.signOut();
  }
}
