class Wheel {
  Wheel({
    this.id = 0,
    required this.title,
    required this.date,
  });

  int id;
  String title;
  String date;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
    };
  }

  factory Wheel.fromMap(Map<String, dynamic> map) {
    return Wheel(
      id: map['id'],
      title: map['title'],
      date: map['date'],
    );
  }
}
