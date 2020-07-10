import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gradecalc/models/user.dart';


class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }



  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "users.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE User ("
          "id INTEGER PRIMARY KEY,"
          "nick TEXT,"
          "username TEXT,"
          "password TEXT,"
          "instCode TEXT"
          ")");
    });
  }

  newUser(User newUser) async {
    final db = await database;
    var res = await db.insert('User', newUser.toMap());
    return res;
  }

  deleteDB() async {
    final db = await database;
    await db.delete('User');
  }

  Future<List<User>> users() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('User');
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        nick: maps[i]['nick'],
        username: maps[i]['username'],
        password: maps[i]['password'],
        instCode: maps[i]['instCode']
      );
    });
  }

  Future<List<User>> getAllPersons() async {
    final db = await database;
    var response = await db.query("User");
    List<User> list = response.map((c) => User.fromMap(c)).toList();
    print(list);
    return list;

  }
}
