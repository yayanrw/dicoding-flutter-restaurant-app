import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

import '../../../data/api/api_service.dart';
import '../../../core/utils/size_config.dart';
import '../../../provider/restaurant_detail_provider.dart';
import '../../../theme/color_theme.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantDetailProvider>(builder: (context, state, _) {
      if (state.state == ResultState.Loading) {
        return Text("");
      } else if (state.state == ResultState.HasData) {
        return Container(
          width: SizeConfig.screenWidth! * 1,
          height: 250,
          child: ClipRRect(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  ApiService.imageDir + state.result!.restaurant.pictureId,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        ColorTheme.secondary2.withOpacity(0.4),
                        ColorTheme.secondary2.withOpacity(0.15),
                      ])),
                ),
                Positioned(
                    top: 16,
                    left: 16,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                    )),
                Positioned(
                    top: 20,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 5),
                          Text(
                            state.result!.restaurant.rating.toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            LineIcons.starAlt,
                            size: 18,
                            color: ColorTheme.primaryDark,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        );
      } else if (state.state == ResultState.NoData) {
        return Text("");
      } else if (state.state == ResultState.Error) {
        return Text("");
      } else {
        return Center(child: Text(""));
      }
    });
  }
}
