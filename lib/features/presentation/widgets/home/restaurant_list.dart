import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_list_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/home/restaurant_card.dart';
import 'package:restaurant_app/features/presentation/widgets/home/section_title.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<RestaurantListNotifier>(context, listen: false)
            .fetchRestaurants());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: MyStrings.ourAllRestaurants,
          isMoreable: false,
          press: () {
            context.router.push(const UnderConstructionRoute());
          },
        ),
        SizedBox(height: 16),
        Consumer<RestaurantListNotifier>(builder: (context, data, child) {
          if (data.requestState == RequestState.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (data.requestState == RequestState.loaded) {
            if (data.restaurants.length > 0) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = data.restaurants[index];
                  return RestaurantCard(
                      name: restaurant.name,
                      city: restaurant.city,
                      image: AppsConfig.imageDir + restaurant.pictureId,
                      rating: restaurant.rating,
                      press: () {
                        context.router
                            .push(RestaurantDetailRoute(id: restaurant.id));
                      });
                },
              );
            } else {
              return Center(
                child: Text(MyStrings.noRestaurants),
              );
            }
          } else {
            return Center(
              key: Key('error_message'),
              child: Text(data.message),
            );
          }
        }),
      ],
    );
  }
}
