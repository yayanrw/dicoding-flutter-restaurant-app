import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/generated/l10n.dart';

void customDialog(BuildContext context) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(S.of(context).comingSoon),
          content: Text(S.of(context).thisFeatureWillBeComingSoon),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(S.of(context).ok),
              onPressed: () {
                context.router.pop();
              },
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).comingSoon),
          content: Text(S.of(context).thisFeatureWillBeComingSoon),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.router.pop();
              },
              child: Text(S.of(context).ok),
            ),
          ],
        );
      },
    );
  }
}
