import 'package:freezed_annotation/freezed_annotation.dart';
import '../service/service.dart';

part 'appointment.freezed.dart';
part 'appointment.g.dart';

enum AppointmentStatus { pending, confirmed, completed, cancelled }

@freezed
abstract class Appointment with _$Appointment {
  const factory Appointment({
    String? id,
    String? clientId,
    String? serviceId,
    ClinicService? service,
    String? appointmentDate,
    String? appointmentTime,
    AppointmentStatus? status,
    String? notes,
    String? createdAt,
  }) = _Appointment;

  factory Appointment.fromJson(Map<String, dynamic> json) =>
      _$AppointmentFromJson(json);
}

extension AppointmentStatusX on AppointmentStatus {
  String get label {
    switch (this) {
      case AppointmentStatus.pending:
        return 'Pending';
      case AppointmentStatus.confirmed:
        return 'Confirmed';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
    }
  }
}
