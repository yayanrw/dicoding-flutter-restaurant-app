import 'package:flutter/material.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyStrings.favoriteRestaurants),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 24),
          
        ],
      )),
    );
  }
}
