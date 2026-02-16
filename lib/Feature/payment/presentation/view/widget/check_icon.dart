import 'package:caffee/Core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckIcon extends StatelessWidget {
  const CheckIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      top: -25.w,
      child: CircleAvatar(
        radius: 25.w,
        backgroundColor: const Color.fromARGB(255, 51, 50, 50),
        child: CircleAvatar(
          radius: 21.w,
          backgroundColor: Color(0xff34A853),
          child: Icon(Icons.check, color: AppColor.wightTExt, size: 25.w),
        ),
      ),
    );
  }
}
