import '../models/doctor_list_item/doctor_list_item.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class DoctorsRepository {
  Future<AppResult<List<DoctorListItem>>> getDoctors({
    String? specialty,
  }) async {
    try {
      final raw = await SupabaseManager.getDoctors();
      AppResult<List<DoctorListItem>> lol = AppResult.success(
          raw.map(DoctorListItem.fromJson).toList());
      return lol;
    } catch (e) {
      return AppResult.failure('Failed to load doctors.');
    }
  }

  Future<AppResult<List<DoctorListItem>>> searchDoctors(
      String query) async {
    try {
      final raw = await SupabaseManager.searchDoctors(query);
      return AppResult.success(
          raw.map(DoctorListItem.fromJson).toList());
    } catch (e) {
      return AppResult.failure('Failed to search doctors.');
    }
  }
}