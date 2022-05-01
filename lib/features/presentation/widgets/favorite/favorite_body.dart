import 'package:flutter/material.dart';
import 'package:restaurant_app/features/presentation/widgets/favorite/restaurant_list.dart';
import 'package:restaurant_app/generated/l10n.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).favoriteRestaurants),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[SizedBox(height: 24), RestaurantList()],
        ),
      ),
    );
  }
}
