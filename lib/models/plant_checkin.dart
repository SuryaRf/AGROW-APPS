class PlantCheckIn {
  final String id;
  final DateTime date;
  final bool watered;
  final double height;

  PlantCheckIn({
    required this.id,
    required this.date,
    required this.watered,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'watered': watered,
      'height': height,
    };
  }

  factory PlantCheckIn.fromMap(String id, Map<String, dynamic> map) {
    return PlantCheckIn(
      id: id,
      date: DateTime.parse(map['date']),
      watered: map['watered'],
      height: map['height'],
    );
  }
}
