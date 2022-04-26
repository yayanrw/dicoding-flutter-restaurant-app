import 'package:flutter/material.dart';
import 'package:restaurant_app/features/presentation/widgets/search/restaurant_list.dart';
import 'package:restaurant_app/features/presentation/widgets/search/search_header.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          SearchHeader(),
          SizedBox(height: 24),
          RestaurantList(),
        ],
      ),
    ));
  }
}
