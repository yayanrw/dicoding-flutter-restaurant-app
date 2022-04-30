// ignore_for_file: unnecessary_await_in_return

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

@lazySingleton
class GetRestaurantSearch {
  GetRestaurantSearch(this.restaurantRepository);

  final RestaurantRepository restaurantRepository;

  Future<Either<Failure, List<Restaurant>>> call(String search) async {
    return await restaurantRepository.getRestaurantSearch(search);
  }
}
