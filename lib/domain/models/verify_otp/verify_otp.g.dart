// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VerifyOtp _$VerifyOtpFromJson(Map<String, dynamic> json) => _VerifyOtp(
      phoneNumber: json['phoneNumber'] as String,
      otp: json['otp'] as String,
      countryCode: json['countryCode'] as String,
    );

Map<String, dynamic> _$VerifyOtpToJson(_VerifyOtp instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
      'countryCode': instance.countryCode,
    };
