import 'package:restaurant_app/core/utils/error/exceptions.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/data/datasources/db/database_helper.dart';
import 'package:restaurant_app/features/data/models/restaurant_table.dart';

abstract class RestaurantLocalDataSource {
  Future<String> insertRestaurant(RestaurantTable restaurant);

  Future<String> removeRestaurant(int id);

  Future<List<RestaurantTable>> getRestaurants();
}

class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource {
  RestaurantLocalDataSourceImpl({required this.databaseHelper});

  final DatabaseHelper databaseHelper;

  @override
  Future<List<RestaurantTable>> getRestaurants() async {
    try {
      final result = await databaseHelper.getRestaurants();
      return result.map((data) => RestaurantTable.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> insertRestaurant(RestaurantTable restaurant) async {
    try {
      await databaseHelper.insertRestaurant(restaurant);
      return MyStrings.addedToFavorite;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeRestaurant(int id) async {
    try {
      await databaseHelper.removeRestaurant(id);
      return MyStrings.removedFromFavorite;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
