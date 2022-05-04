import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/features/data/models/restaurant_list_response.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';
import 'package:restaurant_app/generated/l10n.dart';

class ApiService {
  Future<RestaurantModel> getRandomRestaurant() async {
    final http.Response response =
        await http.get(Uri.parse('${AppsConfig.baseUrl}/list'));

    if (response.statusCode == 200) {
      final List<RestaurantModel>? listRestaurant =
          RestaurantListResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).restaurants;

      final RestaurantModel restaurantModel =
          listRestaurant![Random().nextInt(listRestaurant.length)];

      return restaurantModel;
    } else {
      throw Exception(S.current.failedToLoadData);
    }
  }
}
