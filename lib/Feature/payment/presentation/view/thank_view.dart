import 'package:caffee/Core/helper/build_app_bar.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/thank_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThankView extends StatelessWidget {
  const ThankView({super.key, required this.totalPrice});
  static const String routeName = 'thankView';
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Transform.translate(
        offset: Offset(0, -3.h),
        child: ThankViewBody(totalPrice: totalPrice,),
      ),
    );
  }
}
