import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import 'package:restaurant_app/features/sign_in/presentation/widgets/sign_form.dart';
import 'package:restaurant_app/features/sign_in/presentation/widgets/social_card.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  Row noAccountText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Text(MyStrings.dontHaveAccount)),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextButton(
              onPressed: () {
                context.router.push(const UnderConstructionRoute());
              },
              child: Text(MyStrings.signUp)),
        )
      ],
    );
  }

  Row socialMedia(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(
          icon: "assets/icons/google.svg",
          press: () {
            context.router.push(const UnderConstructionRoute());
          },
        ),
        SocialCard(
          icon: "assets/icons/facebook.svg",
          press: () {
            context.router.push(const UnderConstructionRoute());
          },
        ),
        SocialCard(
          icon: "assets/icons/twitter.svg",
          press: () {
            context.router.push(const UnderConstructionRoute());
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppsConfig.defaultPadding * 2,
                vertical: AppsConfig.defaultPadding),
            child: Column(
              children: [
                SizedBox(height: 24),
                Text(MyStrings.welcomeBack,
                    textAlign: TextAlign.center,
                    style: myTextTheme(
                            color: MyColors.primary, weight: FontWeight.w700)
                        .headline4),
                Text(
                  MyStrings.signInWith,
                  style: myTextTheme(color: MyColors.textBlack).subtitle1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                SignForm(),
                SizedBox(height: 40),
                socialMedia(context),
                SizedBox(height: 24),
                noAccountText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
