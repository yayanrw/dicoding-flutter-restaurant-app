import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/api/api_service.dart';
import 'restaurant_list.dart';
import 'search_header.dart';
import '../../../provider/restaurant_search_provider.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: ChangeNotifierProvider<RestaurantSearchProvider>(
        create: (context) => RestaurantSearchProvider(apiService: ApiService()),
        child: Column(
          children: [
            SizedBox(height: 24),
            SearchHeader(),
            SizedBox(height: 24),
            RestaurantList(),
          ],
        ),
      ),
    ));
  }
}
