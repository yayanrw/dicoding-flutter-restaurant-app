// ignore_for_file: always_specify_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_search_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/search/restaurant_list.dart';
import 'package:restaurant_app/features/presentation/widgets/search/search_header.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<RestaurantSearchNotifier>(context, listen: false).setNull();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            SizedBox(height: 24),
            SearchHeader(),
            SizedBox(height: 24),
            RestaurantList(),
          ],
        ),
      ),
    );
  }
}
