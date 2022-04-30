// ignore_for_file: always_specify_types,
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';

class RestaurantModel extends Equatable {
  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      RestaurantModel(
        id: json['id'] as String,
        name: json['name'] as String,
        description: json['description'] as String,
        pictureId: json['pictureId'] as String,
        city: json['city'] as String,
        rating: json['rating'] as double,
      );

  final String city;
  final String description;
  final String id;
  final String name;
  final String pictureId;
  final double rating;

  @override
  List<Object?> get props => [id, name, description, pictureId, city, rating];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'pictureId': pictureId,
        'city': city,
        'rating': rating,
      };

  Restaurant toEntity() {
    return Restaurant(
      id: id,
      name: name,
      description: description,
      pictureId: pictureId,
      city: city,
      rating: rating,
    );
  }
}
