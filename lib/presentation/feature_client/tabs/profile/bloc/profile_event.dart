import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';
import '../../../../../domain/models/enums/user_role.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  // Private const constructor exposes shared getters to the mixin
  const ProfileEvent._();

  const factory ProfileEvent.load({
    required String userId,
    required UserRole role,
  }) = LoadProfile;

  const factory ProfileEvent.update({
    required String userId,
    required UserRole role,
    String? fullName,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
    String? specialization,
    String? licenseNumber,
  }) = UpdateProfile;

  const factory ProfileEvent.uploadAvatar({
    required String userId,
    required File file,
  }) = UploadAvatar;

  @override
  // TODO: implement userId
  String get userId => throw UnimplementedError();
}