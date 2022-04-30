import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/domain/entities/restaurant_detail.dart';
import 'package:restaurant_app/features/presentation/widgets/home/section_title.dart';
import 'package:restaurant_app/features/presentation/widgets/home/special_offer_card.dart';

class Menus extends StatelessWidget {
  const Menus({Key? key, required this.restaurantDetail}) : super(key: key);

  final RestaurantDetail restaurantDetail;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SectionTitle(
        text: MyStrings.ourFoods,
        isMoreable: false,
        press: () {
          context.router.push(const UnderConstructionRoute());
        },
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: restaurantDetail.menus.foods.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return SpecialOfferCard(
                name: restaurantDetail.menus.foods[index].name,
                city: '',
                image: AppsConfig.imageFoodDummyUrl,
                rating: restaurantDetail.rating,
                press: () {},);
          },
        ),
      ),
      const SizedBox(height: 24),
      SectionTitle(
        text: MyStrings.ourDrinks,
        isMoreable: false,
        press: () {
          context.router.push(const UnderConstructionRoute());
        },
      ),
      const SizedBox(height: 16),
      SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: restaurantDetail.menus.drinks.length,
          itemBuilder: (BuildContext context, int index) {
            return SpecialOfferCard(
                name: restaurantDetail.menus.drinks[index].name,
                city: '',
                image: AppsConfig.imageDrinkDummyUrl,
                rating: restaurantDetail.rating,
                press: () {},);
          },
        ),
      ),
    ],);
  }
}
