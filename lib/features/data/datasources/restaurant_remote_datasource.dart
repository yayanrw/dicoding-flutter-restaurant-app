// ignore_for_file: always_specify_types

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/utils/error/exceptions.dart';
import 'package:restaurant_app/features/data/models/restaurant_detail_response.dart';
import 'package:restaurant_app/features/data/models/restaurant_list_response.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';
import 'package:restaurant_app/features/data/models/restaurant_search_response.dart';

abstract class RestaurantRemoteDataSource {
  Future<RestaurantListResponse> getRestaurants();

  Future<RestaurantDetailResponse> getRestaurantDetail(String id);

  Future<RestaurantSearchResponse> getRestaurantSearch(String query);

  Future<RestaurantModel> getRandomRestaurant();
}

@LazySingleton(as: RestaurantRemoteDataSource)
class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  RestaurantRemoteDataSourceImpl(this.client);

  final http.Client client;

  @override
  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final http.Response response =
        await client.get(Uri.parse('${AppsConfig.baseUrl}/detail/$id'));

    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantSearchResponse> getRestaurantSearch(String query) async {
    final http.Response response = await client.get(
      Uri.parse('${AppsConfig.baseUrl}/search')
          .replace(queryParameters: {'q': query}),
    );

    if (response.statusCode == 200) {
      return RestaurantSearchResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantListResponse> getRestaurants() async {
    final http.Response response =
        await client.get(Uri.parse('${AppsConfig.baseUrl}/list'));

    if (response.statusCode == 200) {
      return RestaurantListResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RestaurantModel> getRandomRestaurant() async {
    final http.Response response =
        await client.get(Uri.parse('${AppsConfig.baseUrl}/list'));

    if (response.statusCode == 200) {
      final List<RestaurantModel>? listRestaurant =
          RestaurantListResponse.fromJson(
        json.decode(response.body) as Map<String, dynamic>,
      ).restaurants;

      final RestaurantModel restaurantModel =
          listRestaurant![Random().nextInt(listRestaurant.length)];

      return restaurantModel;
    } else {
      throw ServerException();
    }
  }
}
