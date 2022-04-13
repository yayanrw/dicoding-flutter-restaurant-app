import 'package:flutter/material.dart';

import '../../../theme/color_theme.dart';
import '../../../theme/text_theme.dart';
import 'sign_form.dart';
import 'social_card.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              children: [
                SizedBox(height: 24),
                Text("Welcome Back",
                    textAlign: TextAlign.center,
                    style: textTheme(ColorTheme.primary, FontWeight.w700)
                        .headline4),
                Text(
                  "Sign in with your email and password \nor continue with social media",
                  style: textTheme(ColorTheme.secondary).subtitle1,
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

  Row noAccountText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Text('Don\'t have an account?')),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/under_construction');
              },
              child: Text('Sign Up')),
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
            Navigator.pushNamed(context, '/under_construction');
          },
        ),
        SocialCard(
          icon: "assets/icons/facebook.svg",
          press: () {
            Navigator.pushNamed(context, '/under_construction');
          },
        ),
        SocialCard(
          icon: "assets/icons/twitter.svg",
          press: () {
            Navigator.pushNamed(context, '/under_construction');
          },
        ),
      ],
    );
  }
}
