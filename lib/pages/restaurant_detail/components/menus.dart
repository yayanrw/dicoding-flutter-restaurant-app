import 'package:flutter/material.dart';
import 'package:restaurant_app/model/restaurant.dart';
import 'package:restaurant_app/pages/home/components/section_title.dart';
import 'package:restaurant_app/pages/home/components/special_offer_card.dart';

class Menus extends StatelessWidget {
  const Menus({
    Key? key,
    required this.menus,
    required this.rating,
  }) : super(key: key);
  final RestaurantRestaurantsMenus menus;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SectionTitle(
        text: 'Our foods',
        isMoreable: false,
        press: () {
          Navigator.pushNamed(context, 'under_construction');
        },
      ),
      SizedBox(height: 16),
      Container(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: menus.foods!.length,
          itemBuilder: (context, index) {
            return SpecialOfferCard(
                name: menus.foods![index]!.name!,
                city: "",
                image:
                    "https://images.pexels.com/photos/3026808/pexels-photo-3026808.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                rating: rating,
                press: () {});
          },
        ),
      ),
      SizedBox(height: 24),
      SectionTitle(
        text: 'Our drinks',
        isMoreable: false,
        press: () {
          Navigator.pushNamed(context, 'under_construction');
        },
      ),
      SizedBox(height: 16),
      Container(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: menus.drinks!.length,
          itemBuilder: (context, index) {
            return SpecialOfferCard(
                name: menus.drinks![index]!.name!,
                city: "",
                image:
                    "https://images.pexels.com/photos/452737/pexels-photo-452737.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                rating: rating,
                press: () {});
          },
        ),
      ),
    ]);
  }
}
