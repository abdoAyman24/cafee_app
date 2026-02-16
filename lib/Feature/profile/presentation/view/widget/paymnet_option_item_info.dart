import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentOptionItemInfo extends StatelessWidget {
  const PaymentOptionItemInfo({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(imagePath, height: 7.h),
          SizedBox(width: 5),

          Spacer(),
          Text(
            'Conected',
            style: AppText.medium18.copyWith(color: AppColor.greyText),
          ),
        ],
      ),
    );
  }
}
