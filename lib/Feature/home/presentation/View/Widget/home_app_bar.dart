import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/profile.png'),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${getUser().name}', style: AppText.bold20),
            Text('Hello Sir...', style: AppText.bold13),
          ],
        ),
      ],
    );
  }
}