class DoctorUser {
  final String id;
  final String fullName;
  final String email;
  final String? avatarUrl;

  const DoctorUser({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarUrl,
  });

  String get initials {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return 'D';
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  static DoctorUser empty() => const DoctorUser(
        id: '',
        fullName: 'Doctor',
        email: '',
      );

  factory DoctorUser.fromJson(Map<String, dynamic> json) {
    return DoctorUser(
      id: json['id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? 'Doctor',
      email: json['email'] as String? ?? '',
      avatarUrl: json['avatar_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'full_name': fullName,
        'email': email,
        'avatar_url': avatarUrl,
      };
}
