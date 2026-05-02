import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/enums/user_role.dart';
import '../models/user/client_user.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class AuthRepository {
  // ─── Sign In ──────────────────────────────────────────────────────────────

  /// Signs in and returns a [ClientUser] whose [role] reflects what is stored
  /// in Supabase. The caller can switch on [ClientUser.role] to decide which
  /// navigator branch to push.
  Future<AppResult<ClientUser>> signIn({
    required String email,
    required String password,
    required UserRole role, // ← keep: caller selects role on login screen
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

      // Prefer metadata role if present, fall back to the passed-in role
      final meta = user.userMetadata ?? {};
      final resolvedRole = UserRoleX.fromString(
        meta['role'] as String? ?? role.value,
      );

      final clientUser = ClientUser(
        id: user.id,
        email: user.email,
        fullName: meta['full_name'] as String?,
        phoneNumber: meta['phone_number'] as String?,
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

  /// Creates an account for either a [UserRole.patient] or [UserRole.doctor].
  /// Writes to:
  ///   • `profiles`          — shared role + display info
  ///   • `client_profiles`   — patient-specific details  (patients only)
  ///   • `doctor_profiles`   — doctor-specific details   (doctors only)
  Future<AppResult<ClientUser>> signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role, // ← caller decides
    String? phoneNumber,
    String? specialization, // doctors only
    String? licenseNumber,  // doctors only
  }) async {
    try {
      final response = await SupabaseManager.signUp(
        email: email,
        password: password,
        data: {
          'full_name': fullName,
          'phone_number': phoneNumber ?? '',
          'role': role.value,
        },
      );

      final user = response.user;
      if (user == null) {
        return AppResult.failure(
            'Sign up failed. Please check your email for confirmation.');
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