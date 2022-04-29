import 'package:equatable/equatable.dart';

class RestaurantTable extends Equatable {
  late final int? id;
  late final String name;
  late final String city;
  late final String pictureId;
  late final String rating;

  RestaurantTable(
      {this.id,
      required this.name,
      required this.city,
      required this.pictureId,
      required this.rating});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'pictureId': pictureId,
      'rating': rating,
    };
  }

  RestaurantTable.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    city = map['city'];
    pictureId = map['pictureId'];
    rating = map['rating'];
  }

  @override
  List<Object?> get props => [id, name, city, pictureId, rating];
}
