import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../domain/models/device/device.dart';

part 'extend_token_response.freezed.dart';
part 'extend_token_response.g.dart';

@freezed
abstract class ExtendTokenResponse with _$ExtendTokenResponse {
  const ExtendTokenResponse._();

  factory ExtendTokenResponse({Device? device}) = _ExtendTokenResponse;

  factory ExtendTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$ExtendTokenResponseFromJson(json);
}
