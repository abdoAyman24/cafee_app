import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SignUpViewBody());
  }
}
