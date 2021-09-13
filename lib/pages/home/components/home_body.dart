import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/pages/home/components/categories.dart';
import 'package:restaurant_app/pages/home/components/discount_banner.dart';
import 'package:restaurant_app/pages/home/components/home_header.dart';
import 'package:restaurant_app/pages/home/components/restaurant_list.dart';
import 'package:restaurant_app/pages/home/components/special_offer.dart';
import 'package:restaurant_app/provider/restaurant_provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
          ChangeNotifierProvider<RestaurantProvider>(
            create: (_) => RestaurantProvider(apiService: ApiService()),
            child: RestaurantList(),
          ),
          SizedBox(height: 24),
        ],
      ),
    ));
  }
}
