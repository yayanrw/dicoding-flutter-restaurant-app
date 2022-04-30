// ignore_for_file: always_specify_types, prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';

class Restaurant extends Equatable {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory Restaurant.fromRestaurantDetail(RestaurantDetail restaurant) =>
      Restaurant(
        id: restaurant.id,
        name: restaurant.name,
        city: restaurant.city,
        pictureId: restaurant.pictureId,
        rating: restaurant.rating,
        description: restaurant.description,
      );

  final String city;
  final String description;
  final String id;
  final String name;
  final String pictureId;
  final double rating;

  @override
  List<Object?> get props => [id, name, description, pictureId, city, rating];
}
