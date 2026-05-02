import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseManager {
  static const String _supabaseUrl =
      'https://mwuqkoubxprhkjjdhkod.supabase.co';
  static const String _supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13dXFrb3VieHByaGtqamRoa29kIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2ODUyMDMsImV4cCI6MjA5MzI2MTIwM30.CCIP3yYH4xiaNkbr4MzMvYi04vNlV2E-qut0U51qK1E';

  static SupabaseClient get client => Supabase.instance.client;

  // ─── Logging ───────────────────────────────────────────────────────────────

  static void _logRequest(String method, String table,
      [Map<String, dynamic>? payload]) {
    if (!kDebugMode) return;
    final buffer = StringBuffer()
      ..writeln('┌── SUPABASE REQUEST ──────────────────────')
      ..writeln('│  method : $method')
      ..writeln('│  table  : $table')
      ..writeln('│  payload: $payload');
    buffer.writeln('└──────────────────────────────────────────');
    debugPrint(buffer.toString());
  }

  static void _logResponse(String table, dynamic data) {
    if (!kDebugMode) return;
    final buffer = StringBuffer()
      ..writeln('┌── SUPABASE RESPONSE ─────────────────────')
      ..writeln('│  table : $table')
      ..writeln('│  data  : $data')
      ..writeln('└──────────────────────────────────────────');
    debugPrint(buffer.toString());
  }

  static void _logError(String table, Object error) {
    if (!kDebugMode) return;
    final buffer = StringBuffer()
      ..writeln('┌── SUPABASE ERROR ────────────────────────')
      ..writeln('│  table : $table')
      ..writeln('│  error : $error')
      ..writeln('└──────────────────────────────────────────');
    debugPrint(buffer.toString());
  }

  // ─── Init ──────────────────────────────────────────────────────────────────

  static Future<void> initialize() async {
    await Supabase.initialize(url: _supabaseUrl, anonKey: _supabaseAnonKey);
  }

  // ─── Auth ──────────────────────────────────────────────────────────────────

  static Future<AuthResponse> signUp({
    required String email,
    required String password,
    required Map<String, dynamic> data,
  }) async {
    _logRequest('SIGN UP', 'auth', {'email': email, ...data});
    try {
      final res =
      await client.auth.signUp(email: email, password: password, data: data);
      _logResponse('auth', {'user_id': res.user?.id, 'email': res.user?.email});
      return res;
    } catch (e) {
      _logError('auth.signUp', e);
      rethrow;
    }
  }

  static Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    _logRequest('SIGN IN', 'auth', {'email': email});
    try {
      final res =
      await client.auth.signInWithPassword(email: email, password: password);
      _logResponse('auth', {'user_id': res.user?.id, 'email': res.user?.email});
      return res;
    } catch (e) {
      _logError('auth.signIn', e);
      rethrow;
    }
  }

  static Future<void> signOut() async {
    _logRequest('SIGN OUT', 'auth');
    try {
      await client.auth.signOut();
      _logResponse('auth', 'signed out');
    } catch (e) {
      _logError('auth.signOut', e);
      rethrow;
    }
  }

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
    _logRequest('UPLOAD', _avatarsBucket, {'path': path});
    try {
      await client.storage.from(_avatarsBucket).upload(
        path,
        file,
        fileOptions: const FileOptions(upsert: true),
      );
      final url = client.storage.from(_avatarsBucket).getPublicUrl(path);
      _logResponse(_avatarsBucket, {'public_url': url});
      return url;
    } catch (e) {
      _logError(_avatarsBucket, e);
      rethrow;
    }
  }

  // ─── Patient (client_profiles) ─────────────────────────────────────────────

  static Future<Map<String, dynamic>?> getClientProfile(String userId) async {
    _logRequest('SELECT', 'client_profiles', {'id': userId});
    try {
      final res = await client
          .from('client_profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();
      _logResponse('client_profiles', res);
      return res;
    } catch (e) {
      _logError('client_profiles.getClientProfile', e);
      rethrow;
    }
  }

  static Future<void> upsertClientProfile(Map<String, dynamic> data) async {
    _logRequest('UPSERT', 'client_profiles', data);
    try {
      await client.from('client_profiles').upsert(data);
      _logResponse('client_profiles', 'upsert ok');
    } catch (e) {
      _logError('client_profiles.upsertClientProfile', e);
      rethrow;
    }
  }

  // ─── Doctor (doctor_profiles) ──────────────────────────────────────────────

  static Future<Map<String, dynamic>?> getDoctorProfile(String userId) async {
    _logRequest('SELECT', 'doctor_profiles', {'id': userId});
    try {
      final res = await client
          .from('doctor_profiles')
          .select()
          .eq('id', userId)
          .maybeSingle();
      _logResponse('doctor_profiles', res);
      return res;
    } catch (e) {
      _logError('doctor_profiles.getDoctorProfile', e);
      rethrow;
    }
  }

  static Future<void> upsertDoctorProfile(Map<String, dynamic> data) async {
    _logRequest('UPSERT', 'doctor_profiles', data);
    try {
      await client.from('doctor_profiles').upsert(data);
      _logResponse('doctor_profiles', 'upsert ok');
    } catch (e) {
      _logError('doctor_profiles.upsertDoctorProfile', e);
      rethrow;
    }
  }

  // ─── Appointments ──────────────────────────────────────────────────────────

  static Future<List<Map<String, dynamic>>> getClientAppointments(
      String clientId) async {
    _logRequest('SELECT', 'appointments', {'client_id': clientId});
    try {
      final res = await client
          .from('appointments')
          .select('*, services(*)')
          .eq('client_id', clientId)
          .order('appointment_date', ascending: false);
      final list = List<Map<String, dynamic>>.from(res);
      _logResponse('appointments', '${list.length} rows');
      return list;
    } catch (e) {
      _logError('appointments.getClientAppointments', e);
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> bookAppointment(
      Map<String, dynamic> data) async {
    _logRequest('INSERT', 'appointments', data);
    try {
      final res =
      await client.from('appointments').insert(data).select().single();
      _logResponse('appointments', res);
      return res;
    } catch (e) {
      _logError('appointments.bookAppointment', e);
      rethrow;
    }
  }

  static Future<void> cancelAppointment(String appointmentId) async {
    _logRequest('UPDATE', 'appointments', {'id': appointmentId, 'status': 'cancelled'});
    try {
      await client
          .from('appointments')
          .update({'status': 'cancelled'}).eq('id', appointmentId);
      _logResponse('appointments', 'cancelled ok');
    } catch (e) {
      _logError('appointments.cancelAppointment', e);
      rethrow;
    }
  }

  static Future<List<Map<String, dynamic>>> getAvailableSlots({
    required String serviceId,
    required String date,
  }) async {
    _logRequest('SELECT', 'available_slots', {'service_id': serviceId, 'date': date});
    try {
      final res = await client
          .from('available_slots')
          .select()
          .eq('service_id', serviceId)
          .eq('date', date)
          .eq('is_booked', false)
          .order('time');
      final list = List<Map<String, dynamic>>.from(res);
      _logResponse('available_slots', '${list.length} rows');
      return list;
    } catch (e) {
      _logError('available_slots.getAvailableSlots', e);
      rethrow;
    }
  }

  // ─── Doctors list ──────────────────────────────────────────────────────────

  static Future<List<Map<String, dynamic>>> getDoctors() async {
    _logRequest('SELECT', 'doctors_list');
    try {
      final res = await client.from('doctors_list').select();
      final list = List<Map<String, dynamic>>.from(res);
      _logResponse('doctors_list', '${list.length} rows');
      return list;
    } catch (e) {
      _logError('doctors_list.getDoctors', e);
      rethrow;
    }
  }


  static Future<List<Map<String, dynamic>>> searchDoctors(
      String query) async {
    _logRequest('SELECT', 'doctors_list', {'search': query});
    try {
      final res = await client
          .from('doctors_list')
          .select()
          .ilike('name', '%$query%');
      final list = List<Map<String, dynamic>>.from(res);
      _logResponse('doctors_list', '${list.length} rows');
      return list;
    } catch (e) {
      _logError('doctors_list.searchDoctors', e);
      rethrow;
    }
  }
}