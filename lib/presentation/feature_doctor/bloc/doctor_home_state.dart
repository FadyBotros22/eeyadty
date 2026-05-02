part of 'doctor_home_bloc.dart';

abstract class DoctorHomeState {}

class DoctorHomeInitial extends DoctorHomeState {}

class DoctorHomeLoading extends DoctorHomeState {}

class DoctorHomeLoaded extends DoctorHomeState {
  final DoctorUser doctor;
  final List<DoctorAppointment> scheduleAppointments;
  final List<DoctorAppointment> recentPatients;
  final DateTime selectedDate;
  final int currentTab;

  DoctorHomeLoaded({
    required this.doctor,
    required this.scheduleAppointments,
    required this.recentPatients,
    required this.selectedDate,
    this.currentTab = 0,
  });

  DoctorHomeLoaded copyWith({
    DoctorUser? doctor,
    List<DoctorAppointment>? scheduleAppointments,
    List<DoctorAppointment>? recentPatients,
    DateTime? selectedDate,
    int? currentTab,
  }) {
    return DoctorHomeLoaded(
      doctor: doctor ?? this.doctor,
      scheduleAppointments: scheduleAppointments ?? this.scheduleAppointments,
      recentPatients: recentPatients ?? this.recentPatients,
      selectedDate: selectedDate ?? this.selectedDate,
      currentTab: currentTab ?? this.currentTab,
    );
  }
}

class DoctorHomeError extends DoctorHomeState {
  final String message;
  DoctorHomeError(this.message);
}

class DoctorHomeLoggedOut extends DoctorHomeState {}
