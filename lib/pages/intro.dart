import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_app/helper/color_theme.dart';
import 'package:restaurant_app/helper/size_config.dart';
import 'package:restaurant_app/helper/theme.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int currentPage = 0;

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
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    "Restaurant App",
                    style: TextStyle(
                        color: ColorTheme.primary,
                        fontSize: getProportionateScreenWidth(36),
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      flex: 3,
                      child: PageView.builder(
                          onPageChanged: (value) {
                            setState(() {
                              currentPage = value;
                            });
                          },
                          itemCount: contentData.length,
                          itemBuilder: (context, index) => Content(
                              image: contentData[index]["image"],
                              text: contentData[index]["text"]))),
                  Spacer(),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(contentData.length,
                                (index) => buildDot(index: index)),
                          ),
                          Spacer(
                            flex: 3,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: getProportionateScreenHeight(56),
                            child: TextButton(
                                style: flatButtonStyle,
                                onPressed: () {},
                                child: Text("Continue")),
                          ),
                          Spacer()
                        ],
                      ))
                ],
              ),
            ),
          ),
        ));
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
            color: currentPage == index
                ? ColorTheme.primary
                : ColorTheme.secondaryLight,
            borderRadius: BorderRadius.circular(3)));
  }
}

class Content extends StatelessWidget {
  const Content({Key? key, this.text, this.image}) : super(key: key);

  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text!,
          style: TextStyle(color: ColorTheme.secondary),
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
