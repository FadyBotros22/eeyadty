import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
abstract class ClinicService with _$ClinicService {
  const factory ClinicService({
    String? id,
    String? name,
    String? description,
    String? category,
    String? imageUrl,
    double? price,
    int? durationMinutes,
    @Default(false) bool isPopular,
  }) = _ClinicService;

  factory ClinicService.fromJson(Map<String, dynamic> json) =>
      _$ClinicServiceFromJson(json);
}

@freezed
abstract class ServiceCategory with _$ServiceCategory {
  const factory ServiceCategory({
    String? id,
    String? name,
    String? iconName,
  }) = _ServiceCategory;

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryFromJson(json);
}
