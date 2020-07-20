import 'dart:async';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/todo_models.dart';

import 'db.dart';

class SQLiteProvider implements DbInterface {
  //Singleton
  SQLiteProvider._();
  static final SQLiteProvider db = SQLiteProvider._();

  Database _database;

  final int dbVersion = 1;
  final String dbName = 'ToDoDB.db';

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazzy initialization
    _database = await initDB();
    return _database;
  }

  @override
  Future<Database> initDB() async {
    //get patch to DB
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, dbName);

    //open DB and listen onCreate
    return await openDatabase(path, version: dbVersion, onCreate: _onCreate);
  }

  //Create DB tables
  Future<void> _onCreate(Database db, int version) async {
    //Create categories table
    await db.execute('CREATE TABLE Categories ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'title TEXT NOT NULL,'
        'icon TEXT NOT NULL'
        ')');

    //Create tasks table
    await db.execute('CREATE TABLE Items ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'category INTEGER NOT NULL,'
        'title TEXT NOT NULL,'
        'description TEXT,'
        //sqllite don't have bool type, save like integer and check, deafault 0
        'completed INTEGER DEFAULT 0 CHECK (completed IN (0,1))'
        ')');
  }

  //CRUD operations
  @override
  Future<List<Map<String, dynamic>>> select(String table,
          {bool distinct,
          List<String> columns,
          String where,
          List<dynamic> whereArgs,
          String groupBy,
          String having,
          String orderBy,
          int limit,
          int offset}) async =>
      await database.then((db) => db.query(table,
          distinct: distinct,
          columns: columns,
          where: where,
          whereArgs: whereArgs,
          groupBy: groupBy,
          having: having,
          orderBy: orderBy,
          limit: limit,
          offset: offset));

  //TODO: add catch errors

  Future<List<Map<String, dynamic>>> customSelect(String query) async =>
      await database.then((db) => db.rawQuery(query));

  @override
  Future<int> insert(String table, TodoModel model) async =>
      await database.then((db) => db.insert(table, model.toMap()));

  @override
  Future<int> update(String table, TodoModel model,
          {String where = 'id = ?'}) async =>
      await database.then((db) => db.update(table, model.toMap(),
          where: where, whereArgs: <dynamic>[model.id]));

  @override
  Future<int> delete(String table, TodoModel model,
          {String where = 'id = ?'}) async =>
      await database.then((db) =>
          db.delete(table, where: where, whereArgs: <dynamic>[model.id]));
}
