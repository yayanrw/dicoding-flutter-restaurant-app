import 'package:dartz/dartz.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

class RemoveFavorite {
  final RestaurantRepository restaurantRepository;

  RemoveFavorite(this.restaurantRepository);

  Future<Either<Failure, String>> call(String id) async {
    return await restaurantRepository.removeFavorite(id);
  }
}
