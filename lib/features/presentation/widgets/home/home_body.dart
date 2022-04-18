import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/features/presentation/widgets/home/categories.dart';
import 'package:restaurant_app/features/presentation/widgets/home/discount_banner.dart';
import 'package:restaurant_app/features/presentation/widgets/home/home_header.dart';

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
          ChangeNotifierProvider<RestaurantProvider>(
            create: (_) => RestaurantProvider(apiService: ApiService()),
            child: SpecialOffer(),
          ),
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
