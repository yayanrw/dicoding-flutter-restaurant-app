import 'package:path/path.dart';
import '../model/cls_restaurant_db.dart';
import 'package:sqflite/sqflite.dart';

class RestaurantDatabase {
  static RestaurantDatabase? _restaurantDatabase;
  static late Database _database;

  RestaurantDatabase._internal() {
    _restaurantDatabase = this;
  }

  factory RestaurantDatabase() =>
      _restaurantDatabase ?? RestaurantDatabase._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static String _tableName = 'restaurant';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'restaurant_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
               id INTEGER PRIMARY KEY,
               name TEXT, city TEXT,
               pictureId TEXT, rating TEXT
             )''',
        );
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertRestaurant(ClsRestaurantDb restaurant) async {
    final Database db = await database;
    await db.insert(_tableName, restaurant.toMap());
    print('Data saved');
  }

  Future<List<ClsRestaurantDb>> getRestaurant() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((res) => ClsRestaurantDb.fromMap(res)).toList();
  }

  Future<void> deleteRestaurant(int id) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
