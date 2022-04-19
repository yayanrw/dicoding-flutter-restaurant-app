import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/utils/error/exceptions.dart';
import 'package:restaurant_app/features/data/models/restaurant_detail_model.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';
import 'package:restaurant_app/features/data/models/restaurant_search_model.dart';

abstract class RestaurantRemoteDataSource {
  Future<RestaurantModel> getRestaurants();
  Future<RestaurantDetailModel> getRestaurantDetail(String id);
  Future<RestaurantSearchModel> getRestaurantSearch(String query);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final http.Client client;

  RestaurantRemoteDataSourceImpl(this.client);

  @override
  Future<RestaurantModel> getRestaurants() async {
    final response = await client.get(Uri.parse('${AppsConfig.baseUrl}/list'));

    if (response.statusCode == 200) {
      return RestaurantModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantDetailModel> getRestaurantDetail(String id) async {
    final response =
        await client.get(Uri.parse('${AppsConfig.baseUrl}/detail/$id'));

    if (response.statusCode == 200) {
      return RestaurantDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantSearchModel> getRestaurantSearch(String query) async {
    final response = await client
        .get(Uri.https(AppsConfig.baseUrl, '/search', {'q': query}));

    if (response.statusCode == 200) {
      return RestaurantSearchModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
