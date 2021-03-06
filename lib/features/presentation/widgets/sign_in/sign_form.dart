import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/core/router/router.gr.dart';
import 'package:restaurant_app/core/theme/my_colors.dart';
import 'package:restaurant_app/generated/l10n.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool _remember = false;

  SizedBox btnLogin(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.router.push(const HomeRoute());
        },
        child: Text(S.of(context).logIn),
      ),
    );
  }

  Row rememberMe() {
    return Row(
      children: <Widget>[
        Checkbox(
          value: _remember,
          activeColor: MyColors.primary,
          onChanged: (bool? value) {
            setState(() {
              _remember = value!;
            });
          },
        ),
        Flexible(child: Text(S.of(context).rememberMe)),
        const Spacer(),
        Flexible(
          child: GestureDetector(
            // ignore: always_specify_types
            onTap: () => {context.router.push(const UnderConstructionRoute())},
            child: Text(
              S.of(context).forgotPassword,
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        )
      ],
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: S.of(context).email,
        hintText: S.of(context).enterYourEmail,
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(LineIcons.envelope),
        ),
      ),
      cursorColor: MyColors.primaryDark,
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: S.of(context).password,
        hintText: S.of(context).enterYourPassword,
        suffixIcon: const Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(LineIcons.lock),
        ),
      ),
      cursorColor: MyColors.primaryDark,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          buildEmailFormField(),
          const SizedBox(
            height: 24,
          ),
          buildPasswordFormField(),
          const SizedBox(
            height: 24,
          ),
          rememberMe(),
          const SizedBox(
            height: 24,
          ),
          btnLogin(context)
        ],
      ),
    );
  }
}
