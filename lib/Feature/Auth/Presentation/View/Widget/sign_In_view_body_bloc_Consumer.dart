import 'package:caffee/Core/helper/error_builder.dart';
import 'package:caffee/Feature/Auth/Presentation/Manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_in_view_body.dart';
import 'package:caffee/Feature/home/presentation/View/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          errorBuilder(context, state.errorMessage);
        }
        if (state is SignInSuccess) {
          errorBuilder(context, 'login success');
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoad ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}
