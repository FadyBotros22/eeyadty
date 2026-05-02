class DoctorListItem {
  final String id;
  final String name;
  final String specialty;
  final double consultationPrice;
  final String? avatarUrl;
  final String? bio;

  const DoctorListItem({
    required this.id,
    required this.name,
    required this.specialty,
    required this.consultationPrice,
    this.avatarUrl,
    this.bio,
  });

  factory DoctorListItem.fromJson(Map<String, dynamic> json) => DoctorListItem(
    id: json['id'] as String,
    name: json['name'] as String? ?? 'Fady',
    specialty: json['specialty'] as String? ?? 'General',
    consultationPrice: (json['consultationPrice'] as num?)?.toDouble() ?? 50.0,
    avatarUrl: json['avatarUrl'] as String?,
    bio: json['bio'] as String? ?? 'Doctor talateeny raye2 gedan',
  );
}