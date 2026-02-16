import 'package:caffee/Core/helper/error_builder.dart';
import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/profile/presentation/manager/updae_user_data_cubit/update_user_data_cubit.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [ProfileImage()]),
        SizedBox(width: 25),
        BlocConsumer<UpdateUserDataCubit, UpdateUserDataState>(
          listener: (context, state) {
            if (state is UpdateUserDataFailure) {
              errorBuilder(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getUser().name,
                  style: AppText.bold20.copyWith(fontStyle: FontStyle.italic),
                ),

                Text(
                  getUser().email,
                  style: AppText.regular16.copyWith(color: AppColor.greyText),
                ),

                Text(
                  '+2${getUser().number}',
                  style: AppText.regular16.copyWith(color: AppColor.greyText),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
