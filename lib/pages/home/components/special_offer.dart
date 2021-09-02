import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/home/components/section_title.dart';
import 'package:restaurant_app/pages/home/components/special_offer_card.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          text: 'Best restaurant',
          isMoreable: true,
          press: () {
            Navigator.pushNamed(context, 'under_construction');
          },
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                  name: 'Warung',
                  image: 'assets/images/restaurant.jpg',
                  numOfMenus: 10,
                  press: () {
                    Navigator.pushNamed(context, '/under_construction');
                  }),
              SpecialOfferCard(
                  name: 'Warung',
                  image: 'assets/images/restaurant.jpg',
                  numOfMenus: 10,
                  press: () {
                    Navigator.pushNamed(context, '/under_construction');
                  }),
              SpecialOfferCard(
                  name: 'Warung',
                  image: 'assets/images/restaurant.jpg',
                  numOfMenus: 10,
                  press: () {
                    Navigator.pushNamed(context, '/under_construction');
                  }),
              SpecialOfferCard(
                  name: 'Warung',
                  image: 'assets/images/restaurant.jpg',
                  numOfMenus: 10,
                  press: () {
                    Navigator.pushNamed(context, '/under_construction');
                  }),
            ],
          ),
        )
      ],
    );
  }
}
