// ignore_for_file: avoid_dynamic_calls, always_specify_types, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/category_model.dart';
import 'package:restaurant_app/features/data/models/customer_review_model.dart';
import 'package:restaurant_app/features/data/models/menus_model.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';

class RestaurantDetailModel extends Equatable {
  RestaurantDetailModel({
    this.id,
    this.name,
    this.description,
    this.city,
    this.address,
    this.pictureId,
    this.rating,
    this.categories,
    this.menus,
    this.customerReviews,
  });

  RestaurantDetailModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    description = json['description'] as String;
    city = json['city'] as String;
    address = json['address'] as String;
    pictureId = json['pictureId'] as String;
    rating = json['rating'] as double;
    if (json['categories'] != null) {
      categories = <CategoryModel>[];
      json['categories'].forEach((v) {
        categories!.add(CategoryModel.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['menus'] != null) {
      menus = MenusModel.fromJson(json['menus'] as Map<String, dynamic>);
    } else {
      menus = null;
    }
    if (json['customerReviews'] != null) {
      customerReviews = <CustomerReviewModel>[];
      json['customerReviews'].forEach((v) {
        customerReviews!
            .add(CustomerReviewModel.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  String? address;
  List<CategoryModel>? categories;
  String? city;
  List<CustomerReviewModel>? customerReviews;
  String? description;
  String? id;
  MenusModel? menus;
  String? name;
  String? pictureId;
  double? rating;

  RestaurantDetail toEntity() {
    return RestaurantDetail(
      id: id!,
      name: name!,
      description: description!,
      city: city!,
      address: address!,
      pictureId: pictureId!,
      rating: rating!,
      categories: categories!.map((CategoryModel e) => e.toEntity()).toList(),
      menus: menus!.toEntity(),
      customerReviews: customerReviews!
          .map((CustomerReviewModel e) => e.toEntity())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['city'] = city;
    data['address'] = address;
    data['pictureId'] = pictureId;
    data['rating'] = rating;
    if (categories != null) {
      data['categories'] =
          categories!.map((CategoryModel v) => v.toJson()).toList();
    }
    if (menus != null) {
      data['menus'] = menus!.toJson();
    }
    if (customerReviews != null) {
      data['customerReviews'] =
          customerReviews!.map((CustomerReviewModel v) => v.toJson()).toList();
    }
    return data;
  }

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
