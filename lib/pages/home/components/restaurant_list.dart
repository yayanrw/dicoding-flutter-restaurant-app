import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/pages/home/components/restaurant_card.dart';
import 'package:restaurant_app/pages/home/components/section_title.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  late List restaurant = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Our all restaurant',
          isMoreable: false,
          press: () {
            Navigator.pushNamed(context, 'under_construction');
          },
        ),
        SizedBox(height: 16),
        FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/local_restaurant.json'),
            builder: (context, snapshot) {
              var obj = Restaurant.fromJson(jsonDecode(snapshot.data!));
              String encodedJson = jsonEncode(obj.toJson()["restaurants"]);
              final List<RestaurantRestaurants> restaurant =
                  parseRestaurant(encodedJson);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: restaurant.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                      name: restaurant[index].name!,
                      city: restaurant[index].city!,
                      image: restaurant[index].pictureId!,
                      rating: restaurant[index].rating!,
                      press: () {});
                },
              );
            })
      ],
    );
  }
}
