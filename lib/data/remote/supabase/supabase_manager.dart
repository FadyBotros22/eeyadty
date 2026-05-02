import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Central manager for all Supabase operations.
/// Initialize once in main.dart before runApp().
class SupabaseManager {
  static const String _supabaseUrl = 'https://mwuqkoubxprhkjjdhkod.supabase.co/rest/v1/';
  static const String _supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13dXFrb3VieHByaGtqamRoa29kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2ODUyMDMsImV4cCI6MjA5MzI2MTIwM30.CCIP3yYH4xiaNkbr4MzMvYi04vNlV2E-qut0U51qK1E';

  static SupabaseClient get client => Supabase.instance.client;

  /// Call this in main() before runApp()
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseAnonKey,
    );
  }

  // ─── Auth ─────────────────────────────────────────────────────────────────

  static Future<AuthResponse> signUp({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    return client.auth.signUp(
      email: email,
      password: password,
      data: data,
    );
  }

  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> signOut() async {
    await client.auth.signOut();
  }

  static User? get currentUser => client.auth.currentUser;
  static String? get currentUserId => client.auth.currentUser?.id;

  static Stream<AuthState> get authStateChanges =>
      client.auth.onAuthStateChange;

  // ─── Storage ──────────────────────────────────────────────────────────────

  static const String _avatarsBucket = 'avatars';

  /// Uploads a file to the avatars bucket and returns the public URL.
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

  // ─── Database helpers ─────────────────────────────────────────────────────

  /// Fetch the client profile by user id.
  static Future<Map<String, dynamic>?> getClientProfile(String userId) async {
    final res = await client
        .from('client_profiles')
        .select()
        .eq('id', userId)
        .maybeSingle();
    return res;
  }

  /// Update or insert client profile.
  static Future<void> upsertClientProfile(Map<String, dynamic> data) async {
    await client.from('client_profiles').upsert(data);
  }

  /// Fetch all services.
  static Future<List<Map<String, dynamic>>> getServices() async {
    final res = await client.from('services').select().order('name');
    return List<Map<String, dynamic>>.from(res);
  }

  /// Fetch services for a specific category.
  static Future<List<Map<String, dynamic>>> getServicesByCategory(
      String category) async {
    final res = await client
        .from('services')
        .select()
        .eq('category', category)
        .order('name');
    return List<Map<String, dynamic>>.from(res);
  }

  /// Fetch all service categories.
  static Future<List<Map<String, dynamic>>> getServiceCategories() async {
    final res = await client.from('service_categories').select().order('name');
    return List<Map<String, dynamic>>.from(res);
  }

  /// Fetch appointments for the current client.
  static Future<List<Map<String, dynamic>>> getClientAppointments(
      String clientId) async {
    final res = await client
        .from('appointments')
        .select('*, services(*)')
        .eq('client_id', clientId)
        .order('appointment_date', ascending: false);
    return List<Map<String, dynamic>>.from(res);
  }

  /// Book a new appointment.
  static Future<Map<String, dynamic>> bookAppointment(
      Map<String, dynamic> data) async {
    final res =
        await client.from('appointments').insert(data).select().single();
    return res;
  }

  /// Cancel an appointment by id.
  static Future<void> cancelAppointment(String appointmentId) async {
    await client
        .from('appointments')
        .update({'status': 'cancelled'}).eq('id', appointmentId);
  }

  /// Fetch available time slots for a service on a given date.
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
