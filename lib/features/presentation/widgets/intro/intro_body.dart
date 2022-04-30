// ignore_for_file: always_specify_types

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/domain/entities/slider_data.dart';
import 'package:restaurant_app/features/presentation/widgets/intro/slider_content.dart';

class IntroBody extends StatefulWidget {
  const IntroBody({Key? key}) : super(key: key);

  @override
  _IntroBodyState createState() => _IntroBodyState();
}

class _IntroBodyState extends State<IntroBody> {
  PageController pageController = PageController();

  int _currentPage = 0;

  Row customDot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        sliderData.length,
        (int index) => dotContent(index: index),
      ),
    );
  }

  Expanded customSlider() {
    return Expanded(
      flex: 3,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (int value) {
          setState(() {
            _currentPage = value;
          });
        },
        itemCount: sliderData.length,
        itemBuilder: (BuildContext context, int index) => SliderContent(
          image: sliderData[index].image,
          text: sliderData[index].text,
        ),
      ),
    );
  }

  AnimatedContainer dotContent({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color:
            _currentPage == index ? MyColors.primary : MyColors.secondaryLight,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Padding btnContinue(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            if (_currentPage < 3) {
              setState(() {
                _currentPage++;
                pageController.animateToPage(
                  _currentPage,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              });
            } else {
              context.router.push(const SignInRoute());
            }
          },
          child: const Text(MyStrings.sContinue),
        ),
      ),
    );
  }

  Text textAppName() {
    return Text(
      AppsConfig.appTitle,
      style: myTextTheme(color: MyColors.primary, weight: FontWeight.w700)
          .headline4,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: <Widget>[
              textAppName(),
              customSlider(),
              const SizedBox(height: 24),
              customDot(),
              const Spacer(),
              btnContinue(context),
            ],
          ),
        ),
      ),
    );
  }
}
