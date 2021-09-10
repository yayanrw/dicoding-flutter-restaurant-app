// To parse this JSON data, do
//
//     final clsRestaurantDetail = clsRestaurantDetailFromJson(jsonString);

import 'dart:convert';

ClsRestaurantDetail clsRestaurantDetailFromJson(String str) =>
    ClsRestaurantDetail.fromJson(json.decode(str));

class ClsRestaurantDetail {
  ClsRestaurantDetail({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  bool error;
  String message;
  ClsRestaurantDetailElement restaurant;

  factory ClsRestaurantDetail.fromJson(Map<String, dynamic> json) =>
      ClsRestaurantDetail(
        error: json["error"],
        message: json["message"],
        restaurant: ClsRestaurantDetailElement.fromJson(json["restaurant"]),
      );
}

class ClsRestaurantDetailElement {
  ClsRestaurantDetailElement({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  String id;
  String name;
  String description;
  String city;
  String address;
  String pictureId;
  List<ClsCategory> categories;
  ClsMenus menus;
  double rating;
  List<ClsCustomerReview> customerReviews;

  factory ClsRestaurantDetailElement.fromJson(Map<String, dynamic> json) =>
      ClsRestaurantDetailElement(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<ClsCategory>.from(
            json["categories"].map((x) => ClsCategory.fromJson(x))),
        menus: ClsMenus.fromJson(json["menus"]),
        rating: json["rating"].toDouble(),
        customerReviews: List<ClsCustomerReview>.from(
            json["customerReviews"].map((x) => ClsCustomerReview.fromJson(x))),
      );
}

class ClsCategory {
  ClsCategory({
    required this.name,
  });

  String name;

  factory ClsCategory.fromJson(Map<String, dynamic> json) => ClsCategory(
        name: json["name"],
      );
}

class ClsCustomerReview {
  ClsCustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  String name;
  String review;
  String date;

  factory ClsCustomerReview.fromJson(Map<String, dynamic> json) =>
      ClsCustomerReview(
        name: json["name"],
        review: json["review"],
        date: json["date"],
      );
}

class ClsMenus {
  ClsMenus({
    required this.foods,
    required this.drinks,
  });

  List<ClsCategory> foods;
  List<ClsCategory> drinks;

  factory ClsMenus.fromJson(Map<String, dynamic> json) => ClsMenus(
        foods: List<ClsCategory>.from(
            json["foods"].map((x) => ClsCategory.fromJson(x))),
        drinks: List<ClsCategory>.from(
            json["drinks"].map((x) => ClsCategory.fromJson(x))),
      );
}
