import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointments_event.freezed.dart';

@freezed
class AppointmentsEvent with _$AppointmentsEvent {
  const factory AppointmentsEvent.load(String clientId) = LoadAppointments;
  const factory AppointmentsEvent.cancel(String appointmentId) =
      CancelAppointment;
  const factory AppointmentsEvent.book({
    required String clientId,
    required String serviceId,
    required String date,
    required String time,
    String? notes,
  }) = BookAppointment;
}
