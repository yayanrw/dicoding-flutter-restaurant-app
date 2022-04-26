import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

@lazySingleton
class GetRestaurantSearch {
  final RestaurantRepository restaurantRepository;

  GetRestaurantSearch(this.restaurantRepository);

  Future<Either<Failure, List<Restaurant>>> call(String search) async {
    return await restaurantRepository.getRestaurantSearch(search);
  }
}
