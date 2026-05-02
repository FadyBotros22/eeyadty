import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_event.freezed.dart';

@freezed
class DoctorsEvent with _$DoctorsEvent {
  const factory DoctorsEvent.load({String? specialty}) = LoadDoctors;
  const factory DoctorsEvent.search(String query) = SearchDoctors;
  const factory DoctorsEvent.selectSpecialty(String? specialty) =
  SelectSpecialty;
}