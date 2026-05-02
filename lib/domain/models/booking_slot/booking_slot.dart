class BookingSlot {
  final String id;
  final String date;
  final String time;
  final bool isBooked;

  const BookingSlot({
    required this.id,
    required this.date,
    required this.time,
    required this.isBooked,
  });

  factory BookingSlot.fromJson(Map<String, dynamic> json) => BookingSlot(
    id: json['id'] as String,
    date: json['date'] as String,
    time: json['time'] as String,
    isBooked: json['isBooked'] as bool? ?? false,
  );
}