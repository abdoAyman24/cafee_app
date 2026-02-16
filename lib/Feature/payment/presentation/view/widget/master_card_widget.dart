import 'package:caffee/Core/Utils/app_icon.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MasterCardWidget extends StatelessWidget {
  const MasterCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 21.h,
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 98, 95, 95),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SvgPicture.asset(Assets.imagesMasterCard)],
            ),
            const SizedBox(width: 13),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Credit Card', style: AppText.regular18),
                Text('Mastercard **78', style: AppText.regular16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
