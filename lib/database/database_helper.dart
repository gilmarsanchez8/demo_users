import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._internal();
  static DatabaseHelper get instance => _databaseHelper ??= DatabaseHelper._internal();

  Database? _db;
  Database get db => _db!;

  Future<void> init() async{
    _db = await openDatabase('database.db', version: 1, onCreate: (db, version){
      db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(50), lastname varchar(50), birthdate varchar(20), address varchar(100))');
    });
  }
}