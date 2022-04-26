import 'package:dartz/dartz.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

class GetRestaurantDetail {
  final RestaurantRepository restaurantRepository;

  GetRestaurantDetail(this.restaurantRepository);

  Future<Either<Failure, RestaurantDetail>> call(String id) async {
    return await restaurantRepository.getRestaurantDetail(id);
  }
}
