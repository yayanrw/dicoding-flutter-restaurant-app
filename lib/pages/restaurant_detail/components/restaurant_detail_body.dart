import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/restaurant_pict.dart';

class RestaurantDetailBody extends StatelessWidget {
  final RestaurantRestaurants restaurant;

  const RestaurantDetailBody({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          RestaurantPict(restaurant: restaurant),
        ],
      ),
    ));
  }
}
