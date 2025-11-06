import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:caffee/Core/Widget/custom_elevat_button.dart';
import 'package:caffee/Core/efwkmfekld/app_color.dart';
import 'package:flutter/material.dart';

class CartCheckOutWidget extends StatelessWidget {
  const CartCheckOutWidget({
    super.key,
    required this.total,
    required this.price,
  });
  final int total;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('SubTotal( $total Items)', style: AppText.regular16),
              Row(
                children: [
                  Text(
                    '\$  ',
                    style: AppText.regular18.copyWith(color: appColor.primary),
                  ),
                  Text('${price.toInt()}', style: AppText.regular18),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [CustomElevatButton(text: 'CheckOut', onPressed: () {})],
          ),
        ),
      ],
    );
  }
}
