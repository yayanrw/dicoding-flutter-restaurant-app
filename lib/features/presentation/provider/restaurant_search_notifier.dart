import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/usecases/get_restaurant_search.dart';

@injectable
class RestaurantSearchNotifier extends ChangeNotifier {
  RestaurantSearchNotifier(this.getRestaurantSearch);

  final GetRestaurantSearch getRestaurantSearch;

  String _message = '';
  RequestState _requestState = RequestState.empty;
  List<Restaurant> _restaurants = <Restaurant>[];
  String _searchText = '';

  RequestState get requestState => _requestState;

  String get message => _message;

  List<Restaurant> get restaurants => _restaurants;

  Future<void> fetchRestaurantSearch() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final Either<Failure, List<Restaurant>> result =
        await getRestaurantSearch.call(_searchText);

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

  Future<void> searchRestaurant(String text) async {
    _searchText = text;
    notifyListeners();
    await fetchRestaurantSearch();
  }

  Future<void> setNull() async {
    _restaurants = <Restaurant>[];
    _message = '';
    notifyListeners();
  }
}
