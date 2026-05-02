import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'doctors_event.dart';
import 'doctors_state.dart';
import '../../../../../domain/repositories/doctors_repository.dart';

class DoctorsBloc extends Bloc<DoctorsEvent, DoctorsState> {
  final DoctorsRepository _repository;

  DoctorsBloc(this._repository) : super(DoctorsState.initial()) {
    on<LoadDoctors>(_onLoad);
    on<SearchDoctors>(_onSearch);
    on<SelectSpecialty>(_onSelectSpecialty);
  }

  FutureOr<void> _onLoad(
      LoadDoctors event, Emitter<DoctorsState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    final result = await _repository.getDoctors(specialty: event.specialty);
    if (result.isSuccess) {
      emit(state.copyWith(
        isLoading: false,
        doctors: result.data!,
        filteredDoctors: result.data!,
      ));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onSearch(
      SearchDoctors event, Emitter<DoctorsState> emit) async {
    final query = event.query.trim();
    emit(state.copyWith(searchQuery: query));

    if (query.isEmpty) {
      // Re-use cached list — no network call needed
      emit(state.copyWith(filteredDoctors: state.doctors));
      return;
    }

    // Delegate to Supabase ilike for server-side search
    emit(state.copyWith(isLoading: true));
    final result = await _repository.searchDoctors(query);
    if (result.isSuccess) {
      emit(state.copyWith(
          isLoading: false, filteredDoctors: result.data!));
    } else {
      emit(state.copyWith(isLoading: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onSelectSpecialty(
      SelectSpecialty event, Emitter<DoctorsState> emit) {
    emit(state.copyWith(selectedSpecialty: event.specialty));
    add(LoadDoctors(specialty: event.specialty));
  }
}