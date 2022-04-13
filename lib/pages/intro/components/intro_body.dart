import 'package:flutter/material.dart';
import '../../../config/app.dart';
import 'slider_content.dart';
import '../../../theme/color_theme.dart';
import '../../../theme/text_theme.dart';

class IntroBody extends StatefulWidget {
  const IntroBody({Key? key}) : super(key: key);

  @override
  _IntroBodyState createState() => _IntroBodyState();
}

class _IntroBodyState extends State<IntroBody> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: <Widget>[
              textAppName(),
              customSlider(),
              SizedBox(height: 24),
              customDot(),
              Spacer(),
              btnContinue(context),
            ],
          ),
        ),
      ),
    );
  }

  Row customDot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          App.sliderData.length, (index) => dotContent(index: index)),
    );
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Expanded customSlider() {
    return Expanded(
        flex: 3,
        child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
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
        width: _currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
            color: _currentPage == index
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
            if (_currentPage < 3) {
              setState(() {
                _currentPage++;
                pageController.animateToPage(_currentPage,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
              });
            } else {
              Navigator.pushNamed(context, '/sign_in');
            }
          },
          child: const Text('Continue'),
        ),
      ),
    );
  }

  Text textAppName() {
    return Text(
      App.appName,
      style: textTheme(ColorTheme.primary, FontWeight.w700).headline4,
      textAlign: TextAlign.center,
    );
  }
}
