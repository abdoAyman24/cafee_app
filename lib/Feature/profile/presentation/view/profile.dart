import 'package:caffee/Core/service/service_locator.dart';
import 'package:caffee/Feature/Auth/domain/repo/user_repo.dart';
import 'package:caffee/Feature/profile/presentation/manager/updae_user_data_cubit/update_user_data_cubit.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static const String routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UpdateUserDataCubit(getIt.get<UserRepo>()),
        child: ProfileViewBody(),
      ),
    );
  }
}
