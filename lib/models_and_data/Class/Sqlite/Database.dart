import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'FavoriteModel.dart';

class DB {


  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "FAVORITE.db"),
      onCreate: (database, verison) async {
        await database.execute("""
        CREATE TABLE FavoriteTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        owner TEXT NOT NULL
        )
        """);
      },
      version: 1,
    );
  }

 static Future<int> insertData(FavoriteModel favoriteModel) async {
    final Database db = await initDB();
    return await db.insert("FavoriteTable", favoriteModel.toMap());
  }


  static Future<List<FavoriteModel>> getData() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> allData = await db.query("FavoriteTable");
    return allData.map((e) => FavoriteModel.fromMap(e)).toList();
  }


  static  Future<int> delete(int id) async {
    final Database db = await initDB();
    return db.delete("FavoriteTable", where: "id=?", whereArgs: [id]);
  }
}
