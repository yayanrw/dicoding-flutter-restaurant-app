import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/cls_restaurant_detail.dart';

enum ResultState { Loading, NoData, HasData, Error }

class RestaurantDetailProvider with ChangeNotifier {
  final ApiService apiService;
  final String id;

  RestaurantDetailProvider({required this.apiService, required this.id}) {
    fetchRestaurantDetail(id);
  }

  ClsRestaurantDetail? _clsRestaurant;
  String _message = '';
  ResultState? _state;

  ClsRestaurantDetail? get result => _clsRestaurant;
  String get message => _message;
  ResultState? get state => _state;

  Future<dynamic> fetchRestaurantDetail(_id) async {
    try {
      _state = ResultState.Loading;
      notifyListeners();
      final restaurant = await apiService.fetchRestaurantDetail(_id);
      if (restaurant.restaurant.id.isEmpty) {
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
