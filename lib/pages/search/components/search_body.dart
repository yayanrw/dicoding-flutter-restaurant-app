import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/search/components/restaurant_list.dart';
import 'package:restaurant_app/pages/search/components/search_header.dart';

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
      child: Column(
        children: [
          SizedBox(height: 24),
          SearchHeader(),
          SizedBox(height: 24),
          RestaurantList()
        ],
      ),
    ));
  }
}
