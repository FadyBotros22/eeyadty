import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_user.freezed.dart';
part 'client_user.g.dart';

@freezed
abstract class ClientUser with _$ClientUser {
  const factory ClientUser({
    String? id,
    String? email,
    String? fullName,
    String? phoneNumber,
    String? avatarUrl,
    String? dateOfBirth,
    String? gender,
  }) = _ClientUser;

  factory ClientUser.fromJson(Map<String, dynamic> json) =>
      _$ClientUserFromJson(json);

  factory ClientUser.empty() => const ClientUser();
}
