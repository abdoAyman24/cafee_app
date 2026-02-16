import 'package:caffee/Core/Widget/custom_button.dart';
import 'package:caffee/Core/Widget/custom_text_form.dart';
import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:caffee/Feature/Auth/domain/entity/user_entity.dart';
import 'package:caffee/Feature/profile/presentation/manager/updae_user_data_cubit/update_user_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  final GlobalKey<FormState> _fromkey = GlobalKey();
  final AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String name = getUser().name;
  String email = getUser().email;
  String userId = getUser().id;
  String number = getUser().number;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            final cubit = context.read<UpdateUserDataCubit>();

            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (bottomSheetContext) {
                return BlocProvider.value(
                  value: cubit,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 30,
                      bottom: MediaQuery.of(
                        bottomSheetContext,
                      ).viewInsets.bottom,
                    ),
                    child: Form(
                      key: _fromkey,
                      autovalidateMode: _autovalidateMode,
                      child: ListView(
                        children: [
                          const SizedBox(height: 10),
                          CustomTextForm(
                            header: 'Change Your Name',
                            hint: 'Enter Your Name',
                            onSave: (value) {
                              name = value!;
                            },
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(height: 10),
                          CustomTextForm(
                            header: 'Change Your Number',
                            hint: 'Enter Your Name',
                            onSave: (value) {
                              number = value!;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 25),
                          BlocBuilder<UpdateUserDataCubit, UpdateUserDataState>(
                            builder: (context, state) {
                              return CustomButton(
                                isLoading: state is UpdateUserDataStart,
                                onTap: () {
                                  if (_fromkey.currentState!.validate()) {
                                    context
                                        .read<UpdateUserDataCubit>()
                                        .updateUserData(
                                          UserEntity(
                                            id: userId,
                                            name: name,
                                            email: email,
                                            number: number,
                                            customerId: getUser().customerId,
                                          ),
                                        );
                                    Navigator.pop(context);
                                  }
                                },
                                text: 'Update',
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          icon: Icon(Icons.edit_note_rounded, size: 10.h),
        ),
      ],
    );
  }
}
