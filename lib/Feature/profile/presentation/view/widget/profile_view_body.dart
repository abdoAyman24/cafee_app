import 'package:caffee/Core/helper/cache_helper.dart';
import 'package:caffee/Feature/Auth/Presentation/View/sign_in_view.dart';
import 'package:caffee/Feature/profile/presentation/view/my_orders.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/payment_option.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/profile_app_bar.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/profile_record_info.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/profile_user_data.dart';
import 'package:caffee/constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: ListView(
        children: [
          ProfileAppBar(),
          SizedBox(height: 15),
          ProfileUserData(),
          SizedBox(height: 20.h),
          ProfileRecordInfo(text: 'Account Data', onPressed: () {}),
          ProfileRecordInfo(
            text: 'Payment Option',
            onPressed: () {
              Navigator.pushNamed(context, PaymentOption.routeName);
            },
          ),
          ProfileRecordInfo(
            text: 'Payment History',
            onPressed: () {
            
              Navigator.pushNamed(context, MyOrders.routeName);
            },
          ),
          ProfileRecordInfo(text: 'receipts', onPressed: () {}),
          SizedBox(height: 15.h),
          ProfileRecordInfo(
            text: 'Sign Out',
            onPressed: () {
              CacheHelper.removeData(key: KUserData);
              Navigator.pushNamedAndRemoveUntil(context, SignInView.routeName, (
                route,
              ) {
                return false;
              });
            },
          ),
        ],
      ),
    );
  }
}
