import 'package:caffee/Core/Widget/custom_elevat_button.dart';
import 'package:caffee/Core/Widget/custom_text_form.dart';
import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/Auth/Presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/custom_auth_head.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, number, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: globalKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            CustomAuthHead(
              title: 'Register',
              subTitle: 'Create a new account',
              showSpace: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextForm(
                    header: 'Username',
                    hint: 'Username',
                    onSave: (value) {
                      name = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextForm(
                    header: 'Email',
                    hint: 'Email',
                    onSave: (value) {
                      email = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextForm(
                    header: 'Mobile Number',
                    hint: 'Mobile Number',
                    onSave: (value) {
                      number = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
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
                ],
              ),
            ),
            CustomElevatButton(
              text: 'Register',
              onPressed: () {
                if (globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  context.read<SignUpCubit>().createUserWithEmailAndPassword(
                    name: name,
                    email: email.toLowerCase(),
                    number: number,
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
                    'Already have account?  ',
                    textAlign: TextAlign.center,
                    style: AppText.medium16.copyWith(color: appColor.greyText),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login ',
                      textAlign: TextAlign.center,
                      style: AppText.medium20,
                    ),
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
