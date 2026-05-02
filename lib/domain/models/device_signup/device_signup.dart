import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/os.dart';

part 'device_signup.freezed.dart';
part 'device_signup.g.dart';

@freezed
abstract class DeviceSignup with _$DeviceSignup {
  const DeviceSignup._();

  factory DeviceSignup({
    required OS os,
    required String deviceId,
    String? fcmToken,
  }) = _DeviceSignup;

  factory DeviceSignup.fromJson(Map<String, dynamic> json) =>
      _$DeviceSignupFromJson(json);
}
