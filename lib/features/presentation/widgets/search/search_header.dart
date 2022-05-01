import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/features/presentation/provider/restaurant_search_notifier.dart';
import 'package:restaurant_app/features/presentation/widgets/home/circular_button.dart';
import 'package:restaurant_app/generated/l10n.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircularButton(
            icon: Icons.arrow_back_ios,
            isCountable: false,
            press: () {
              Navigator.pop(context);
            },
          ),
          Container(
            width: SizeConfig.screenWidth! * 0.75,
            decoration: BoxDecoration(
              color: MyColors.secondaryLight2.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Consumer<RestaurantSearchNotifier>(
              builder: (
                BuildContext context,
                RestaurantSearchNotifier data,
                Widget? child,
              ) =>
                  TextField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: S.of(context).searchRestaurants,
                  prefixIcon: Icon(
                    LineIcons.search,
                    color: MyColors.dark,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onSubmitted: (String value) {
                  Provider.of<RestaurantSearchNotifier>(context, listen: false)
                      .searchRestaurant(value);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
