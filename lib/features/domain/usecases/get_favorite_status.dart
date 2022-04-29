import 'package:dartz/dartz.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

class GetFavoriteStatus {
  final RestaurantRepository restaurantRepository;

  GetFavoriteStatus(this.restaurantRepository);

  Future<bool> call(int id) async {
    return await restaurantRepository.isAddedToFavorite(id);
  }
}
