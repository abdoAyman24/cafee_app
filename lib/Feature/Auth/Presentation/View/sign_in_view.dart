import 'package:caffee/Core/service/service_locator.dart';
import 'package:caffee/Feature/Auth/Presentation/Manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_In_view_body_bloc_Consumer.dart';
import 'package:caffee/Feature/Auth/domain/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = 'SignInView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<UserRepo>()),
      child: Scaffold(body: SignInViewBodyBlocConsumer()),
    );
  }
}
