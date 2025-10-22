import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_in_view_body.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'SignInView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInViewBody(),
    );
  }
}
