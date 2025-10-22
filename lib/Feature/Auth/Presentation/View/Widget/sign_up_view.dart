import 'package:caffee/Core/service/service_locator.dart';
import 'package:caffee/Feature/Auth/Presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/sig_up_view_body_bloc_Consumer.dart';
import 'package:caffee/Feature/Auth/domain/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt.get<UserRepo>()),
      child: Scaffold(body: SigUpViewBodyBlocConsumer()),
    );
  }
}
