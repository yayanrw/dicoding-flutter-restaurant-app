import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/pages/home/components/section_title.dart';
import 'package:restaurant_app/pages/home/components/special_offer_card.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Our recommendations',
          isMoreable: true,
          press: () {
            Navigator.pushNamed(context, '/under_construction');
          },
        ),
        SizedBox(height: 16),
        Consumer<RestaurantProvider>(builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            return Container(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  var restaurant = state.result!.restaurants[index];
                  return SpecialOfferCard(
                      name: restaurant.name,
                      city: restaurant.city,
                      image: ApiService.imageDir + restaurant.pictureId,
                      rating: restaurant.rating,
                      press: () {
                        Navigator.pushNamed(context, '/restaurant_detail',
                            arguments: restaurant);
                      });
                },
              ),
            );
          } else if (state.state == ResultState.NoData) {
            return Center(child: Text(state.message));
          } else if (state.state == ResultState.Error) {
            return Center(child: Text("No internet connections."));
          } else {
            return Center(child: Text(''));
          }
        }),
      ],
    );
  }
}
