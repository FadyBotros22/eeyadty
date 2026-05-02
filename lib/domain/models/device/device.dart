import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/os.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
abstract class Device with _$Device {
  const Device._();

  factory Device({
    String? id,
    required OS os,
    required String deviceId,
    String? fcmToken,
    String? language,
    String? timezone,
    String? accessToken,
    String? refreshToken,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}
