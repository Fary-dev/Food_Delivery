import 'package:mjam/Sqlite/OrderModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'FavoriteModel.dart';
import 'OrderModel.dart';

class DB {

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, "DATA.db"),
      onCreate: (Database db,int version) async {
        await db.execute("""
        CREATE TABLE FavoriteTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        owner TEXT NOT NULL
        )
        """);
        await db.execute("""
        CREATE TABLE OrderTable(
        ID INTEGER PRIMARY KEY AUTOINCREMENT,
        idProduct INTEGER NOT NULL,
        dateTime TEXT NOT NULL,
        nameResturant TEXT NOT NULL,
        nameProduct TEXT NOT NULL,
        priceProduct DOUBLE NOT NULL,
        )
        """);
      },
      version: 1,
    );
  }

  static Future<List<FavoriteModel>> getDataFavoriteList() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> allData = await db.query('FavoriteTable');
    return allData.map((e) => FavoriteModel.fromMap(e)).toList();
  }

  static Future<List<OrderModel>> getDataOrderCard() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> allData = await db.query('OrderTable');
    return allData.map((e) => OrderModel.fromMap(e)).toList();
  }

  static Future<int> insertToFavoriteList(FavoriteModel favoriteModel) async {
    final Database db = await initDB();
    return await db.insert('FavoriteTable', favoriteModel.toMap());
  }

  static Future<int> insertToOrderCard(OrderModel orderModel) async {
    final Database db = await initDB();
    return await db.insert('OrderTable', orderModel.toMap());
  }

  static  Future<int> deleteFromFavoriteList(int id) async {
    final Database db = await initDB();
    return db.delete('FavoriteTable', where: "id=?", whereArgs: [id]);
  }

  static  Future<int> deleteFromOrderCard(int id) async {
    final Database db = await initDB();
    return db.delete('OrderTable', where: "ID=?", whereArgs: [id]);
  }

}
