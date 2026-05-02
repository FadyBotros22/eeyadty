// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
