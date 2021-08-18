import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/helper/color_theme.dart';
import 'package:restaurant_app/helper/size_config.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  List<Map<String, String>> contentData = [
    {
      "image": "assets/images/breakfast.svg",
      "text": "Welcome to Restaurant App, Let's shop!",
    },
    {
      "image": "assets/images/hamburger.svg",
      "text": "Do you want a hamburger?",
    },
    {
      "image": "assets/images/ice_cream.svg",
      "text": "Or, do you want an ice cream?",
    },
    {
      "image": "assets/images/eating_together.svg",
      "text": "Let's shop and eating together!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 3,
                    child: PageView.builder(
                        itemCount: contentData.length,
                        itemBuilder: (context, index) => Content(
                            image: contentData[index]["image"],
                            text: contentData[index]["text"]))),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[buildDot()],
                    ))
              ],
            ),
          ),
        ));
  }

  Container buildDot() {
    return Container(
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: 6,
        decoration: BoxDecoration(
            color: ColorTheme.primary, borderRadius: BorderRadius.circular(3)));
  }
}

class Content extends StatelessWidget {
  const Content({Key? key, this.text, this.image}) : super(key: key);

  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Restaurant App",
          style: TextStyle(
              color: ColorTheme.primary,
              fontSize: getProportionateScreenWidth(36),
              fontWeight: FontWeight.bold),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        SvgPicture.asset(
          image!,
          height: getProportionateScreenHeight(200),
          width: getProportionateScreenWidth(180),
        ),
      ],
    );
  }
}
