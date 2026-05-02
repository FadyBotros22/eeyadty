import 'package:freezed_annotation/freezed_annotation.dart';

part 'services_event.freezed.dart';

@freezed
class ServicesEvent with _$ServicesEvent {
  const factory ServicesEvent.loadServices({String? category}) = LoadServices;
  const factory ServicesEvent.loadCategories() = LoadCategories;
  const factory ServicesEvent.selectCategory(String? categoryId) =
      SelectCategory;
  const factory ServicesEvent.searchServices(String query) = SearchServices;
}
