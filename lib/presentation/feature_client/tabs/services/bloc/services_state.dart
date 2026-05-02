import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../domain/models/service/service.dart';

part 'services_state.freezed.dart';

@freezed
abstract class ServicesState with _$ServicesState {
  const factory ServicesState({
    @Default(false) bool isLoadingServices,
    @Default(false) bool isLoadingCategories,
    @Default([]) List<ClinicService> services,
    @Default([]) List<ClinicService> filteredServices,
    @Default([]) List<ServiceCategory> categories,
    String? selectedCategoryId,
    String? errorMessage,
    @Default('') String searchQuery,
  }) = _ServicesState;

  factory ServicesState.initial() => const ServicesState();
}
