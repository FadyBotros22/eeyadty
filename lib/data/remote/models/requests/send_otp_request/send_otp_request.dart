import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_otp_request.freezed.dart';
part 'send_otp_request.g.dart';

@freezed
abstract class SendOtpRequest with _$SendOtpRequest {
  const SendOtpRequest._();
  factory SendOtpRequest({required String phoneNumber}) = _SendOtpRequest;

  factory SendOtpRequest.fromJson(Map<String, dynamic> json) =>
      _$SendOtpRequestFromJson(json);
}
