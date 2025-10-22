import 'package:caffee/Core/helper/error_builder.dart';
import 'package:caffee/Feature/Auth/Presentation/Manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SigUpViewBodyBlocConsumer extends StatelessWidget {
  const SigUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          errorBuilder(context, state.errorMessage);
        }
        if (state is SignUpSuccess) {
          errorBuilder(context, 'Register success');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoad ? true : false,
          child: SignUpViewBody(),
        );
      },
    );
  }
}
