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
