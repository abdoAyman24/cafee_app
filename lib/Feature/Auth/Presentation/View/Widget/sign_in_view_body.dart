import 'package:caffee/Core/Widget/custom_elevat_button.dart';
import 'package:caffee/Core/Widget/custom_text_form.dart';
import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/Auth/Presentation/Manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/custom_auth_head.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_up_view.dart';
import 'package:caffee/icons/my_custom_i_con_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController controller = TextEditingController();
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomAuthHead(title: 'Welcome', subTitle: 'Login to your account'),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextForm(
                    header: 'Email',
                    hint: 'Email',
                    onSave: (value) {
                      email = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 8),
                  CustomTextForm(
                    header: 'Pasword',
                    hint: 'Pasword',
                    onSave: (value) {
                      password = value!;
                    },
                    showSuffixIcon: true,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.center,
                          style: AppText.medium16.copyWith(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomElevatButton(
              text: 'Login',
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  context.read<SignInCubit>().sigInWithEmailAndPassword(
                    email: email.toLowerCase(),
                    password: password,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Don’t have account?   ',
                    textAlign: TextAlign.center,
                    style: AppText.medium16.copyWith(color: AppColor.greyText),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpView.routeName);
                    },
                    child: Text(
                      'Create Now ',
                      textAlign: TextAlign.center,
                      style: AppText.medium20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<SignInCubit>().signInWithGoogle();
                    },
                    child: Icon(MyCustomICon.google, size: 30),
                  ),
                  Icon(MyCustomICon.instagram, size: 30),
                  InkWell(
                    onTap: () {
                      context.read<SignInCubit>().signInWithFacebook();
                    },
                    child: Icon(MyCustomICon.facebook_squared, size: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
