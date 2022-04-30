// ignore_for_file: always_specify_types

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/features/domain/entities/menu_categories.dart';
import 'package:restaurant_app/features/presentation/widgets/home/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppsConfig.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ...List.generate(
            menuCategories.length,
            (int index) => CategoryCard(
              press: () {
                context.router.push(const UnderConstructionRoute());
              },
              icon: menuCategories[index].icon,
              text: menuCategories[index].text,
            ),
          ),
        ],
      ),
    );
  }
}
