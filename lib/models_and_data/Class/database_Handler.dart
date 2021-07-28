import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'ResturantClass.dart';

class DatabaseHandler {
  static final DatabaseHandler instance = DatabaseHandler._init();
  static Database _database;

  DatabaseHandler._init();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('favoriteRes.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      onCreate: _createDB,
      version: 1,
    );
  }

  // Create Database
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
    CREATE TABLE $tableFavoriteRes(
    ${FavoriteResFields.id} $idType,
    ${FavoriteResFields.licked} $boolType,
    ${FavoriteResFields.nameResturant} $integerType,
    )    
     ''');
  }

  //create in Database
  Future<FavoritResturantList> create(
      FavoritResturantList favoritResturantList) async {
    final db = await instance.database;

//     final json = favoritResturantList.toJson();
//     final columns =
//         '${FavoriteResFields.id}, ${FavoriteResFields.nameResturant}, ${FavoriteResFields.licked}';
//     final values =
//         '${json[FavoriteResFields.id]}, ${json[FavoriteResFields.nameResturant]}, ${json[FavoriteResFields.licked]}';
// final id=await db.rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
    final id = await db.insert(tableFavoriteRes, favoritResturantList.toJson());
    return favoritResturantList.copy(id: id);
  }

  // read from Database
  Future<FavoritResturantList> resd(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableFavoriteRes,
      columns: FavoriteResFields.values,
      where: '${FavoriteResFields.id}= ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return FavoritResturantList.fromJson(maps.first);
    } else {
      throw Exception('Id $id not found');
    }
  }

  Future<List<FavoritResturantList>> resdAll() async {
    final db = await instance.database;

    final orderBy = '${FavoriteResFields.nameResturant} ASC';
    // final result=await db.rawQuery('SELECT * FROM $tableFavoriteRes ORDER BY $orderBy');
    final result = await db.query(tableFavoriteRes, orderBy: orderBy);

    return result.map((json) => FavoritResturantList.fromJson(json)).toList();
  }

  // update Database
  Future<int> update(FavoritResturantList favoritResturantList) async {
    final db = await instance.database;

    return db.update(
      tableFavoriteRes,
      favoritResturantList.toJson(),
      where: '${FavoriteResFields.nameResturant} = ?',
      whereArgs: [FavoriteResFields.nameResturant],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableFavoriteRes,
      where: '${FavoriteResFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}

/*
late List<FavoritResturantList> favoritResturantList;
bool isLoading=false;

@override
viod dispose(){
  DatabaseHandler.instance.close();
  super.dispose();
}

Future refreshFavoriteResFields()async{
  satState(()=>isLoading=true);

  this.favoritResturantList=await DatabaseHandler.instance.resdAll();

  setState(()=>isLoading=false);
  }
*/

/*
onPressed: ()async{
  await DatabaseHandler.instance.delete(id);

}

*/
