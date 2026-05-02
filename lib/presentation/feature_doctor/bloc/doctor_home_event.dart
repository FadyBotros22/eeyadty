part of 'doctor_home_bloc.dart';

abstract class DoctorHomeEvent {}

class DoctorHomeStarted extends DoctorHomeEvent {}

class DoctorHomeDateSelected extends DoctorHomeEvent {
  final DateTime date;
  DoctorHomeDateSelected(this.date);
}

class DoctorHomeTabChanged extends DoctorHomeEvent {
  final int index;
  DoctorHomeTabChanged(this.index);
}

class DoctorHomeLogoutRequested extends DoctorHomeEvent {}

/// Fired from DoctorProfileTab when the user saves edits.
class DoctorProfileUpdateRequested extends DoctorHomeEvent {
  final String? fullName;
  final String? phoneNumber;
  final String? specialty;
  final String? bio;
  final double? consultationPrice;

  DoctorProfileUpdateRequested({
    this.fullName,
    this.phoneNumber,
    this.specialty,
    this.bio,
    this.consultationPrice,
  });
}

