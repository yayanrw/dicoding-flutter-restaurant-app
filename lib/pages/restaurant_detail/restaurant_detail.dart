import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/restaurant_detail_body.dart';

class RestaurantDetail extends StatelessWidget {
  final RestaurantRestaurants restaurant;

  const RestaurantDetail({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RestaurantDetailBody(
        restaurant: restaurant,
      ),
    );
  }
}
