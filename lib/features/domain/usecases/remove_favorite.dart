// ignore_for_file: unnecessary_await_in_return

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/features/domain/repositories/restaurant_repository.dart';

@lazySingleton
class RemoveFavorite {
  RemoveFavorite(this.restaurantRepository);

  final RestaurantRepository restaurantRepository;

  Future<Either<Failure, String>> call(String id) async {
    return await restaurantRepository.removeFavorite(id);
  }
}
