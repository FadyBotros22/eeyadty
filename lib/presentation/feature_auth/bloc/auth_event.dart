import 'package:eeyadty/domain/models/enums/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn({
    required String email,
    required String password,
    required UserRole role,
  }) = AuthSignIn;

  const factory AuthEvent.signUp({
    required String email,
    required String password,
    required String fullName,
    required UserRole role,
    String? phoneNumber,
    // Doctor-only fields
    String? specialty,
    String? bio,
    double? consultationPrice,
  }) = AuthSignUp;

  const factory AuthEvent.signOut() = AuthSignOut;
}
