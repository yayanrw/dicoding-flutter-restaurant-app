// ignore_for_file: always_specify_types

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/presentation/provider/favorite_restaurants_notifier.dart';
import 'package:restaurant_app/features/presentation/provider/random_restaurant_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/home/restaurant_card.dart';
import 'package:restaurant_app/generated/l10n.dart';

class RestaurantList extends StatefulWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<FavoriteRestaurantNotifier>(context, listen: false)
          .fetchFavoriteRestaurants(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteRestaurantNotifier>(
      builder: (
        BuildContext context,
        FavoriteRestaurantNotifier data,
        Widget? child,
      ) {
        if (data.requestState == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (data.requestState == RequestState.loaded) {
          if (data.restaurants.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                final Restaurant restaurant = data.restaurants[index];
                return RestaurantCard(
                  pictureId: restaurant.pictureId,
                  name: restaurant.name,
                  city: restaurant.city,
                  image: AppsConfig.imageDir + restaurant.pictureId,
                  rating: restaurant.rating,
                  press: () {
                    context.router.push(
                      RestaurantDetailRoute(id: data.restaurants[index].id),
                    );
                  },
                );
              },
            );
          } else {
            return Center(
              child: Text(S.of(context).noRestaurantsFound),
            );
          }
        } else {
          return Center(
            key: const Key('error_message'),
            child: Text(data.message),
          );
        }
      },
    );
  }
}
