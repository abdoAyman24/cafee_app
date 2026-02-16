import 'package:flutter/material.dart';

void showMessage(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
      //width: 30,
      // action: SnackBarAction(
      //   label: '',
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
    ),
  );
}
