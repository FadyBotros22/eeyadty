import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/user/client_user.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class AuthRepository {
  /// Sign in with email and password.
  Future<AppResult<ClientUser>> signIn({
    required String email,
    required String password,
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
      final profile = await SupabaseManager.getClientProfile(user.id);
      final clientUser = profile != null
          ? ClientUser.fromJson({...profile, 'email': user.email})
          : ClientUser(id: user.id, email: user.email);
      return AppResult.success(clientUser);
    } on AuthException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure('An unexpected error occurred.');
    }
  }

  /// Sign up a new client user.
  Future<AppResult<ClientUser>> signUp({
    required String email,
    required String password,
    required String fullName,
    String? phoneNumber,
  }) async {
    try {
      final response = await SupabaseManager.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName, 'phone_number': phoneNumber ?? ''},
      );
      final user = response.user;
      if (user == null) {
        return AppResult.failure(
            'Sign up failed. Please check your email for confirmation.');
      }
      // Create profile row
      await SupabaseManager.upsertClientProfile({
        'id': user.id,
        'email': email,
        'full_name': fullName,
        'phone_number': phoneNumber ?? '',
      });
      final clientUser =
          ClientUser(id: user.id, email: email, fullName: fullName);
      return AppResult.success(clientUser);
    } on AuthException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure('An unexpected error occurred.');
    }
  }

  Future<void> signOut() => SupabaseManager.signOut();

  bool get isLoggedIn => SupabaseManager.currentUser != null;
}
