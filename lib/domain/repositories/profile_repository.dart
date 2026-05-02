import 'dart:io';
import '../models/user/client_user.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class ProfileRepository {
  Future<AppResult<ClientUser>> getProfile(String userId) async {
    try {
      final raw = await SupabaseManager.getClientProfile(userId);
      if (raw == null) return AppResult.failure('Profile not found.');

      return AppResult.success(ClientUser.fromJson(raw));
    } catch (e) {
      return AppResult.failure('Failed to load profile.');
    }
  }

  Future<AppResult<ClientUser>> updateProfile(ClientUser user) async {
    try {
      await SupabaseManager.upsertClientProfile({
        'id': user.id,
        'fullName': user.fullName,
        'phoneNumber': user.phoneNumber,
        'dateOfBirth': user.dateOfBirth,
        'gender': user.gender,
        'avatarUrl': user.avatarUrl,
      });
      return AppResult.success(user);
    } catch (e) {
      return AppResult.failure('Failed to update profile.');
    }
  }

  Future<AppResult<String>> uploadAvatar({
    required String userId,
    required File file,
  }) async {
    try {
      final url =
          await SupabaseManager.uploadAvatar(userId: userId, file: file);
      return AppResult.success(url);
    } catch (e) {
      return AppResult.failure('Failed to upload image.');
    }
  }
}
