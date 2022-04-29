import 'package:dartz/dartz.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Restaurant>>> getRestaurants();
  Future<Either<Failure, List<Restaurant>>> getRestaurantSearch(String search);
  Future<Either<Failure, RestaurantDetail>> getRestaurantDetail(String id);
}