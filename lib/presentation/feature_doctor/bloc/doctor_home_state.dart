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
  final bool isProfileUpdating;
  final bool profileUpdateSuccess;
  final String? profileUpdateError;

  DoctorHomeLoaded({
    required this.doctor,
    required this.scheduleAppointments,
    required this.recentPatients,
    required this.selectedDate,
    this.currentTab = 0,
    this.isProfileUpdating = false,
    this.profileUpdateSuccess = false,
    this.profileUpdateError,
  });

  DoctorHomeLoaded copyWith({
    DoctorUser? doctor,
    List<DoctorAppointment>? scheduleAppointments,
    List<DoctorAppointment>? recentPatients,
    DateTime? selectedDate,
    int? currentTab,
    bool? isProfileUpdating,
    bool? profileUpdateSuccess,
    String? profileUpdateError,
  }) {
    return DoctorHomeLoaded(
      doctor: doctor ?? this.doctor,
      scheduleAppointments: scheduleAppointments ?? this.scheduleAppointments,
      recentPatients: recentPatients ?? this.recentPatients,
      selectedDate: selectedDate ?? this.selectedDate,
      currentTab: currentTab ?? this.currentTab,
      isProfileUpdating: isProfileUpdating ?? false,
      profileUpdateSuccess: profileUpdateSuccess ?? false,
      profileUpdateError: profileUpdateError,
    );
  }
}

class DoctorHomeError extends DoctorHomeState {
  final String message;
  DoctorHomeError(this.message);
}

class DoctorHomeLoggedOut extends DoctorHomeState {}
