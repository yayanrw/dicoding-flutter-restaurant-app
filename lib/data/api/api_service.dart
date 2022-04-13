import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/cls_restaurant.dart';
import '../model/cls_restaurant_detail.dart';
import '../model/cls_restaurant_search.dart';

class ApiService {
  static final String _baseUrl = 'restaurant-api.dicoding.dev';
  static String imageDir = 'https://restaurant-api.dicoding.dev/images/medium/';

  Future<ClsRestaurant> fetchAllRestaurant() async {
    final response = await http.get(Uri.https(_baseUrl, "/list"));
    if (response.statusCode == 200) {
      return ClsRestaurant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<ClsRestaurantDetail> fetchRestaurantDetail(id) async {
    final response = await http.get(Uri.https(_baseUrl, "/detail/" + id));
    if (response.statusCode == 200) {
      return ClsRestaurantDetail.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<ClsRestaurantSearch> fetchSearchRestaurant(query) async {
    final response =
        await http.get(Uri.https(_baseUrl, "/search", {'q': query}));
    if (response.statusCode == 200) {
      return ClsRestaurantSearch.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
