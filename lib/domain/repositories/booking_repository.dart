import '../models/booking_slot/booking_slot.dart';
import '../utils/app_result.dart';
import '../../data/remote/supabase/supabase_manager.dart';

class BookingRepository {
  Future<AppResult<List<BookingSlot>>> getAvailableSlots({
    required String doctorId,
    required String date,
  }) async {
    try {
      final raw = await SupabaseManager.getAvailableSlots(
        doctorId: doctorId,
        date: date,
      );
      return AppResult.success(
          raw.map(BookingSlot.fromJson).toList());
    } catch (e) {
      return AppResult.failure('Failed to load slots.');
    }
  }

  Future<AppResult<void>> bookAppointment({
    required String clientId,
    required String doctorId,
    required String slotId,
    required String date,
    required String time,
    String? notes,
  }) async {
    try {
      await SupabaseManager.bookAppointment(
        doctorId: doctorId,
        slotId: slotId,
        date: date,
        time: time,
        notes: notes,
      );
      return AppResult.success(null);
    } catch (e) {
      return AppResult.failure('Failed to book appointment.');
    }
  }
}