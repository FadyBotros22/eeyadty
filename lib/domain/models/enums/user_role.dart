enum UserRole { patient, doctor }

extension UserRoleX on UserRole {
  String get value => name; // 'patient' | 'doctor'

  static UserRole fromString(String raw) =>
      UserRole.values.firstWhere(
            (r) => r.name == raw,
        orElse: () => UserRole.patient,
      );
}