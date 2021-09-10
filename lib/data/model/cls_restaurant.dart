// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

ClsRestaurant restaurantFromJson(String str) =>
    ClsRestaurant.fromJson(json.decode(str));

class ClsRestaurant {
  ClsRestaurant({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  bool error;
  String message;
  int count;
  List<ClsRestaurantElement> restaurants;

  factory ClsRestaurant.fromJson(Map<String, dynamic> json) => ClsRestaurant(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<ClsRestaurantElement>.from(
            json["restaurants"].map((x) => ClsRestaurantElement.fromJson(x))),
      );
}

class ClsRestaurantElement {
  ClsRestaurantElement({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;

  factory ClsRestaurantElement.fromJson(Map<String, dynamic> json) =>
      ClsRestaurantElement(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
      );
}
