// ignore_for_file: always_specify_types

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/category.dart';

class Menus extends Equatable {
  const Menus({
    required this.foods,
    required this.drinks,
  });

  final List<Category> foods;
  final List<Category> drinks;

  @override
  List<Object?> get props => [foods, drinks];
}
