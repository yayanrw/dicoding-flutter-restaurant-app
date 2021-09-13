import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/cls_restaurant_search.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantSearchProvider({required this.apiService}) {
    fetchSearchRestaurant();
  }

  ClsRestaurantSearch? _clsRestaurant;
  String _message = '';
  ResultState? _state;

  String get message => _message;

  ClsRestaurantSearch? get result => _clsRestaurant;

  ResultState? get state => _state;

  Future<dynamic> fetchSearchRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.fetchSearchRestaurant("senja");
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
