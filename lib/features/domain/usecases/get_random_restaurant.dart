import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

@lazySingleton
class GetRandomRestaurant {
  GetRandomRestaurant(this.restaurantRepository);

  final RestaurantRepository restaurantRepository;

  Future<Either<Failure, Restaurant>> call() async {
    return restaurantRepository.getRandomRestaurant();
  }
}
