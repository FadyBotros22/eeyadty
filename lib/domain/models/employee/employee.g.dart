// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Employee _$EmployeeFromJson(Map<String, dynamic> json) => _Employee(
      id: json['id'] as String?,
      name: json['name'] as String?,
      ar_name: json['ar_name'] as String?,
      en_name: json['en_name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      merchantId: json['merchantId'] as String?,
      imageUrl: json['imageUrl'] as String?,
      imageId: json['imageId'] as String?,
      branchId: json['branchId'] as String?,
      acceptNotifications: json['acceptNotifications'] as bool?,
      workerType: $enumDecodeNullable(_$WorkerTypeEnumMap, json['workerType']),
      isFirstTimeRegister: json['isFirstTimeRegister'] as bool?,
    );

Map<String, dynamic> _$EmployeeToJson(_Employee instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ar_name': instance.ar_name,
      'en_name': instance.en_name,
      'phoneNumber': instance.phoneNumber,
      'merchantId': instance.merchantId,
      'imageUrl': instance.imageUrl,
      'imageId': instance.imageId,
      'branchId': instance.branchId,
      'acceptNotifications': instance.acceptNotifications,
      'workerType': _$WorkerTypeEnumMap[instance.workerType],
      'isFirstTimeRegister': instance.isFirstTimeRegister,
    };

const _$WorkerTypeEnumMap = {
  WorkerType.ADMIN: 'ADMIN',
  WorkerType.EMPLOYEE: 'EMPLOYEE',
};
