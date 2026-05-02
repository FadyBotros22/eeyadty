import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load({String? userId}) = LoadProfile;
  const factory ProfileEvent.update({
    String? userId,
    String? fullName,
    String? phoneNumber,
    String? dateOfBirth,
    String? gender,
  }) = UpdateProfile;
  const factory ProfileEvent.uploadAvatar({
    String? userId,
    File? file,
  }) = UploadAvatar;

  @override
  String? get userId => throw UnimplementedError();
}
