import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_up_view.dart';
import 'package:caffee/Feature/Auth/Presentation/View/sign_in_view.dart';
import 'package:caffee/Feature/home/presentation/View/main_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SignInView.routeName:
      return MaterialPageRoute(
        builder: (context) =>     
          SignInView(),
      );

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
