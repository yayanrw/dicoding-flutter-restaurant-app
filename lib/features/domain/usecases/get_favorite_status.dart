import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

class GetFavoriteStatus {
  final RestaurantRepository restaurantRepository;

  GetFavoriteStatus(this.restaurantRepository);

  Future<bool> call(String id) async {
    return await restaurantRepository.isAddedToFavorite(id);
  }
}
