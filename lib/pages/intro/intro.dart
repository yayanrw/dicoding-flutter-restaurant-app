import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/app.dart';
import 'package:restaurant_app/helper/color_theme.dart';
import 'package:restaurant_app/helper/theme.dart';
import 'components/slider_content.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int currentPage = 0;

  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: <Widget>[
              textAppName(),
              customSlider(),
              Spacer(),
              customDot(),
              Spacer(),
              btnContinue(context),
              // Slider(),
              // btnContinue(context),
            ],
          ),
        ),
      ),
    ));
  }

  Row customDot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          App.sliderData.length, (index) => dotContent(index: index)),
    );
  }

  Expanded customSlider() {
    return Expanded(
        flex: 3,
        child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemCount: App.sliderData.length,
            itemBuilder: (context, index) => SliderContent(
                image: App.sliderData[index]["image"],
                text: App.sliderData[index]["text"])));
  }

  AnimatedContainer dotContent({required int index}) {
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

  Padding btnContinue(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: const Text('Continue'),
        ),
      ),
    );
  }

  Text textAppName() {
    return Text(
      App.appName,
      style: textTheme().headline3,
    );
  }
}
