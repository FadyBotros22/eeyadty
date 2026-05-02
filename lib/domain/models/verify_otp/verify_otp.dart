import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_otp.freezed.dart';
part 'verify_otp.g.dart';

@freezed
abstract class VerifyOtp with _$VerifyOtp {
  const VerifyOtp._();

  factory VerifyOtp(
      {required String phoneNumber,
      required String otp,
      required String countryCode}) = _VerifyOtp;

  factory VerifyOtp.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpFromJson(json);
}
