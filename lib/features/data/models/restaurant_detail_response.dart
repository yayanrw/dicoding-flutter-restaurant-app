import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/restaurant_detail_model.dart';

RestaurantDetailResponse restaurantDetailResponseFromJson(String str) =>
    RestaurantDetailResponse.fromJson(json.decode(str));

String restaurantDetailResponseToJson(RestaurantDetailResponse data) =>
    json.encode(data.toJson());

class RestaurantDetailResponse extends Equatable {
  RestaurantDetailResponse({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  final bool error;
  final String message;
  final RestaurantDetailModel restaurant;

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailResponse(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetailModel.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toJson(),
      };

  @override
  List<Object?> get props => [error, message, restaurant];
}
