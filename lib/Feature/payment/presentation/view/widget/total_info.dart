import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
class TotalInfo extends StatelessWidget {
  const TotalInfo({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppText.semiBold24),
        Text(r'$' + value, style: AppText.semiBold24),
      ],
    );
  }
}
