// ignore_for_file: avoid_dynamic_calls, must_be_immutable, always_specify_types

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/category_model.dart';
import 'package:restaurant_app/features/domain/entities/menus.dart';

class MenusModel extends Equatable {
  MenusModel({this.foods, this.drinks});

  MenusModel.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <CategoryModel>[];
      json['foods'].forEach((v) {
        foods!.add(CategoryModel.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['drinks'] != null) {
      drinks = <CategoryModel>[];
      json['drinks'].forEach((v) {
        drinks!.add(CategoryModel.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  List<CategoryModel>? drinks;
  List<CategoryModel>? foods;

  Menus toEntity() {
    return Menus(
      foods: foods!.map((CategoryModel e) => e.toEntity()).toList(),
      drinks: drinks!.map((CategoryModel e) => e.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (foods != null) {
      data['foods'] = foods!.map((CategoryModel v) => v.toJson()).toList();
    }
    if (drinks != null) {
      data['drinks'] = drinks!.map((CategoryModel v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [foods, drinks];
}
