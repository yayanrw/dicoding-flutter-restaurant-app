import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/utils/error/failure.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/domain/usecases/get_favorite_status.dart';
import 'package:restaurant_app/features/domain/usecases/get_restaurant_detail.dart';
import 'package:restaurant_app/features/domain/usecases/remove_favorite.dart';
import 'package:restaurant_app/features/domain/usecases/save_favorite.dart';

@injectable
class RestaurantDetailNotifier extends ChangeNotifier {
  RestaurantDetailNotifier(
    this.getRestaurantDetail,
    this.getFavoriteStatus,
    this.saveFavorite,
    this.removeFavorite,
  );

  final GetFavoriteStatus getFavoriteStatus;
  final GetRestaurantDetail getRestaurantDetail;
  final RemoveFavorite removeFavorite;
  final SaveFavorite saveFavorite;

  bool _isFavorite = false;
  RequestState _requestState = RequestState.empty;
  RestaurantDetail? _restaurantDetail;
  String _restaurantDetailMessage = '';
  String _restaurantFavoriteMessage = '';

  String get restaurantDetailMessage => _restaurantDetailMessage;

  String get restaurantFavoriteMessage => _restaurantFavoriteMessage;

  RequestState get requestState => _requestState;

  RestaurantDetail? get restaurant => _restaurantDetail;

  bool get isFavorite => _isFavorite;

  Future<void> fetchRestaurant(String id) async {
    _requestState = RequestState.loading;
    notifyListeners();

    final Either<Failure, RestaurantDetail> result =
        await getRestaurantDetail(id);

    result.fold(
      (Failure failure) {
        _requestState = RequestState.error;
        _restaurantDetailMessage = failure.message;
        notifyListeners();
      },
      (RestaurantDetail success) {
        _requestState = RequestState.loaded;
        _restaurantDetail = success;
        notifyListeners();
      },
    );
  }

  Future<void> addToFavorite(Restaurant restaurant) async {
    final Either<Failure, String> result = await saveFavorite(restaurant);

    await result.fold(
      (Failure failure) async {
        _restaurantFavoriteMessage = failure.message;
        notifyListeners();
      },
      (String success) async {
        _restaurantFavoriteMessage = success;
        notifyListeners();
      },
    );

    await fetchFavoriteStatus(restaurant.id);
  }

  Future<void> removeFromFavorite(String id) async {
    final Either<Failure, String> result = await removeFavorite.call(id);

    await result.fold(
      (Failure failure) async {
        _restaurantFavoriteMessage = failure.message;
        notifyListeners();
      },
      (String success) async {
        _restaurantFavoriteMessage = success;
        notifyListeners();
      },
    );

    await fetchFavoriteStatus(id);
  }

  Future<void> fetchFavoriteStatus(String id) async {
    final bool result = await getFavoriteStatus.call(id);
    _isFavorite = result;
    notifyListeners();
  }
}
