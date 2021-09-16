import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/pages/search/components/restaurant_list.dart';
import 'package:restaurant_app/pages/search/components/search_header.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
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
