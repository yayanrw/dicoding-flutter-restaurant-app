import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/pages/home/components/section_title.dart';
import 'package:restaurant_app/pages/home/components/special_offer_card.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';

class Menus extends StatelessWidget {
  const Menus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Text("");
      } else if (state.state == ResultState.HasData) {
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
              itemCount: state.result!.restaurant.menus.foods.length,
              itemBuilder: (context, index) {
                return SpecialOfferCard(
                    name: state.result!.restaurant.menus.foods[index].name,
                    city: "",
                    image:
                        "https://images.pexels.com/photos/3026808/pexels-photo-3026808.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    rating: state.result!.restaurant.rating,
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
              itemCount: state.result!.restaurant.menus.drinks.length,
              itemBuilder: (context, index) {
                return SpecialOfferCard(
                    name: state.result!.restaurant.menus.drinks[index].name,
                    city: "",
                    image:
                        "https://images.pexels.com/photos/452737/pexels-photo-452737.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    rating: state.result!.restaurant.rating,
                    press: () {});
              },
            ),
          ),
        ]);
      } else if (state.state == ResultState.NoData) {
        return Text("");
      } else if (state.state == ResultState.Error) {
        return Text("");
      } else {
        return Text("");
      }
    });
  }
}
