// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Device _$DeviceFromJson(Map<String, dynamic> json) => _Device(
      id: json['id'] as String?,
      os: $enumDecode(_$OSEnumMap, json['os']),
      deviceId: json['deviceId'] as String,
      fcmToken: json['fcmToken'] as String?,
      language: json['language'] as String?,
      timezone: json['timezone'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$DeviceToJson(_Device instance) => <String, dynamic>{
      'id': instance.id,
      'os': _$OSEnumMap[instance.os]!,
      'deviceId': instance.deviceId,
      'fcmToken': instance.fcmToken,
      'language': instance.language,
      'timezone': instance.timezone,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

const _$OSEnumMap = {
  OS.IOS: 'IOS',
  OS.ANDROID: 'ANDROID',
};
