import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../domain/models/appointment/appointment.dart';

part 'appointments_state.freezed.dart';

@freezed
abstract class AppointmentsState with _$AppointmentsState {
  const factory AppointmentsState({
    @Default(false) bool isLoading,
    @Default(false) bool isBooking,
    @Default([]) List<Appointment> appointments,
    String? errorMessage,
    @Default(false) bool bookingSuccess,
  }) = _AppointmentsState;

  factory AppointmentsState.initial() => const AppointmentsState();
}
