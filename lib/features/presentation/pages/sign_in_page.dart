import 'package:flutter/material.dart';
import 'package:restaurant_app/features/presentation/widgets/sign_in/sign_in_body.dart';
import 'package:restaurant_app/generated/l10n.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).signIn),
      ),
      body: const SignInBody(),
    );
  }
}
