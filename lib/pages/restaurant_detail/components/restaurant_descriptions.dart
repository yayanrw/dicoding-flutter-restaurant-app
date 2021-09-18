import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/pages/restaurant_detail/components/chip_text.dart';
import 'package:restaurant_app/provider/restaurant_detail_provider.dart';
import 'package:restaurant_app/theme/color_theme.dart';
import 'package:restaurant_app/theme/text_theme.dart';

class RestaurantDescriptions extends StatefulWidget {
  const RestaurantDescriptions({Key? key}) : super(key: key);

  @override
  _RestaurantDescriptionsState createState() => _RestaurantDescriptionsState();
}

class _RestaurantDescriptionsState extends State<RestaurantDescriptions> {
  bool _isFavorite = false;
  bool _isMore = false;
  int _maxLine = 5;
  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.HasData) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: state.result!.restaurant.name + "\n",
                        style: textTheme(ColorTheme.secondary, FontWeight.w900)
                            .headline5,
                      ),
                      TextSpan(
                          text: state.result!.restaurant.city,
                          style:
                              textTheme(ColorTheme.secondaryLight2).bodyText2)
                    ])),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: 64,
                    decoration: BoxDecoration(
                      color:
                          _isFavorite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      LineIcons.heartAlt,
                      color:
                          _isFavorite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(state.result!.restaurant.description,
                  style: textTheme(ColorTheme.secondaryLight2).bodyText2,
                  textAlign: TextAlign.justify,
                  maxLines: _maxLine,
                  overflow: TextOverflow.ellipsis),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      _isMore = !_isMore;
                      if (_isMore) {
                        setState(() {
                          _maxLine = 1000;
                        });
                      } else {
                        setState(() {
                          _maxLine = 5;
                        });
                      }
                    });
                  },
                  child: Text(
                    _isMore ? "See less" : "See more detail",
                    style: textTheme(ColorTheme.primary, FontWeight.bold)
                        .bodyText2,
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(left: 16, top: 16),
                child: Container(
                  height: 32,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: state.result!.restaurant.categories.length,
                      itemBuilder: (context, index) {
                        return ChipText(
                            name: state
                                .result!.restaurant.categories[index].name);
                      }),
                ))
          ],
        );
      } else if (state.state == ResultState.NoData) {
        return Center(child: Text(state.message));
      } else if (state.state == ResultState.Error) {
        return Center(child: Text("No internet connections."));
      } else {
        return Center(child: Text(''));
      }
    });
  }
}
