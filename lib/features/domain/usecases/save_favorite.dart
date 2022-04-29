import 'package:dartz/dartz.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

class SaveFavorite {
  final RestaurantRepository restaurantRepository;

  SaveFavorite(this.restaurantRepository);

  Future<Either<Failure, String>> call(Restaurant restaurant) async {
    return await restaurantRepository.saveFavorite(restaurant);
  }
}
