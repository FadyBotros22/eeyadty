import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../domain/models/doctor_list_item/doctor_list_item.dart';

part 'doctors_state.freezed.dart';

@freezed
abstract class DoctorsState with _$DoctorsState {
  const factory DoctorsState({
    @Default(false) bool isLoading,
    @Default([]) List<DoctorListItem> doctors,
    @Default([]) List<DoctorListItem> filteredDoctors,
    String? selectedSpecialty,
    String? errorMessage,
    @Default('') String searchQuery,
  }) = _DoctorsState;

  factory DoctorsState.initial() => const DoctorsState();
}