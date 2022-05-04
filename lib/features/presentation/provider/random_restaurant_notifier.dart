import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/usecases/get_random_restaurant.dart';

@injectable
class RandomRestaurantNotifier extends ChangeNotifier {
  RandomRestaurantNotifier(this.getRandomRestaurant);

  final GetRandomRestaurant getRandomRestaurant;

  String _message = '';
  RequestState _requestState = RequestState.empty;
  late Restaurant _restaurants;

  RequestState get requestState => _requestState;

  String get message => _message;

  Restaurant get restaurants => _restaurants;

  Future<void> fetchRandomRestaurant() async {
    _requestState = RequestState.loading;
    notifyListeners();

    final Either<Failure, Restaurant> result = await getRandomRestaurant.call();

    result.fold(
      (Failure failure) {
        _requestState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (Restaurant success) {
        _requestState = RequestState.loaded;
        _restaurants = success;
        notifyListeners();
      },
    );
  }
}
