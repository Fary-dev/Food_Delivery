import 'package:mjam/Sqlite/ExtraZutaten.dart';
import 'package:mjam/Sqlite/OrderModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'FavoriteModel.dart';
import 'OrderModel.dart';
import 'findWortModel.dart';

class DB {
  static Future<Database> initDB() async {
    try {
      String path = await getDatabasesPath();
      return openDatabase(
        join(path, "DATABASE15.db"),
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE OrderTab(id INTEGER PRIMARY KEY AUTOINCREMENT, idProduct INTEGER NOT NULL,haveZutaten INTEGER, dateTime TEXT NOT NULL, nameResturant TEXT NOT NULL, nameProduct TEXT NOT NULL, priceProduct DOUBLE NOT NULL)");
          await db.execute(
              "CREATE TABLE ExtraZutatenTab(id INTEGER PRIMARY KEY AUTOINCREMENT, nameResturant TEXT NOT NULL, orderId INTEGER, zutatenName TEXT NOT NULL, dateTime TEXT, nameProduct TEXT NOT NULL, price DOUBLE NOT NULL, FOREIGN KEY (orderId) REFERENCES OrderTab(id1))");
          await db.execute(
              "CREATE TABLE WordTab(id INTEGER PRIMARY KEY AUTOINCREMENT, word TEXT NOT NULL)");
          await db.execute(
              "CREATE TABLE FavoriteTab(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, owner TEXT NOT NULL)");
        },
        version: 1,
      );
    } on Exception catch (_) {
      print("throwing new error");
      throw Exception("Error on server");
    }
  }

  static Future<void> updateIdZutaten(ExtraZutatenModel e, int orderId) async {
    final Database db = await initDB();
    ExtraZutatenModel extraZutatenModel = ExtraZutatenModel(
        id: e.id!,
        orderId: orderId,
        dateTime: e.dateTime!,
        nameProduct: e.nameProduct,
        nameResturant: e.nameResturant,
        zutatenName: e.zutatenName,
        price: e.price);
    db.update("ExtraZutatenTab", extraZutatenModel.toMap(),
        where: 'id = ?', whereArgs: [e.id]);
  }

  static Future<void> updateOrder(OrderModel o, bool havezutaten) async {
    final Database db = await initDB();
    OrderModel orderModel = OrderModel(
        id: o.id,
        nameResturant: o.nameResturant,
        dateTime: o.dateTime,
        idProduct: o.idProduct,
        nameProduct: o.nameProduct,
        priceProduct: o.priceProduct,
        haveZutaten: havezutaten?1:0);
    db.update("ExtraZutatenTab", orderModel.toMap(),
        where: 'id = ?', whereArgs: [o.id]);
  }

  static Future<void> deleteAllDataFromExtraZutatenList() async {
    final Database db = await initDB();
    db.delete('ExtraZutatenTab');
  }

  static Future<void> deleteAllDataFromOrderList() async {
    final Database db = await initDB();
    db.delete('OrderTab');
  }

  static Future<void> deleteAllDataSearchList() async {
    final Database db = await initDB();
    db.delete('WordTab');
  }

  static Future<List<ExtraZutatenModel>> getDataExtraZutaten() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> allData =
        await db.query('ExtraZutatenTab');
    return allData.map((e) => ExtraZutatenModel.fromMap(e)).toList();
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

  static Future<List<SearchWord>> getDataSearch() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> allData = await db.query('WordTab');
    return allData.map((e) => SearchWord.fromMap(e)).toList();
  }

  static Future<int> insertToExtraZutatenList(
      ExtraZutatenModel extraZutatenModel) async {
    final Database db = await initDB();
    return await db.insert('ExtraZutatenTab', extraZutatenModel.toMap());
  }

  static Future<int> insertToFavoriteList(FavoriteModel favoriteModel) async {
    final Database db = await initDB();
    return await db.insert('FavoriteTab', favoriteModel.toMap());
  }

  static Future<int> insertToOrderCard(OrderModel orderModel) async {
    final Database db = await initDB();
    return await db.insert('OrderTab', orderModel.toMap());
  }

  static Future<int> insertSearchWord(SearchWord searchWord) async {
    final Database db = await initDB();
    return await db.insert('WordTab', searchWord.toMap());
  }

  static Future<int> deleteFromExtraZutatenList(int id) async {
    final Database db = await initDB();
    return db.delete('ExtraZutatenTab', where: "id=?", whereArgs: [id]);
  }

  static Future<int> deleteFromFavoriteList(int id) async {
    final Database db = await initDB();
    return db.delete('FavoriteTab', where: "id=?", whereArgs: [id]);
  }

  static Future<int> deleteFromOrderCard(int id) async {
    final Database db = await initDB();
    return db.delete('OrderTab', where: "id=?", whereArgs: [id]);
  }

  static Future<int> deleteSearchWord(int id) async {
    final Database db = await initDB();
    return db.delete('WordTab', where: "id=?", whereArgs: [id]);
  }
}
