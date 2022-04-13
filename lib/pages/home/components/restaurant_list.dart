import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/api/api_service.dart';
import 'restaurant_card.dart';
import 'section_title.dart';
import '../../../provider/restaurant_provider.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({Key? key}) : super(key: key);

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
        Consumer<RestaurantProvider>(builder: (context, state, _) {
          if (state.state == ResultState.Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.HasData) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.result!.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = state.result!.restaurants[index];
                return RestaurantCard(
                    name: restaurant.name,
                    city: restaurant.city,
                    image: ApiService.imageDir + restaurant.pictureId,
                    rating: restaurant.rating,
                    press: () {
                      Navigator.pushNamed(context, '/restaurant_detail',
                          arguments: restaurant);
                    });
              },
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
