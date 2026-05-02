import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/user/client_user.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    ClientUser? user,
    String? errorMessage,
    @Default(false) bool isSuccess,
  }) = _AuthState;

  factory AuthState.initial() => const AuthState();
}
