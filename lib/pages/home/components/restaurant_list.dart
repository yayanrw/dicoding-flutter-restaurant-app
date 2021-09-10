import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/cls_restaurant.dart';
import 'package:restaurant_app/pages/home/components/restaurant_card.dart';
import 'package:restaurant_app/pages/home/components/section_title.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  late Future<ClsRestaurant> _restaurant;

  @override
  void initState() {
    super.initState();
    _restaurant = ApiService().fetchAllRestaurant();
  }

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
        FutureBuilder(
            future: _restaurant,
            builder: (context, AsyncSnapshot<ClsRestaurant> snapshot) {
              var state = snapshot.connectionState;
              if (state != ConnectionState.done) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data?.restaurants.length,
                    itemBuilder: (context, index) {
                      var restaurant = snapshot.data?.restaurants[index];
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
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return Text('');
                }
              }
            })
      ],
    );
  }
}
