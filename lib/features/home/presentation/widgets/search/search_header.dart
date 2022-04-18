import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/core/utils/size_config.dart';
import 'package:restaurant_app/features/home/presentation/widgets/home/circular_button.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
                borderRadius: BorderRadius.circular(16)),
            child: Consumer<RestaurantSearchProvider>(
              builder: (context, state, _) => TextField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: MyStrings.searchRestaurants,
                    prefixIcon: Icon(LineIcons.search),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                onSubmitted: (value) {
                  state.searchText = value;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}