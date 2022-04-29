import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/usecases/get_favorite_restaurants.dart';

@injectable
class FavoriteRestaurantNotifier extends ChangeNotifier {
  FavoriteRestaurantNotifier(this.getFavoriteRestaurants);

  final GetFavoriteRestaurants getFavoriteRestaurants;

  String _message = '';
  RequestState _requestState = RequestState.empty;
  List<Restaurant> _restaurants = [];

  RequestState get requestState => _requestState;

  String get message => _message;

  List<Restaurant> get restaurants => _restaurants;

  Future<void> fetchFavoriteRestaurants() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final result = await getFavoriteRestaurants.call();

    result.fold(
      (failure) {
        _requestState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (success) {
        _requestState = RequestState.loaded;
        _restaurants = success;
        notifyListeners();
      },
    );
  }
}
