import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/menus.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/header.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/restaurant_descriptions.dart';

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
          Header(restaurant: restaurant),
          SizedBox(height: 8),
          RestaurantDescriptions(restaurant: restaurant),
          SizedBox(height: 24),
          Menus(
            menus: restaurant.menus!,
            rating: restaurant.rating!,
          ),
          SizedBox(height: 24),
        ],
      ),
    ));
  }
}
