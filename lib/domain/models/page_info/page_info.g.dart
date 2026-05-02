// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageInfo _$PageInfoFromJson(Map<String, dynamic> json) => _PageInfo(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      pagesCount: (json['pagesCount'] as num?)?.toInt(),
      nextPage: (json['nextPage'] as num?)?.toInt(),
      perPage: (json['perPage'] as num?)?.toInt(),
      recordsCount: (json['recordsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PageInfoToJson(_PageInfo instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'pagesCount': instance.pagesCount,
      'nextPage': instance.nextPage,
      'perPage': instance.perPage,
      'recordsCount': instance.recordsCount,
    };
