class DoctorUser {
  final String id;
  final String fullName;
  final String email;
  final String? avatarUrl;
  final String? phoneNumber;
  final String? specialty;
  final String? bio;
  final double? consultationPrice;

  const DoctorUser({
    required this.id,
    required this.fullName,
    required this.email,
    this.avatarUrl,
    this.phoneNumber,
    this.specialty,
    this.bio,
    this.consultationPrice,
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
      fullName: json['fullName'] as String? ?? 'Doctor',
      email: json['email'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      specialty: json['specialty'] as String?,
      bio: json['bio'] as String?,
      consultationPrice: (json['consultationPrice'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'email': email,
    'avatarUrl': avatarUrl,
    'phoneNumber': phoneNumber,
    'specialty': specialty,
    'bio': bio,
    'consultationPrice': consultationPrice,
  };

  DoctorUser copyWith({
    String? id,
    String? fullName,
    String? email,
    String? avatarUrl,
    String? phoneNumber,
    String? specialty,
    String? bio,
    double? consultationPrice,
  }) {
    return DoctorUser(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      specialty: specialty ?? this.specialty,
      bio: bio ?? this.bio,
      consultationPrice: consultationPrice ?? this.consultationPrice,
    );
  }
}
