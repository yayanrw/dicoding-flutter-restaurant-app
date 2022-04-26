import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/category_model.dart';
import 'package:restaurant_app/features/data/models/customer_review_model.dart';
import 'package:restaurant_app/features/data/models/menus_model.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';

class RestaurantDetailModel extends Equatable {
  RestaurantDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.rating,
    required this.categories,
    required this.menus,
    required this.customerReviews,
  });

  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final double rating;
  final List<CategoryModel> categories;
  final MenusModel menus;
  final List<CustomerReviewModel> customerReviews;

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        rating: json["rating"].toDouble(),
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
        menus: MenusModel.fromJson(json["menus"]),
        customerReviews: List<CustomerReviewModel>.from(json["customerReviews"]
            .map((x) => CustomerReviewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "city": city,
        "address": address,
        "pictureId": pictureId,
        "rating": rating,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "menus": menus.toJson(),
        "customerReviews":
            List<dynamic>.from(customerReviews.map((x) => x.toJson())),
      };

  RestaurantDetail toEntity() => RestaurantDetail(
        id: id,
        name: name,
        description: description,
        city: city,
        address: address,
        pictureId: pictureId,
        rating: rating,
        categories: categories.map((x) => x.toEntity()).toList(),
        menus: menus.toEntity(),
        customerReviews: customerReviews.map((x) => x.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        city,
        address,
        pictureId,
        rating,
        categories,
        menus,
        customerReviews,
      ];
}
