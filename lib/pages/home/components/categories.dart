import 'package:flutter/material.dart';

import '../../../config/app.dart';
import 'category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
              App.menuCategories.length,
              (index) => CategoryCard(
                  press: () {
                    Navigator.pushNamed(context, '/under_construction');
                  },
                  icon: App.menuCategories[index]['icon'],
                  text: App.menuCategories[index]['text'])),
        ],
      ),
    );
  }
}
