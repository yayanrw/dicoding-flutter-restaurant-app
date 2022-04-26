import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/domain/usecases/get_restaurant_detail.dart';

class RestaurantDetailNotifier extends ChangeNotifier {
  RestaurantDetailNotifier(this.getRestaurantDetail);

  final GetRestaurantDetail getRestaurantDetail;

  String _message = '';
  RequestState _requestState = RequestState.empty;
  late RestaurantDetail _restaurantDetail;

  String get message => _message;

  RequestState get requestState => _requestState;

  RestaurantDetail get restaurant => _restaurantDetail;

  Future<void> fetchRestaurant(String id) async {
    _requestState = RequestState.loading;
    notifyListeners();

    final result = await getRestaurantDetail(id);

    result.fold(
      (failure) {
        _requestState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (success) {
        _requestState = RequestState.loaded;
        _restaurantDetail = success;
        notifyListeners();
      },
    );
  }
}
