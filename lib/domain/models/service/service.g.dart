// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClinicService _$ClinicServiceFromJson(Map<String, dynamic> json) =>
    _ClinicService(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      imageUrl: json['imageUrl'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      durationMinutes: (json['durationMinutes'] as num?)?.toInt(),
      isPopular: json['isPopular'] as bool? ?? false,
    );

Map<String, dynamic> _$ClinicServiceToJson(_ClinicService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'durationMinutes': instance.durationMinutes,
      'isPopular': instance.isPopular,
    };

_ServiceCategory _$ServiceCategoryFromJson(Map<String, dynamic> json) =>
    _ServiceCategory(
      id: json['id'] as String?,
      name: json['name'] as String?,
      iconName: json['iconName'] as String?,
    );

Map<String, dynamic> _$ServiceCategoryToJson(_ServiceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconName': instance.iconName,
    };
