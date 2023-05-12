import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbController {
  static final DbController _instance = DbController._();
  late Database _database;

  DbController._();

  factory DbController() {
    return _instance;
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    var directory = await getDatabasesPath();
    String path = join(directory, 'app_db_sql');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version)async {
        await db.execute('CREATE TABLE quiz ('
            'id INTEGER UNSIGNED AUTO_INCREMENT, '
            'question  TEXT NOT NULL ,'
            'correctAnswer INTEGER NOT NULL,'
            'answer1 TEXT NOT NULL,'
            'answer2 TEXT NOT NULL,'
            'answer3 TEXT NOT NULL,'
            'answer4 TEXT NOT NULL,'
            'PRIMARY KEY (id)'
            ')');


      },
      onOpen: (Database db) async{},
      onUpgrade: (Database db, int oldVersion, int newVersion)async {},
      onDowngrade: (Database db, int oldVersion, int newVersion) async{},
    );
  }

}