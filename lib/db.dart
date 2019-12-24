import 'dart:async';
import 'package:sqflite/sqflite.dart';

final String scoreTable = "Score";

class DataAccess {
  static final DataAccess _instance = DataAccess._internal();
  Database _db;

  factory DataAccess() {
    return _instance;
  }

  DataAccess._internal();

  Future open() async {
    var databasePath = await getDatabasesPath();
    String path = databasePath + "\td.db";

    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      create table $scoreTable (
        score int default 0
        );
      ''');
    });
  }

  Future<int> getScore() async {
    var res = await _db.query(scoreTable);
    return res[0];
  }

  Future<void> updateScore(int s) async {
    return _db.update(scoreTable, s);
  }
}
