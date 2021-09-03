import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/theme/color_theme.dart';
import 'package:restaurant_app/helper/theme/text_theme.dart';
import 'package:restaurant_app/pages/sign_in/components/sign_form.dart';
import 'package:restaurant_app/pages/sign_in/components/social_card.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
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
                socialMedia(),
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

  Row socialMedia() {
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
