import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/core/utils/my_strings.dart';
import '../../../../core/theme/my_colors.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  bool _remember = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: 24,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 24,
          ),
          rememberMe(),
          SizedBox(
            height: 24,
          ),
          btnLogin(context)
        ],
      ),
    );
  }

  SizedBox btnLogin(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: const Text(MyStrings.logIn),
      ),
    );
  }

  Row rememberMe() {
    return Row(
      children: [
        Checkbox(
          value: _remember,
          activeColor: MyColors.primary,
          onChanged: (value) {
            setState(() {
              _remember = value!;
            });
          },
        ),
        Flexible(child: Text(MyStrings.rememberMe)),
        Spacer(),
        Flexible(
          child: GestureDetector(
            onTap: () => {Navigator.pushNamed(context, '/under_construction')},
            child: Text(
              MyStrings.forgotPassword,
              style: TextStyle(decoration: TextDecoration.underline),
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
          labelText: MyStrings.email,
          hintText: MyStrings.enterYourEmail,
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(LineIcons.envelope),
          )),
      cursorColor: MyColors.primaryDark,
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: MyStrings.password,
        hintText: MyStrings.enterYourPassword,
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(LineIcons.lock),
        ),
      ),
      cursorColor: MyColors.primaryDark,
    );
  }
}
