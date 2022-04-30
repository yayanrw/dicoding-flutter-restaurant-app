// ignore_for_file: prefer_const_constructors_in_immutables,
// ignore_for_file: always_specify_types

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/category.dart';
import 'package:restaurant_app/features/domain/entities/customer_review.dart';
import 'package:restaurant_app/features/domain/entities/menus.dart';

class RestaurantDetail extends Equatable {
  RestaurantDetail({
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
  final num rating;
  final List<Category> categories;
  final Menus menus;
  final List<CustomerReview> customerReviews;

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
