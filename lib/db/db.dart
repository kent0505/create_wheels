import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/wheel.dart';

class DB {
  late Database _db;
  final String _tableName = 'wheels';

  Future<void> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'wheel.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT
            )
          ''');
      },
    );
  }

  Future<List<Wheel>> getWheels() async {
    final maps = await _db.query(_tableName);
    return maps.map((map) => Wheel.fromMap(map)).toList();
  }

  Future<void> addWheel(Wheel wheel) async {
    await _db.insert(
      _tableName,
      wheel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> editWheel(Wheel wheel) async {
    await _db.update(
      _tableName,
      wheel.toMap(),
      where: 'id = ?',
      whereArgs: [wheel.id],
    );
  }

  Future<void> deleteWheel(Wheel wheel) async {
    await _db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [wheel.id],
    );
  }

  Future<void> clearWheels() async {
    await _db.delete(_tableName);
  }
}
