import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services_event.dart';
import 'services_state.dart';
import '../../../../../domain/repositories/service_repository.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServiceRepository _serviceRepository;

  ServicesBloc(this._serviceRepository) : super(ServicesState.initial()) {
    on<LoadServices>(_onLoadServices);
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
    on<SearchServices>(_onSearchServices);
  }

  FutureOr<void> _onLoadServices(
      LoadServices event, Emitter<ServicesState> emit) async {
    emit(state.copyWith(isLoadingServices: true, errorMessage: null));
    final result = await _serviceRepository.getServices(
        category: event.category);
    if (result.isSuccess) {
      emit(state.copyWith(
        isLoadingServices: false,
        services: result.data!,
        filteredServices: result.data!,
      ));
    } else {
      emit(state.copyWith(
          isLoadingServices: false, errorMessage: result.error));
    }
  }

  FutureOr<void> _onLoadCategories(
      LoadCategories event, Emitter<ServicesState> emit) async {
    emit(state.copyWith(isLoadingCategories: true));
    final result = await _serviceRepository.getCategories();
    if (result.isSuccess) {
      emit(state.copyWith(
          isLoadingCategories: false, categories: result.data!));
    } else {
      emit(state.copyWith(isLoadingCategories: false));
    }
  }

  FutureOr<void> _onSelectCategory(
      SelectCategory event, Emitter<ServicesState> emit) async {
    emit(state.copyWith(selectedCategoryId: event.categoryId));
    add(LoadServices(category: event.categoryId));
  }

  FutureOr<void> _onSearchServices(
      SearchServices event, Emitter<ServicesState> emit) {
    final query = event.query.toLowerCase();
    final filtered = query.isEmpty
        ? state.services
        : state.services
            .where((s) =>
                (s.name ?? '').toLowerCase().contains(query) ||
                (s.description ?? '').toLowerCase().contains(query))
            .toList();
    emit(state.copyWith(searchQuery: event.query, filteredServices: filtered));
  }
}
