import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/exceptions.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/data/datasources/db/database_helper.dart';
import 'package:restaurant_app/features/data/models/restaurant_table.dart';

abstract class RestaurantLocalDataSource {
  Future<String> saveRestaurant(RestaurantTable restaurant);

  Future<String> removeRestaurant(int id);

  Future<List<RestaurantTable>> getFavoriteRestaurants();

  Future<RestaurantTable?> getRestaurantById(int id);
}

@LazySingleton(as: RestaurantLocalDataSource)
class RestaurantLocalDataSourceImpl implements RestaurantLocalDataSource {
  RestaurantLocalDataSourceImpl({required this.databaseHelper});

  final DatabaseHelper databaseHelper;

  @override
  Future<List<RestaurantTable>> getFavoriteRestaurants() async {
    try {
      final result = await databaseHelper.getFavoriteRestaurants();
      return result.map((data) => RestaurantTable.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<RestaurantTable?> getRestaurantById(int id) async {
    final result = await databaseHelper.getResurantById(id);
    if (result != null) {
      return RestaurantTable.fromMap(result);
    } else {
      return null;
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

  @override
  Future<String> saveRestaurant(RestaurantTable restaurant) async {
    try {
      await databaseHelper.saveRestaurant(restaurant);
      return MyStrings.addedToFavorite;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
