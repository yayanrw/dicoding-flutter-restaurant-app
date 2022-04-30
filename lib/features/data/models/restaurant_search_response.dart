// ignore_for_file: avoid_dynamic_calls, always_specify_types, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';

class RestaurantSearchResponse extends Equatable {
  RestaurantSearchResponse({this.error, this.founded, this.restaurants});

  RestaurantSearchResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'] as bool;
    founded = json['founded'] as int;
    if (json['restaurants'] != null) {
      restaurants = <RestaurantModel>[];
      json['restaurants'].forEach((v) {
        restaurants!.add(RestaurantModel.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  bool? error;
  int? founded;
  List<RestaurantModel>? restaurants;

  @override
  List<Object?> get props => [error, founded, restaurants];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['founded'] = founded;
    if (restaurants != null) {
      data['restaurants'] =
          restaurants!.map((RestaurantModel v) => v.toJson()).toList();
    }
    return data;
  }
}
