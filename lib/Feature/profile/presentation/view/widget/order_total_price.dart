import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrderTotalPrice extends StatelessWidget {
  const OrderTotalPrice({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Text('Total Proce', style: AppText.bold23),
              const Spacer(),
              Text(
                r'$' + totalPrice.toString(),
                style: AppText.bold23.copyWith(color: AppColor.greyText),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
