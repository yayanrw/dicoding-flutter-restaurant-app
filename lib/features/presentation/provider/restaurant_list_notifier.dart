import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/usecases/get_restaurants.dart';

@injectable
class RestaurantListNotifier extends ChangeNotifier {
  RestaurantListNotifier(this.getRestaurants);

  final GetRestaurants getRestaurants;

  String _message = '';
  RequestState _requestState = RequestState.empty;
  List<Restaurant> _restaurants = [];

  RequestState get requestState => _requestState;

  String get message => _message;

  List<Restaurant> get restaurants => _restaurants;

  Future<void> fetchRestaurants() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final result = await getRestaurants.call();

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
