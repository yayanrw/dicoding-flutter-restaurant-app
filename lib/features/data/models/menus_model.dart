import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/category_model.dart';
import 'package:restaurant_app/features/domain/entities/category.dart';
import 'package:restaurant_app/features/domain/entities/menus.dart';

class MenusModel extends Equatable {
  MenusModel({
    required this.foods,
    required this.drinks,
  });

  final List<CategoryModel> foods;
  final List<CategoryModel> drinks;

  factory MenusModel.fromJson(Map<String, dynamic> json) => MenusModel(
        foods: List<CategoryModel>.from(
            json["foods"].map((x) => CategoryModel.fromJson(x))),
        drinks: List<CategoryModel>.from(
            json["drinks"].map((x) => CategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };

  Menus toEntity() {
    return Menus(
      foods: List<Category>.from(
          foods.map((x) => x.toEntity())),
      drinks: List<Category>.from(
          drinks.map((x) => x.toEntity())),
    );
  }

  @override
  List<Object?> get props => [foods, drinks];
}
