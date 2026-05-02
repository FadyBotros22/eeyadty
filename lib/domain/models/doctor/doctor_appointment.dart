class DoctorAppointment {
  final String id;
  final String patientName;
  final String? patientPhone;
  final String? patientAvatar;
  final DateTime date;
  final AppointmentStatus status;
  final String? notes;

  const DoctorAppointment({
    required this.id,
    required this.patientName,
    required this.date,
    required this.status,
    this.patientPhone,
    this.patientAvatar,
    this.notes,
  });

  String get formattedTime {
    final h = date.hour.toString().padLeft(2, '0');
    final m = date.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String get formattedDate {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  String get formattedDateTime => '$formattedDate • $formattedTime';

  factory DoctorAppointment.fromJson(Map<String, dynamic> json) {
    final datePart = json['appointmentDate'] as String;
    final timePart = json['appointmentTime'] as String;
    final dateTime = DateTime.parse('${datePart}T$timePart');

    return DoctorAppointment(
      id: json['id'] as String,
      patientName: json['patientName'] as String? ?? 'Unknown',
      patientPhone: json['patientPhone'] as String?,
      patientAvatar: json['patientAvatar'] as String?,
      date: dateTime,
      status: AppointmentStatus.fromString(json['status'] as String? ?? ''),  // fix
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'patientName': patientName,
        'dateTime': date.toIso8601String(),
        'status': status,
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
