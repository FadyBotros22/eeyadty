import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/models/doctor/doctor_appointment.dart';
import '../../../domain/models/doctor/doctor_user.dart';
import '../../../domain/repositories/doctor_repository.dart';

part 'doctor_home_event.dart';
part 'doctor_home_state.dart';

class DoctorHomeBloc extends Bloc<DoctorHomeEvent, DoctorHomeState> {
  final DoctorRepository _repo;

  DoctorHomeBloc(this._repo) : super(DoctorHomeInitial()) {
    on<DoctorHomeStarted>(_onStarted);
    on<DoctorHomeDateSelected>(_onDateSelected);
    on<DoctorHomeTabChanged>(_onTabChanged);
    on<DoctorHomeLogoutRequested>(_onLogout);
    on<DoctorProfileUpdateRequested>(_onProfileUpdate);
  }

  Future<void> _onStarted(
      DoctorHomeStarted event, Emitter<DoctorHomeState> emit) async {
    emit(DoctorHomeLoading());
    try {
      final today = DateTime.now();
      final results = await Future.wait([
        _repo.fetchProfile(),
        _repo.fetchTodayAppointments(),
        _repo.fetchRecentPatients(),
      ]);

      emit(DoctorHomeLoaded(
        doctor: results[0] as DoctorUser,
        scheduleAppointments: results[1] as List<DoctorAppointment>,
        recentPatients: results[2] as List<DoctorAppointment>,
        selectedDate: today,
      ));
    } catch (e) {
      emit(DoctorHomeError(e.toString()));
    }
  }

  Future<void> _onDateSelected(
      DoctorHomeDateSelected event, Emitter<DoctorHomeState> emit) async {
    final current = state;
    if (current is! DoctorHomeLoaded) return;

    try {
      final appointments = await _repo.fetchAppointmentsByDate(event.date);
      emit(current.copyWith(
        scheduleAppointments: appointments,
        selectedDate: event.date,
      ));
    } catch (e) {
      emit(DoctorHomeError(e.toString()));
    }
  }

  void _onTabChanged(
      DoctorHomeTabChanged event, Emitter<DoctorHomeState> emit) {
    if (state is DoctorHomeLoaded) {
      emit((state as DoctorHomeLoaded).copyWith(currentTab: event.index));
    }
  }

  Future<void> _onLogout(
      DoctorHomeLogoutRequested event, Emitter<DoctorHomeState> emit) async {
    try {
      await _repo.signOut();
      emit(DoctorHomeLoggedOut());
    } catch (e) {
      emit(DoctorHomeError(e.toString()));
    }
  }

  Future<void> _onProfileUpdate(
      DoctorProfileUpdateRequested event,
      Emitter<DoctorHomeState> emit) async {
    final current = state;
    if (current is! DoctorHomeLoaded) return;

    emit(current.copyWith(isProfileUpdating: true, profileUpdateSuccess: false));

    final updated = current.doctor.copyWith(
      fullName: event.fullName ?? current.doctor.fullName,
      phoneNumber: event.phoneNumber,
      specialty: event.specialty,
      bio: event.bio,
      consultationPrice: event.consultationPrice,
    );

    final result = await _repo.updateProfile(updated);
    if (result.isSuccess) {
      emit(current.copyWith(
        doctor: result.data!,
        isProfileUpdating: false,
        profileUpdateSuccess: true,
      ));
    } else {
      emit(current.copyWith(
        isProfileUpdating: false,
        profileUpdateError: result.error,
      ));
    }
  }
}
