import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/category.dart';

class CategoryModel extends Equatable {
  CategoryModel({
    required this.name,
  });

  final String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };

  Category toEntity() {
    return Category(
      name: name,
    );
  }

  @override
  List<Object?> get props => [name];
}
