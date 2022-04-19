import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/utils/error/exceptions.dart';
import 'package:restaurant_app/features/data/models/restaurant_detail_response.dart';
import 'package:restaurant_app/features/data/models/restaurant_list_response.dart';
import 'package:restaurant_app/features/data/models/restaurant_search_response.dart';

abstract class RestaurantRemoteDataSource {
  Future<RestaurantListResponse> getRestaurants();
  Future<RestaurantDetailResponse> getRestaurantDetail(String id);
  Future<RestaurantSearchResponse> getRestaurantSearch(String query);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final http.Client client;

  RestaurantRemoteDataSourceImpl(this.client);

  @override
  Future<RestaurantListResponse> getRestaurants() async {
    final response = await client.get(Uri.parse('${AppsConfig.baseUrl}/list'));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response =
        await client.get(Uri.parse('${AppsConfig.baseUrl}/detail/$id'));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantSearchResponse> getRestaurantSearch(String query) async {
    final response = await client
        .get(Uri.https(AppsConfig.baseUrl, '/search', {'q': query}));

    if (response.statusCode == 200) {
      return RestaurantSearchResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
