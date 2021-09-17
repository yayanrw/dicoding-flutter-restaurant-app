import 'package:flutter/material.dart';
import 'package:restaurant_app/pages/sign_in/components/sign_in_body.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: SignInBody(),
    );
  }
}
