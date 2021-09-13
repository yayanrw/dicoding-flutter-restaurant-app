// To parse this JSON data, do
//
//     final clsRestaurantSearch = clsRestaurantSearchFromJson(jsonString);

import 'dart:convert';

import 'package:restaurant_app/data/model/cls_restaurant.dart';

ClsRestaurantSearch clsRestaurantSearchFromJson(String str) =>
    ClsRestaurantSearch.fromJson(json.decode(str));

class ClsRestaurantSearch {
  ClsRestaurantSearch({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  bool error;
  int founded;
  List<ClsRestaurantElement> restaurants;

  factory ClsRestaurantSearch.fromJson(Map<String, dynamic> json) =>
      ClsRestaurantSearch(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<ClsRestaurantElement>.from(
            json["restaurants"].map((x) => ClsRestaurantElement.fromJson(x))),
      );
}
