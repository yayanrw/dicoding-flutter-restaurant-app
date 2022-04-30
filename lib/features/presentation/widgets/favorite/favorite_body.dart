import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/presentation/widgets/favorite/restaurant_list.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyStrings.favoriteRestaurants),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[SizedBox(height: 24), RestaurantList()],
        ),
      ),
    );
  }
}
