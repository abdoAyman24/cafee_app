import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/profile.png',
          width: 25.w,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${getUser().name}', style: AppText.bold23),
            Text('Hello Sir...', style: AppText.bold13),
          ],
        ),
      ],
    );
  }
}
