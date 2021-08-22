import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/theme/text_theme.dart';
import 'components/sign_form.dart';
import 'components/social_card.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              children: [
                SizedBox(height: 24),
                Text("Welcome Back", style: textTheme().headline4),
                Text(
                  "Sign in with your email and password \nor continue with social media",
                  style: textTheme().subtitle1,
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
        Text('Don\'t have an account?'),
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
