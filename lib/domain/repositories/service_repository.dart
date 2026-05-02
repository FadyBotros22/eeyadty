import '../models/service/service.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class ServiceRepository {
  Future<AppResult<List<ClinicService>>> getServices(
      {String? category}) async {
    try {
      final raw = category != null
          ? await SupabaseManager.getServicesByCategory(category)
          : await SupabaseManager.getServices();
      final services = raw.map((e) => ClinicService.fromJson(e)).toList();
      return AppResult.success(services);
    } catch (e) {
      return AppResult.failure('Failed to load services.');
    }
  }

  Future<AppResult<List<ServiceCategory>>> getCategories() async {
    try {
      final raw = await SupabaseManager.getServiceCategories();
      final categories =
          raw.map((e) => ServiceCategory.fromJson(e)).toList();
      return AppResult.success(categories);
    } catch (e) {
      return AppResult.failure('Failed to load categories.');
    }
  }
}
