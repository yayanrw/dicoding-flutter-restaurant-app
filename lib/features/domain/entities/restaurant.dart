import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  Restaurant(
      {required this.id,
      required this.name,
      required this.description,
      required this.pictureId,
      required this.city,
      required this.rating});

  final String city;
  final String description;
  final String id;
  final String name;
  final String pictureId;
  final double rating;

  @override
  List<Object?> get props => [id, name, description, pictureId, city, rating];
}
