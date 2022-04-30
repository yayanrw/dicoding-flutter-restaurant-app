// ignore_for_file: prefer_const_constructors_in_immutables, always_specify_types

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/category.dart';

class CategoryModel extends Equatable {
  CategoryModel({
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json['name'] as String,
      );

  final String name;

  @override
  List<Object?> get props => [name];

  Map<String, dynamic> toJson() => {
        'name': name,
      };

  Category toEntity() {
    return Category(
      name: name,
    );
  }
}
