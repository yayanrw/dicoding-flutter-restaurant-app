// ignore_for_file: prefer_const_constructors_in_immutables,
// ignore_for_file: always_specify_types

import 'package:equatable/equatable.dart';
import 'package:restaurant_app/features/domain/entities/customer_review.dart';

class CustomerReviewModel extends Equatable {
  CustomerReviewModel({
    required this.name,
    required this.review,
    required this.date,
  });

  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) =>
      CustomerReviewModel(
        name: json['name'] as String,
        review: json['review'] as String,
        date: json['date'] as String,
      );

  final String date;
  final String name;
  final String review;

  @override
  List<Object?> get props => [name, review, date];

  Map<String, dynamic> toJson() => {
        'name': name,
        'review': review,
        'date': date,
      };

  CustomerReview toEntity() {
    return CustomerReview(
      name: name,
      review: review,
      date: date,
    );
  }
}
