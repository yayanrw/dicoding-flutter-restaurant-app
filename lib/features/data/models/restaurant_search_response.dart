import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';

RestaurantSearchResponse restaurantSearchResponseFromJson(String str) =>
    RestaurantSearchResponse.fromJson(json.decode(str));

String restaurantSearchResponseToJson(RestaurantSearchResponse data) =>
    json.encode(data.toJson());

class RestaurantSearchResponse extends Equatable {
  RestaurantSearchResponse({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  final bool error;
  final int founded;
  final List<RestaurantModel> restaurants;

  factory RestaurantSearchResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantSearchResponse(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<RestaurantModel>.from(
            json["restaurants"].map((x) => RestaurantModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "founded": founded,
        "restaurants":
            List<RestaurantModel>.from(restaurants.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [error, founded, restaurants];
}
