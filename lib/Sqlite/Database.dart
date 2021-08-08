import 'package:mjam/Sqlite/OrderModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'FavoriteModel.dart';
import 'OrderModel.dart';

class DB {

  static Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, "DATABASE.db"),
      onCreate: (Database db,int version) async {
        await db.execute(
          "CREATE TABLE OrderTab(id1 INTEGER PRIMARY KEY AUTOINCREMENT, idProduct INTEGER NOT NULL, dateTime TEXT NOT NULL, nameResturant TEXT NOT NULL, nameProduct TEXT NOT NULL, priceProduct DOUBLE NOT NULL)"
        );
        await db.execute(
            "CREATE TABLE FavoriteTab(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, owner TEXT NOT NULL)"
     );

      },
      version: 1,

    );
  }

  static Future<void> deleteAllDataFromOrderList()async{
    final Database db = await initDB();
    db.delete('OrderTab');
  }

  static Future<List<FavoriteModel>> getDataFavoriteList() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> allData = await db.query('FavoriteTab');
    return allData.map((e) => FavoriteModel.fromMap(e)).toList();
  }

  static Future<List<OrderModel>> getDataOrderCard() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> allData = await db.query('OrderTab');
    return allData.map((e) => OrderModel.fromMap(e)).toList();
  }

  static Future<int> insertToFavoriteList(FavoriteModel favoriteModel) async {
    final Database db = await initDB();
    return await db.insert('FavoriteTab', favoriteModel.toMap());
  }

  static Future<int> insertToOrderCard(OrderModel orderModel) async {
    final Database db = await initDB();
    return await db.insert('OrderTab', orderModel.toMap());
  }

  static  Future<int> deleteFromFavoriteList(int id) async {
    final Database db = await initDB();
    return db.delete('FavoriteTab', where: "id=?", whereArgs: [id]);
  }

  static  Future<int> deleteFromOrderCard(int id) async {
    final Database db = await initDB();
    return db.delete('OrderTab', where: "id1=?", whereArgs: [id]);
  }

}
