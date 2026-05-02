import 'package:freezed_annotation/freezed_annotation.dart';

part 'extend_token_request.freezed.dart';
part 'extend_token_request.g.dart';

@freezed
abstract class ExtendTokenRequest with _$ExtendTokenRequest {
  const ExtendTokenRequest._();

  factory ExtendTokenRequest(
      {required String accessToken,
      required String refreshToken}) = _ExtendTokenRequest;

  factory ExtendTokenRequest.fromJson(Map<String, dynamic> json) =>
      _$ExtendTokenRequestFromJson(json);
}
