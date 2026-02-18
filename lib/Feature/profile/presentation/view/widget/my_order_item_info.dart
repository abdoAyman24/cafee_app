import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class MyOrderItemInfo extends StatelessWidget {
  const MyOrderItemInfo({super.key, required this.head, required this.value});
  final String head;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(head, style: AppText.medium16),
        const Spacer(),
        Text(value, style: AppText.medium16.copyWith(color: AppColor.greyText)),
      ],
    );
  }
}
