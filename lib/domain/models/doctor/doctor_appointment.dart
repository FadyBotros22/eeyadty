class DoctorAppointment {
  final String id;
  final String patientName;
  final DateTime dateTime;
  final AppointmentStatus status;

  const DoctorAppointment({
    required this.id,
    required this.patientName,
    required this.dateTime,
    required this.status,
  });

  String get formattedTime {
    final h = dateTime.hour.toString().padLeft(2, '0');
    final m = dateTime.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String get formattedDate {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[dateTime.month - 1]} ${dateTime.day}, ${dateTime.year}';
  }

  String get formattedDateTime => '${formattedDate} • ${formattedTime}';

  factory DoctorAppointment.fromJson(Map<String, dynamic> json) {
    return DoctorAppointment(
      id: json['id'] as String,
      patientName: json['patient_name'] as String,
      dateTime: DateTime.parse(json['date_time'] as String),
      status: AppointmentStatus.fromString(json['status'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'patient_name': patientName,
        'date_time': dateTime.toIso8601String(),
        'status': status.value,
      };
}

enum AppointmentStatus {
  confirmed,
  completed,
  cancelled,
  pending;

  static AppointmentStatus fromString(String v) {
    switch (v) {
      case 'confirmed':
        return AppointmentStatus.confirmed;
      case 'completed':
        return AppointmentStatus.completed;
      case 'cancelled':
        return AppointmentStatus.cancelled;
      default:
        return AppointmentStatus.pending;
    }
  }

  String get value => name;

  String get label {
    switch (this) {
      case AppointmentStatus.confirmed:
        return 'Confirmed';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      case AppointmentStatus.pending:
        return 'Pending';
    }
  }
}
