// ignore_for_file: always_specify_types

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/domain/entities/restaurant.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_list_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/home/section_title.dart';
import 'package:restaurant_app/features/presentation/widgets/home/special_offer_card.dart';
import 'package:restaurant_app/generated/l10n.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({Key? key}) : super(key: key);

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<RestaurantListNotifier>(context, listen: false)
          .fetchRestaurants(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SectionTitle(
          text: S.of(context).ourRecommendations,
          isMoreable: true,
          press: () {
            context.router.push(const UnderConstructionRoute());
          },
        ),
        const SizedBox(height: 16),
        Consumer<RestaurantListNotifier>(
          builder: (
            BuildContext context,
            RestaurantListNotifier data,
            Widget? child,
          ) {
            if (data.requestState == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.requestState == RequestState.loaded) {
              if (data.restaurants.isNotEmpty) {
                return SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      final Restaurant restaurant = data.restaurants[index];
                      return SpecialOfferCard(
                        name: restaurant.name,
                        city: restaurant.city,
                        image: AppsConfig.imageDir + restaurant.pictureId,
                        rating: restaurant.rating,
                        press: () {
                          context.router
                              .push(RestaurantDetailRoute(id: restaurant.id));
                        },
                      );
                    },
                  ),
                );
              } else {
                return Center(child: Text(S.of(context).noRestaurantsFound));
              }
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(data.message),
              );
            }
          },
        ),
      ],
    );
  }
}
