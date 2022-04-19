import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';

RestaurantListResponse restaurantListResponseFromJson(String str) =>
    RestaurantListResponse.fromJson(json.decode(str));

String restaurantListResponseToJson(RestaurantListResponse data) =>
    json.encode(data.toJson());

class RestaurantListResponse extends Equatable {
  RestaurantListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantListResponse(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };

  @override
  List<Object?> get props => [error, message, count, restaurants];
}
