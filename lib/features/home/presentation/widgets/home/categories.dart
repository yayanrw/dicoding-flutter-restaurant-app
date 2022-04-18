import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/features/home/presentation/widgets/home/category_card.dart';
import 'package:restaurant_app/features/others/domain/entities/menu_categories.dart';

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
        children: [
          ...List.generate(
              menuCategories.length,
              (index) => CategoryCard(
                  press: () {
                    context.router.push(const UnderConstructionRoute());
                  },
                  icon: menuCategories[index].icon,
                  text: menuCategories[index].text)),
        ],
      ),
    );
  }
}
