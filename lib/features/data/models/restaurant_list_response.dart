// ignore_for_file: avoid_dynamic_calls, always_specify_types, must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/restaurant_model.dart';

class RestaurantListResponse extends Equatable {
  RestaurantListResponse({
    this.error,
    this.message,
    this.count,
    this.restaurants,
  });

  RestaurantListResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'] as bool;
    message = json['message'] as String;
    count = json['count'] as int;
    if (json['restaurants'] != null) {
      restaurants = <RestaurantModel>[];
      json['restaurants'].forEach((Map<String, dynamic> v) {
        restaurants!.add(RestaurantModel.fromJson(v));
      });
    }
  }

  int? count;
  bool? error;
  String? message;
  List<RestaurantModel>? restaurants;

  @override
  List<Object?> get props => [error, message, count, restaurants];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    data['count'] = count;
    if (restaurants != null) {
      data['restaurants'] =
          restaurants!.map((RestaurantModel v) => v.toJson()).toList();
    }
    return data;
  }
}
