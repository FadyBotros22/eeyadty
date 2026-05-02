// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_signup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceSignup _$DeviceSignupFromJson(Map<String, dynamic> json) =>
    _DeviceSignup(
      os: $enumDecode(_$OSEnumMap, json['os']),
      deviceId: json['deviceId'] as String,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$DeviceSignupToJson(_DeviceSignup instance) =>
    <String, dynamic>{
      'os': _$OSEnumMap[instance.os]!,
      'deviceId': instance.deviceId,
      'fcmToken': instance.fcmToken,
    };

const _$OSEnumMap = {
  OS.IOS: 'IOS',
  OS.ANDROID: 'ANDROID',
};
