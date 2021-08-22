import 'package:flutter/material.dart';
import 'package:restaurant_app/helper/theme/text_theme.dart';
import 'package:restaurant_app/pages/sign_in/components/body.dart';
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
      body: Body(),
    );
  }
}
