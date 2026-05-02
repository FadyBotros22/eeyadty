// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extend_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExtendTokenResponse _$ExtendTokenResponseFromJson(Map<String, dynamic> json) =>
    _ExtendTokenResponse(
      device: json['device'] == null
          ? null
          : Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtendTokenResponseToJson(
        _ExtendTokenResponse instance) =>
    <String, dynamic>{
      'device': instance.device,
    };
