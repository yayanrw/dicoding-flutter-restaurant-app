import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/core/utils/request_state.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_list_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/home/section_title.dart';
import 'package:restaurant_app/features/presentation/widgets/home/special_offer_card.dart';

class SpecialOffer extends StatefulWidget {
  const SpecialOffer({Key? key}) : super(key: key);

  @override
  State<SpecialOffer> createState() => _SpecialOfferState();
}

class _SpecialOfferState extends State<SpecialOffer> {
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
          text: MyStrings.ourRecommendations,
          isMoreable: true,
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
              return Container(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    var restaurant = data.restaurants[index];
                    return SpecialOfferCard(
                        name: restaurant.name,
                        city: restaurant.city,
                        image: AppsConfig.imageDir + restaurant.pictureId,
                        rating: restaurant.rating,
                        press: () {
                          context.router
                              .push(RestaurantDetailRoute(id: restaurant.id));
                        });
                  },
                ),
              );
            } else {
              return Center(child: Text(MyStrings.noRestaurants));
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
