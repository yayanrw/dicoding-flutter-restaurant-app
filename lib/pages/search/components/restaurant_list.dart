import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/pages/home/components/restaurant_card.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantSearchProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.result?.restaurants.length,
          itemBuilder: (context, index) {
            var restaurant = state.result?.restaurants[index];
            return RestaurantCard(
                name: restaurant!.name,
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
    });
  }
}
