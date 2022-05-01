import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/core/config/apps_config.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/core/theme/my_text_theme.dart';
import 'package:restaurant_app/features/presentation/widgets/sign_in/sign_form.dart';
import 'package:restaurant_app/features/presentation/widgets/sign_in/social_card.dart';
import 'package:restaurant_app/generated/l10n.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  Row noAccountText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(child: Text(S.of(context).dontHaveAnAccount)),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextButton(
            onPressed: () {
              context.router.push(const UnderConstructionRoute());
            },
            child: Text(S.of(context).signUp),
          ),
        )
      ],
    );
  }

  Row socialMedia(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SocialCard(
          icon: 'assets/icons/google.svg',
          press: () {
            context.router.push(const UnderConstructionRoute());
          },
        ),
        SocialCard(
          icon: 'assets/icons/facebook.svg',
          press: () {
            context.router.push(const UnderConstructionRoute());
          },
        ),
        SocialCard(
          icon: 'assets/icons/twitter.svg',
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
              vertical: AppsConfig.defaultPadding,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 24),
                Text(
                  S.of(context).welcomeBack,
                  textAlign: TextAlign.center,
                  style: myTextTheme(
                    color: MyColors.primary,
                    weight: FontWeight.w700,
                  ).headline4,
                ),
                Text(
                  S.of(context).signInWithYourEmailAndPasswordNorContinueWith,
                  style: myTextTheme(color: MyColors.textBlack).subtitle1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                const SignForm(),
                const SizedBox(height: 40),
                socialMedia(context),
                const SizedBox(height: 24),
                noAccountText(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
