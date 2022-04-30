// ignore_for_file: always_specify_types,
// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';

class RestaurantTable extends Equatable {
  RestaurantTable({
    required this.id,
    required this.name,
    required this.city,
    required this.pictureId,
    required this.rating,
    required this.description,
  });

  factory RestaurantTable.fromEntity(Restaurant restaurant) => RestaurantTable(
        id: restaurant.id,
        name: restaurant.name,
        city: restaurant.city,
        pictureId: restaurant.pictureId,
        rating: restaurant.rating.toString(),
        description: restaurant.description,
      );

  RestaurantTable.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    name = map['name'] as String;
    city = map['city'] as String;
    pictureId = map['pictureId'] as String;
    rating = map['rating'] as String;
    description = map['description'] as String;
  }

  late final String city;
  late final String description;
  late final String id;
  late final String name;
  late final String pictureId;
  late final String rating;

  @override
  List<Object?> get props => [id, name, city, pictureId, rating, description];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'pictureId': pictureId,
      'rating': rating,
      'description': description,
    };
  }

  Restaurant toEntity() {
    return Restaurant(
      id: id,
      name: name,
      city: city,
      pictureId: pictureId,
      rating: double.parse(rating),
      description: description,
    );
  }
}
