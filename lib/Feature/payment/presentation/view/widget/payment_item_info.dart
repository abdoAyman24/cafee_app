import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value,  });
  final String title;
  final String value;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppText.regular18),
        Text(value , style: AppText.semiBold18),
      ],
    );
  }
}
