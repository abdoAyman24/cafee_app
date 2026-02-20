import 'package:caffee/Core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderICon extends StatelessWidget {
  const OrderICon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greyText,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(
          Icons.layers_rounded,
          color: AppColor.black,
          size: 7.h,
        ),
      ),
    );
  }
}