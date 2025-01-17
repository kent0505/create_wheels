import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Wheel {
  Wheel({
    required this.id,
    required this.title,
    required this.color,
    required this.answers,
  });

  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  int color;

  @HiveField(3)
  List<String> answers;
}

class WheelAdapter extends TypeAdapter<Wheel> {
  @override
  final typeId = 0;

  @override
  Wheel read(BinaryReader reader) {
    return Wheel(
      id: reader.readInt(),
      title: reader.readString(),
      color: reader.readInt(),
      answers: reader.readStringList(),
    );
  }

  @override
  void write(BinaryWriter writer, Wheel obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeInt(obj.color);
    writer.writeStringList(obj.answers);
  }
}
