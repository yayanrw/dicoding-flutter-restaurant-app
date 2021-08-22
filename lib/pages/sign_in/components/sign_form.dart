import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:restaurant_app/helper/theme/color_theme.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
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
        child: const Text('Log In'),
      ),
    );
  }

  Row rememberMe() {
    return Row(
      children: [
        Checkbox(
          value: false,
          activeColor: ColorTheme.primary,
          onChanged: (value) {},
        ),
        Text("Remember me"),
        Spacer(),
        GestureDetector(
          onTap: () => {Navigator.pushNamed(context, '/under_construction')},
          child: Text(
            "Forgot Password",
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(LineIcons.envelope),
          )),
      cursorColor: ColorTheme.primaryDark,
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 25),
          child: Icon(LineIcons.lock),
        ),
      ),
      cursorColor: ColorTheme.primaryDark,
    );
  }
}
