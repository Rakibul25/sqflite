import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final _dbname = 'mydb.db';
  static final _dbversion = 1;
  static final _tablename = 'myTable';

  static final _columnId = '_id';
  static final columnName = 'name';

  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initialDatabase();
    return database;
  }

  _initialDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbname);
    await openDatabase(path, version: _dbversion, onCreate: _oncreate);
  }

  Future _oncreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tablename(
        $_columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL
      )
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tablename, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tablename);
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[_columnId];
    return await db
        .update(_tablename, row, where: '$_columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db
        .delete(_tablename, where: '$_columnId = ?', whereArgs: [id]);
  }
}
