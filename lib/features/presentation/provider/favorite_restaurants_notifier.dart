import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/usecases/get_favorite_restaurants.dart';

@injectable
class FavoriteRestaurantNotifier extends ChangeNotifier {
  FavoriteRestaurantNotifier(this.getFavoriteRestaurants);

  final GetFavoriteRestaurants getFavoriteRestaurants;

  String _message = '';
  RequestState _requestState = RequestState.empty;
  List<Restaurant> _restaurants = <Restaurant>[];

  RequestState get requestState => _requestState;

  String get message => _message;

  List<Restaurant> get restaurants => _restaurants;

  Future<void> fetchFavoriteRestaurants() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final Either<Failure, List<Restaurant>> result =
        await getFavoriteRestaurants.call();

    result.fold(
      (Failure failure) {
        _requestState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (List<Restaurant> success) {
        _requestState = RequestState.loaded;
        _restaurants = success;
        notifyListeners();
      },
    );
  }
}
