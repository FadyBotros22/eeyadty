// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientUser _$ClientUserFromJson(Map<String, dynamic> json) => _ClientUser(
      id: json['id'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      gender: json['gender'] as String?,
      role: json['role'] == null
          ? UserRole.patient
          : const UserRoleConverter().fromJson(json['role'] as String),
    );

Map<String, dynamic> _$ClientUserToJson(_ClientUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'avatarUrl': instance.avatarUrl,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'role': const UserRoleConverter().toJson(instance.role),
    };
