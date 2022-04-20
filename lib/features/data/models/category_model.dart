import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [name];
}
