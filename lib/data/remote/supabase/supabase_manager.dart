import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  static const String _supabaseUrl =
      'https://mwuqkoubxprhkjjdhkod.supabase.co';
  static const String _supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13dXFrb3VieHByaGtqamRoa29kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2ODUyMDMsImV4cCI6MjA5MzI2MTIwM30.CCIP3yYH4xiaNkbr4MzMvYi04vNlV2E-qut0U51qK1E';

  static SupabaseClient get client => Supabase.instance.client;

  static Future<void> initialize() async {
    await Supabase.initialize(url: _supabaseUrl, anonKey: _supabaseAnonKey);
  }

  // ─── Auth ──────────────────────────────────────────────────────────────────

  static Future<AuthResponse> signUp({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    return client.auth.signUp(email: email, password: password, data: data);
  }

  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return client.auth.signInWithPassword(email: email, password: password);
  }

  static Future<void> signOut() async => client.auth.signOut();

  static User? get currentUser => client.auth.currentUser;
  static String? get currentUserId => client.auth.currentUser?.id;
  static Stream<AuthState> get authStateChanges => client.auth.onAuthStateChange;

  // ─── Storage ───────────────────────────────────────────────────────────────

  static const String _avatarsBucket = 'avatars';

  static Future<String> uploadAvatar({
    required String userId,
    required File file,
  }) async {
    final ext = file.path.split('.').last;
    final path = '$userId/avatar.$ext';
    await client.storage.from(_avatarsBucket).upload(
      path,
      file,
      fileOptions: const FileOptions(upsert: true),
    );
    return client.storage.from(_avatarsBucket).getPublicUrl(path);
  }

  // ─── Role resolution ───────────────────────────────────────────────────────

  /// Reads the `role` column from the shared `profiles` table.
  /// Returns `'patient'`, `'doctor'`, or `null` if no row exists yet.
  static Future<String?> getUserRole(String userId) async {
    final row = await client
        .from('profiles')
        .select('role')
        .eq('id', userId)
        .maybeSingle();
    return row?['role'] as String?;
  }

  // ─── Patient (client_profiles) ─────────────────────────────────────────────

  static Future<Map<String, dynamic>?> getClientProfile(String userId) async {
    return client
        .from('client_profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();
  }

  static Future<void> upsertClientProfile(Map<String, dynamic> data) async {
    await client.from('client_profiles').upsert(data);
  }

  // ─── Doctor (doctor_profiles) ──────────────────────────────────────────────

  static Future<Map<String, dynamic>?> getDoctorProfile(String userId) async {
    return client
        .from('doctor_profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();
  }

  static Future<void> upsertDoctorProfile(Map<String, dynamic> data) async {
    await client.from('doctor_profiles').upsert(data);
  }

  // ─── Shared profiles table (role + display info) ───────────────────────────

  /// Upserts into the lightweight `profiles` table that stores role + shared
  /// display fields (full_name, email, avatar_url). Both patient and doctor
  /// rows live here so role look-up is a single query.
  static Future<void> upsertProfile(Map<String, dynamic> data) async {
    await client.from('profiles').upsert(data);
  }

  // ─── Services ──────────────────────────────────────────────────────────────

  static Future<List<Map<String, dynamic>>> getServices() async {
    final res = await client.from('services').select().order('name');
    return List<Map<String, dynamic>>.from(res);
  }

  static Future<List<Map<String, dynamic>>> getServicesByCategory(
      String category) async {
    final res = await client
        .from('services')
        .select()
        .eq('category', category)
        .order('name');
    return List<Map<String, dynamic>>.from(res);
  }

  static Future<List<Map<String, dynamic>>> getServiceCategories() async {
    final res =
    await client.from('service_categories').select().order('name');
    return List<Map<String, dynamic>>.from(res);
  }

  // ─── Appointments ──────────────────────────────────────────────────────────

  static Future<List<Map<String, dynamic>>> getClientAppointments(
      String clientId) async {
    final res = await client
        .from('appointments')
        .select('*, services(*)')
        .eq('client_id', clientId)
        .order('appointment_date', ascending: false);
    return List<Map<String, dynamic>>.from(res);
  }

  static Future<Map<String, dynamic>> bookAppointment(
      Map<String, dynamic> data) async {
    return client.from('appointments').insert(data).select().single();
  }

  static Future<void> cancelAppointment(String appointmentId) async {
    await client
        .from('appointments')
        .update({'status': 'cancelled'}).eq('id', appointmentId);
  }

  static Future<List<Map<String, dynamic>>> getAvailableSlots({
    required String serviceId,
    required String date,
  }) async {
    final res = await client
        .from('available_slots')
        .select()
        .eq('service_id', serviceId)
        .eq('date', date)
        .eq('is_booked', false)
        .order('time');
    return List<Map<String, dynamic>>.from(res);
  }
}