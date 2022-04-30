// ignore_for_file: unnecessary_await_in_return

import 'package:injectable/injectable.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

@lazySingleton
class GetFavoriteStatus {
  GetFavoriteStatus(this.restaurantRepository);

  final RestaurantRepository restaurantRepository;

  Future<bool> call(String id) async {
    return await restaurantRepository.isAddedToFavorite(id);
  }
}
