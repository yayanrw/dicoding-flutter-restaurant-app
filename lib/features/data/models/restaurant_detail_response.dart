// ignore_for_file: must_be_immutable, always_specify_types

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/data/models/restaurant_detail_model.dart';

class RestaurantDetailResponse extends Equatable {
  RestaurantDetailResponse({this.error, this.message, this.restaurant});

  RestaurantDetailResponse.fromJson(Map<String, dynamic> json) {
    error = json['error'] as bool;
    message = json['message'] as String;
    if (json['restaurant'] != null) {
      restaurant = RestaurantDetailModel.fromJson(
        json['restaurant'] as Map<String, dynamic>,
      );
    } else {
      restaurant = null;
    }
  }

  bool? error;
  String? message;
  RestaurantDetailModel? restaurant;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    data['message'] = message;
    if (restaurant != null) {
      data['restaurant'] = restaurant!.toJson();
    }
    return data;
  }

  @override
  List<Object?> get props => [error, message, restaurant];
}
