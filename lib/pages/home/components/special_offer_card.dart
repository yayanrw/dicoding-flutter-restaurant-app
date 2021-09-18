import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/theme/color_theme.dart';
import 'package:restaurant_app/theme/text_theme.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.press,
      required this.city,
      required this.rating})
      : super(key: key);

  final String name, city, image;
  final double rating;
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
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.6,
                blurRadius: 7,
                offset: Offset(1, 0), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(image, fit: BoxFit.cover),
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
                          text: city,
                          style:
                              textTheme(Colors.white, FontWeight.w700).caption,
                        ),
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
                      Text(rating.toString(),
                          style: textTheme(Colors.white).subtitle2)
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
