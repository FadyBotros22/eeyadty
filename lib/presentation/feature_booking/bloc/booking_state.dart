import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/booking_slot/booking_slot.dart';

part 'booking_state.freezed.dart';

@freezed
abstract class BookingState with _$BookingState {
  const factory BookingState({
    @Default(false) bool isLoadingSlots,
    @Default(false) bool isBooking,
    @Default(false) bool bookingSuccess,
    @Default([]) List<BookingSlot> slots,
    String? selectedDate,
    String? selectedSlotId,
    String? errorMessage,
  }) = _BookingState;

  factory BookingState.initial() => const BookingState();
}