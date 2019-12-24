import 'dart:async';
import 'package:sqflite/sqflite.dart';

final String listTable = "MonitorLists";
final String dataTable = "MonitorData";

class DataAccess {
  static final DataAccess _instance = DataAccess._internal();
  Database _monitorLists;
  Database _monitorData;

  factory DataAccess() {
    return _instance;
  }

  DataAccess._internal();

  Future open() async {
    var databasePath = await getDatabasesPath();
    String listPath = databasePath + "\\mLists.db";
    String dataPath = databasePath + "\\dList.db";

    _monitorLists = await openDatabase(listPath, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
          create table MonitorLists (
           id interger primary key autoincrement,
           listName text not null,
           unit text not null
          );
        ''');
        });

    _monitorData = await openDatabase(dataPath, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
        create table MonitorData (
          id integer primary key autoincrement,
          listId integer not null,
          value int not null,
          date date not null,
          foreign key (listId) references MonitorLists(id)
        );
      ''');
        });
  }

  Future<List<MonitorList>> getLists() async {
    var data = await _monitorLists.query("")
  }
}