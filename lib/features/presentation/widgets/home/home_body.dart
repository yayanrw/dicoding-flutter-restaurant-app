import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/features/presentation/widgets/home/categories.dart';
import 'package:restaurant_app/features/presentation/widgets/home/discount_banner.dart';
import 'package:restaurant_app/features/presentation/widgets/home/home_header.dart';
import 'package:restaurant_app/features/presentation/widgets/home/restaurant_list.dart';
import 'package:restaurant_app/features/presentation/widgets/home/special_offer.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          HomeHeader(),
          SizedBox(height: 24),
          DiscountBanner(),
          SizedBox(height: 24),
          Categories(),
          SizedBox(height: 24),
          SpecialOffer(),
          SizedBox(height: 24),
          RestaurantList(),
          SizedBox(height: 24),
        ],
      ),
    ));
  }
}
