// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExtendTokenRequest _$ExtendTokenRequestFromJson(Map<String, dynamic> json) =>
    _ExtendTokenRequest(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$ExtendTokenRequestToJson(_ExtendTokenRequest instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
