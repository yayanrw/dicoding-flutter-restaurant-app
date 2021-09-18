import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/header.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/menus.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/restaurant_descriptions.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';

class RestaurantDetailBody extends StatelessWidget {
  final String id;
  const RestaurantDetailBody({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: ChangeNotifierProvider<RestaurantDetailProvider>(
      create: (context) =>
          RestaurantDetailProvider(apiService: ApiService(), id: id),
      child: Column(
        children: [
          Header(),
          SizedBox(height: 8),
          RestaurantDescriptions(),
          SizedBox(height: 24),
          Menus(),
          SizedBox(height: 24),
        ],
      ),
    )));
  }
}
