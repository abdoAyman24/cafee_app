import 'package:caffee/Core/utils_/app_color.dart';
import 'package:caffee/Core/utils_/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAuthHead extends StatelessWidget {
  const CustomAuthHead({
    super.key,
    required this.title,
    required this.subTitle,
    this.showSpace = true,
  });
  final String title;
  final String subTitle;
  final bool showSpace;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/app.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        showSpace
            ? SizedBox(height: MediaQuery.of(context).size.height * 0.08)
            : const SizedBox(),
        Text(title, textAlign: TextAlign.center, style: AppText.bold28),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppText.bold20.copyWith(color: appColor.greyText),
        ),
      ],
    );
  }
}
