import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/cls_restaurant_search.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantSearchProvider({required this.apiService});

  ClsRestaurantSearch? _clsRestaurant;
  String _message = '';
  ResultState? _state;
  String _search = '';

  String get message => _message;
  String get search => _search;
  ClsRestaurantSearch? get result => _clsRestaurant;
  ResultState? get state => _state;

  set searchText(String text) {
    _search = text;
    notifyListeners();
    fetchSearchRestaurant(text);
  }

  Future<dynamic> fetchSearchRestaurant(_search) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.fetchSearchRestaurant(_search);
      if (restaurant.restaurants.isEmpty) {
        _state = ResultState.NoData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.HasData;
        notifyListeners();
        return _clsRestaurant = restaurant;
      }
    } catch (e) {
      _state = ResultState.Error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
