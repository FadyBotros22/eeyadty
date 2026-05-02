import '../models/doctor/doctor_appointment.dart';
import '../models/doctor/doctor_user.dart';
import '../utils/app_result.dart';
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

  /// Update doctor profile fields (bio, specialty, consultationPrice, etc.)
  Future<AppResult<DoctorUser>> updateProfile(DoctorUser doctor) async {
    try {
      await SupabaseManager.upsertDoctorProfile({
        'id': doctor.id,
        'fullName': doctor.fullName,
        'phoneNumber': doctor.phoneNumber,
        'specialty': doctor.specialty,
        'bio': doctor.bio,
        'consultationPrice': doctor.consultationPrice,
        'avatarUrl': doctor.avatarUrl,
      });
      return AppResult.success(doctor);
    } catch (e) {
      return AppResult.failure('Failed to update profile.');
    }
  }


  // ─── Appointments ─────────────────────────────────────────────────────────

// DoctorRepository

  Future<List<DoctorAppointment>> fetchTodayAppointments() async {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final data = await SupabaseManager.client
        .rpc('get_doctor_appointments');

    return (data as List)
        .map((e) => DoctorAppointment.fromJson(e))
        .where((a) {
      final d = a.date;
      return d.year == todayDate.year &&
          d.month == todayDate.month &&
          d.day == todayDate.day;
    })
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  Future<List<DoctorAppointment>> fetchAppointmentsByDate(DateTime date) async {
    final data = await SupabaseManager.client
        .rpc('get_doctor_appointments');

    return (data as List)
        .map((e) => DoctorAppointment.fromJson(e))
        .where((a) {
      final d = a.date;
      return d.year == date.year &&
          d.month == date.month &&
          d.day == date.day;
    })
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  Future<List<DoctorAppointment>> fetchRecentPatients() async {
    final data = await SupabaseManager.client
        .rpc('get_doctor_appointments');

    final list = (data as List)
        .map((e) => DoctorAppointment.fromJson(e))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    return list.take(5).toList();
  }

  // ─── Auth ─────────────────────────────────────────────────────────────────

  Future<void> signOut() => SupabaseManager.signOut();
}
