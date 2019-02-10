import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:keywords_lookup/model/keyword.dart';

class DataProvider {

  final _version = 1;
  final _dbName = "db_keywords.db";
  final _keywordsTableName = 'keywords';

  Future save(Keyword keyword) async {
    var db = await _open();
    await db.insert(_keywordsTableName, keyword.toMap());
    await _close(db);
  }

  Future<List<Keyword>> fetch() async {
    var db = await _open();
    var rows = await db.query(_keywordsTableName);
    var keywords = rows.map((row) => Keyword.fromMap(row)).toList();
    await _close(db);
    return keywords;
  }

  Future<Database> _open() async {

    // DEBUG on
    await Sqflite.setDebugModeOn(true);

    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, _dbName);
    return await openDatabase(
        path,
        version: _version,
        onCreate: (Database db, int version) => _executeCreateTables(db)
    );
  }

  Future _close(Database database) async {
    await database.close();
  }

  _executeCreateTables(Database db) async {
    await db.execute('''
      CREATE TABLE $_keywordsTableName (
        _id INTEGER PRIMARY KEY AUTOINCREMENT,
        keyword TEXT NULL,
        sources TEXT NULL,
        lastUpdated INTEGER DEFAULT 0
      )
    ''');
  }
}