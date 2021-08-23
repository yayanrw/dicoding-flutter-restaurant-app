import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/helper/theme/color_theme.dart';
import 'package:restaurant_app/helper/theme/text_theme.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.numOfMenus,
      required this.press})
      : super(key: key);

  final String name, image;
  final int numOfMenus;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: 260,
          height: 130,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset('assets/images/restaurant.jpg', fit: BoxFit.cover),
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "$name\n",
                          style: textTheme(Colors.white, FontWeight.w700)
                              .headline6,
                        ),
                        TextSpan(
                            text: '10',
                            style: textTheme(Colors.white, FontWeight.w700)
                                .caption,
                            children: [
                              TextSpan(
                                  text: ' foods and ',
                                  style:
                                      textTheme(Colors.white, FontWeight.w500)
                                          .caption,
                                  children: [
                                    TextSpan(
                                        text: '15',
                                        style: textTheme(
                                                Colors.white, FontWeight.w700)
                                            .caption,
                                        children: [
                                          TextSpan(
                                              text: ' drinks',
                                              style: textTheme(Colors.white,
                                                      FontWeight.w500)
                                                  .caption)
                                        ])
                                  ])
                            ]),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 10,
                  child: Row(
                    children: [
                      Icon(
                        LineIcons.starAlt,
                        size: 14,
                        color: Colors.white,
                      ),
                      Text('4.5', style: textTheme(Colors.white).subtitle2)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
