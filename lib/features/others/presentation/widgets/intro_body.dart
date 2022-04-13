import 'package:flutter/material.dart';
import '../../../../core/config/apps_config.dart';
import '../../../../core/theme/my_colors.dart';
import '../../../../core/theme/my_text_theme.dart';
import '../../../../core/utils/my_strings.dart';
import '../../domain/entities/slider_data.dart';
import 'slider_content.dart';

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
      children:
          List.generate(sliderData.length, (index) => dotContent(index: index)),
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
            itemCount: sliderData.length,
            itemBuilder: (context, index) => SliderContent(
                image: sliderData[index].image, text: sliderData[index].text)));
  }

  AnimatedContainer dotContent({required int index}) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        margin: EdgeInsets.only(right: 5),
        height: 6,
        width: _currentPage == index ? 20 : 6,
        decoration: BoxDecoration(
            color: _currentPage == index
                ? MyColors.primary
                : MyColors.secondaryLight,
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
}
