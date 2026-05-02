import 'dart:io';

import 'package:beautisry_merchant/domain/models/business_hour/business_hour.dart';
import 'package:beautisry_merchant/domain/models/employee/employee.dart';
import 'package:beautisry_merchant/domain/models/enums/service_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.sendOtp(
      {PhoneNumber? phone, required bool isValid, bool? isFromOtpScreen}) = SendOtp;
}
