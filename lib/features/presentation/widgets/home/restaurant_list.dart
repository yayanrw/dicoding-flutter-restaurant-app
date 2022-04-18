import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/features/presentation/widgets/home/section_title.dart';

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
            context.router.push(const UnderConstructionRoute());
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
