import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/features/presentation/widgets/restaurant_detail/header.dart';
import 'package:restaurant_app/features/presentation/widgets/restaurant_detail/menus.dart';
import 'package:restaurant_app/features/presentation/widgets/restaurant_detail/restaurant_descriptions.dart';

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
