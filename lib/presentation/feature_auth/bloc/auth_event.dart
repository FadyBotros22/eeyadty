import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn({
    required String email,
    required String password,
  }) = AuthSignIn;

  const factory AuthEvent.signUp({
    required String email,
    required String password,
    required String fullName,
    String? phoneNumber,
  }) = AuthSignUp;

  const factory AuthEvent.signOut() = AuthSignOut;
}
