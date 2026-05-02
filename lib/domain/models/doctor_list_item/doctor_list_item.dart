class DoctorListItem {
  final String id;
  final String name;
  final String category;
  final double price;
  final String? avatarUrl;
  final String? bio;

  const DoctorListItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.avatarUrl,
    this.bio,
  });

  factory DoctorListItem.fromJson(Map<String, dynamic> json) => DoctorListItem(
    id: json['id'] as String,
    name: json['name'] as String? ?? '',
    category: json['category'] as String? ?? '',
    price: (json['price'] as num?)?.toDouble() ?? 0.0,
    avatarUrl: json['avatar_url'] as String?,
    bio: json['bio'] as String?,
  );
}