import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/pages/home/components/circular_button.dart';
import 'package:restaurant_app/provider/restaurant_search_provider.dart';
import 'package:restaurant_app/theme/color_theme.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({Key? key}) : super(key: key);

  @override
  _SearchHeaderState createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
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
                color: ColorTheme.secondaryLight2.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16)),
            child: Consumer<RestaurantSearchProvider>(
              builder: (context, state, _) => TextField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "Search restaurant...",
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
