import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../domain/models/appointment/appointment.dart';
import 'appointments_event.dart';
import 'appointments_state.dart';
import '../../../../../domain/repositories/appointment_repository.dart';

class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  final AppointmentRepository _appointmentRepository;

  AppointmentsBloc(this._appointmentRepository)
      : super(AppointmentsState.initial()) {
    on<LoadAppointments>(_onLoad);
    on<CancelAppointment>(_onCancel);
    on<BookAppointment>(_onBook);
  }

  FutureOr<void> _onLoad(
      LoadAppointments event, Emitter<AppointmentsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _appointmentRepository.getAppointments();
    if (result.isSuccess) {
      emit(state.copyWith(isLoading: false, appointments: result.data!));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onCancel(
      CancelAppointment event, Emitter<AppointmentsState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result =
        await _appointmentRepository.cancelAppointment(event.appointmentId);
    if (result.isSuccess) {
      final updated = state.appointments
          .map((a) => a.id == event.appointmentId
              ? a.copyWith(status: AppointmentStatus.cancelled)
              : a)
          .toList();
      emit(state.copyWith(isLoading: false, appointments: updated));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onBook(
      BookAppointment event, Emitter<AppointmentsState> emit) async {
    emit(state.copyWith(isBooking: true, errorMessage: null, bookingSuccess: false));
    final result = await _appointmentRepository.bookAppointment(
      clientId: event.clientId,
      serviceId: event.serviceId,
      date: event.date,
      time: event.time,
      notes: event.notes,
      doctorId: event.doctorId,
      slotId: event.slotId,
    );
    if (result.isSuccess) {
      emit(state.copyWith(
        isBooking: false,
        bookingSuccess: true,
        // appointments: [result.data!, ...state.appointments],
      ));
    } else {
      emit(state.copyWith(isBooking: false, errorMessage: result.error));
    }
  }
}
