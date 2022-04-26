import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/usecases/get_restaurant_search.dart';

@injectable
class RestaurantSearchNotifier extends ChangeNotifier {
  RestaurantSearchNotifier(this.getRestaurantSearch);

  final GetRestaurantSearch getRestaurantSearch;

  String _message = '';
  String _searchText = '';
  RequestState _requestState = RequestState.empty;
  List<Restaurant> _restaurants = [];

  RequestState get requestState => _requestState;

  String get message => _message;

  List<Restaurant> get restaurants => _restaurants;

  set searchText(String text) {
    _searchText = text;
    notifyListeners();
    fetchRestaurantSearch();
  }

  Future<void> fetchRestaurantSearch() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final result = await getRestaurantSearch.call(_searchText);

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
