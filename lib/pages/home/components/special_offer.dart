import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/pages/home/components/section_title.dart';
import 'package:restaurant_app/pages/home/components/special_offer_card.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Best restaurant',
          isMoreable: true,
          press: () {
            Navigator.pushNamed(context, 'under_construction');
          },
        ),
        SizedBox(height: 16),
        FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/local_restaurant.json'),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Text("Loading");
              } else {
                if (snapshot.hasError) {
                  return Text("Error");
                } else {
                  if (snapshot.hasData) {
                    final List<RestaurantRestaurants> restaurant =
                        parseBestRestaurant(jsonEncode(
                            jsonDecode(snapshot.data!)["restaurants"]));
                    return Container(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: restaurant.length,
                        itemBuilder: (context, index) {
                          return SpecialOfferCard(
                              name: restaurant[index].name!,
                              city: restaurant[index].city!,
                              image: restaurant[index].pictureId!,
                              rating: restaurant[index].rating!,
                              press: () {
                                Navigator.pushNamed(
                                    context, '/restaurant_detail',
                                    arguments: restaurant[index]);
                              });
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: Image.asset('assets/images/no_data.svg'),
                    );
                  }
                }
              }
            })
      ],
    );
  }
}
