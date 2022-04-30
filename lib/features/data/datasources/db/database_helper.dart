import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:restaurant_app/features/data/models/restaurant_table.dart';
import 'package:sqflite/sqflite.dart';

@lazySingleton
class DatabaseHelper {
  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  static late Database _database;
  static DatabaseHelper? _databaseHelper;
  static const String _tableName = 'restaurant';

  Future<Database> get database async {
    /// ignore: join_return_with_assignment
    _database = await _initializeDb();
    return _database;
  }

  Future<void> saveRestaurant(RestaurantTable restaurant) async {
    final Database db = await database;
    await db.insert(_tableName, restaurant.toMap());
  }

  Future<List<Map<String, dynamic>>> getFavoriteRestaurants() async {
    final Database db = await database;
    final List<Map<String, dynamic>> results = await db.query(_tableName);

    return results;
  }

  Future<void> removeRestaurant(String id) async {
    final Database db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',

      /// ignore: always_specify_types
      whereArgs: [id],
    );
  }

  Future<Map<String, dynamic>?> getRestaurantById(String id) async {
    final Database db = await database;
    final List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',

      /// ignore: always_specify_types
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<Database> _initializeDb() async {
    final String path = await getDatabasesPath();
    final Future<Database> db = openDatabase(
      join(path, 'restaurant_db.db'),
      onCreate: (Database db, int version) async {
        await db.execute(
          /// ignore: leading_newlines_in_multiline_strings
          '''CREATE TABLE $_tableName (
               id TEXT PRIMARY KEY,
               name TEXT, city TEXT,
               pictureId TEXT, rating TEXT, description TEXT
             )''',
        );
      },
      version: 1,
    );

    return db;
  }
}
