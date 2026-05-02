import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_event.freezed.dart';

@freezed
class BookingEvent with _$BookingEvent {
  const BookingEvent._();

  const factory BookingEvent.loadSlots({
    required String doctorId,
    required String date,
  }) = LoadSlots;

  const factory BookingEvent.selectDate(String date) = SelectDate;
  const factory BookingEvent.selectSlot(String slotId) = SelectSlot;

  const factory BookingEvent.confirm({
    required String clientId,
    required String doctorId,
    required String slotId,
    required String date,
    required String time,
    String? notes,
  }) = ConfirmBooking;
}