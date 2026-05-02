import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'booking_event.dart';
import 'booking_state.dart';
import '../../../../../domain/repositories/booking_repository.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository _repository;

  BookingBloc(this._repository) : super(BookingState.initial()) {
    on<LoadSlots>(_onLoadSlots);
    on<SelectDate>(_onSelectDate);
    on<SelectSlot>(_onSelectSlot);
    on<ConfirmBooking>(_onConfirm);
  }

  FutureOr<void> _onLoadSlots(
      LoadSlots event, Emitter<BookingState> emit) async {
    emit(state.copyWith(isLoadingSlots: true, errorMessage: null));
    final result = await _repository.getAvailableSlots(
      doctorId: event.doctorId,
      date: event.date,
    );
    if (result.isSuccess) {
      emit(state.copyWith(
        isLoadingSlots: false,
        slots: result.data!,
        selectedSlotId: null,
      ));
    } else {
      emit(state.copyWith(
          isLoadingSlots: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onSelectDate(
      SelectDate event, Emitter<BookingState> emit) {
    emit(state.copyWith(selectedDate: event.date, selectedSlotId: null));
  }

  FutureOr<void> _onSelectSlot(
      SelectSlot event, Emitter<BookingState> emit) {
    emit(state.copyWith(selectedSlotId: event.slotId));
  }

  FutureOr<void> _onConfirm(
      ConfirmBooking event, Emitter<BookingState> emit) async {
    emit(state.copyWith(isBooking: true, errorMessage: null));
    final result = await _repository.bookAppointment(
      clientId: event.clientId,
      doctorId: event.doctorId,
      slotId: event.slotId,
      date: event.date,
      time: event.time,
      notes: event.notes,
    );
    if (result.isSuccess) {
      emit(state.copyWith(isBooking: false, bookingSuccess: true));
    } else {
      emit(state.copyWith(isBooking: false, errorMessage: result.error));
    }
  }
}