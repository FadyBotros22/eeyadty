// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Appointment _$AppointmentFromJson(Map<String, dynamic> json) => _Appointment(
      id: json['id'] as String?,
      clientId: json['clientId'] as String?,
      doctorName: json['doctorName'] as String?,
      doctorId: json['doctorId'] as String?,
      specialty: json['specialty'] as String?,
      appointmentDate: json['appointmentDate'] as String?,
      appointmentTime: json['appointmentTime'] as String?,
      status: $enumDecodeNullable(_$AppointmentStatusEnumMap, json['status']),
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$AppointmentToJson(_Appointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'doctorName': instance.doctorName,
      'doctorId': instance.doctorId,
      'specialty': instance.specialty,
      'appointmentDate': instance.appointmentDate,
      'appointmentTime': instance.appointmentTime,
      'status': _$AppointmentStatusEnumMap[instance.status],
      'notes': instance.notes,
      'createdAt': instance.createdAt,
    };

const _$AppointmentStatusEnumMap = {
  AppointmentStatus.pending: 'pending',
  AppointmentStatus.confirmed: 'confirmed',
  AppointmentStatus.completed: 'completed',
  AppointmentStatus.cancelled: 'cancelled',
};
