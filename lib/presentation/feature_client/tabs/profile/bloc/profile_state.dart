import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../domain/models/user/client_user.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    ClientUser? user,
    String? errorMessage,
    @Default(false) bool updateSuccess,
  }) = _ProfileState;

  factory ProfileState.initial() => const ProfileState();
}
