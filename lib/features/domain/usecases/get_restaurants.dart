import 'package:dartz/dartz.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

class GetRestaurants {
  final RestaurantRepository restaurantRepository;

  GetRestaurants(this.restaurantRepository);

  Future<Either<Failure, List<Restaurant>>> call() async {
    return await restaurantRepository.getRestaurants();
  }
}
