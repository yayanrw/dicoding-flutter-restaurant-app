import 'package:flutter/material.dart';

class RestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  RestaurantProvider({required this.apiService}) {
    fetchAllRestaurant();
  }

  ClsRestaurant? _clsRestaurant;
  String _message = '';
  ResultState? _state;

  String get message => _message;

  ClsRestaurant? get result => _clsRestaurant;

  ResultState? get state => _state;

  Future<dynamic> fetchAllRestaurant() async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.fetchAllRestaurant();
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
