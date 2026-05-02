import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/enums/user_role.dart';
import '../models/user/client_user.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class AuthRepository {
  // ─── Sign In ──────────────────────────────────────────────────────────────

  Future<AppResult<ClientUser>> signIn({
    required String email,
    required String password,
    required UserRole role,
  }) async {
    try {
      final response = await SupabaseManager.signIn(
        email: email,
        password: password,
      );

      final user = response.user;
      if (user == null) {
        return AppResult.failure('Sign in failed. Please try again.');
      }

      final meta = user.userMetadata ?? {};
      final resolvedRole = UserRoleX.fromString(
        meta['role'] as String? ?? role.value,
      );

      final clientUser = ClientUser(
        id: user.id,
        email: user.email,
        fullName: meta['fullName'] as String?,
        phoneNumber: meta['phoneNumber'] as String?,
        role: resolvedRole,
      );

      return AppResult.success(clientUser);
    } on AuthException catch (e) {
      return AppResult.failure(e.message);
    } catch (_) {
      return AppResult.failure('An unexpected error occurred.');
    }
  }

  // ─── Sign Up ──────────────────────────────────────────────────────────────

  /// Creates an account. For doctors, also upserts `doctor_profiles` with
  /// specialty, bio, and consultationPrice.
  Future<AppResult<ClientUser>> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phoneNumber,
    // Doctor-only fields
    String? specialty,
    String? bio,
    double? consultationPrice,
  }) async {
    try {
      final response = await SupabaseManager.signUp(
        email: email,
        password: password,
        data: {
          'fullName': fullName,
          'phoneNumber': phoneNumber ?? '',
          'role': role.value,
        },
      );

      final user = response.user;
      if (user == null) {
        return AppResult.failure(
            'Sign up failed. Please check your email for confirmation.');
      }

      if (role == UserRole.doctor) {
        await SupabaseManager.upsertDoctorProfile({
          'id': user.id,
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'specialty': specialty,
          'bio': bio,
          'consultationPrice': consultationPrice,
        });
      }

      return AppResult.success(
        ClientUser(id: user.id, email: email, fullName: fullName, role: role),
      );
    } on AuthException catch (e) {
      return AppResult.failure(e.message);
    } catch (_) {
      return AppResult.failure('An unexpected error occurred.');
    }
  }

  // ─── Helpers ──────────────────────────────────────────────────────────────

  Future<void> signOut() => SupabaseManager.signOut();

  bool get isLoggedIn => SupabaseManager.currentUser != null;
}
