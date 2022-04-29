import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';

class RestaurantTable extends Equatable {
  RestaurantTable(
      {required this.id,
      required this.name,
      required this.city,
      required this.pictureId,
      required this.rating,
      required this.description});

  factory RestaurantTable.fromEntity(Restaurant restaurant) => RestaurantTable(
        id: restaurant.id,
        name: restaurant.name,
        city: restaurant.city,
        pictureId: restaurant.pictureId,
        rating: restaurant.rating.toString(),
        description: restaurant.description,
      );

  RestaurantTable.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    city = map['city'];
    pictureId = map['pictureId'];
    rating = map['rating'];
    description = map['description'];
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
      id: id.toString(),
      name: name,
      city: city,
      pictureId: pictureId,
      rating: double.parse(rating),
      description: description,
    );
  }
}
