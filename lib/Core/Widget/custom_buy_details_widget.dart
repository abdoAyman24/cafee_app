
import 'package:caffee/Core/Utils/app_color.dart';
import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyDetailsWidget extends StatelessWidget {
  const BuyDetailsWidget({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$',
                style: AppText.medium24.copyWith(
                  color: appColor.primary,
                ),
              ),
              const SizedBox(width: 5),
              Text(product.priceS.toString(), style: AppText.bold28),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 20.h,
            decoration: ShapeDecoration(
              color: appColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
              child: Text('Buy Now', style: AppText.bold28),
            ),
          ),
        ),
      ],
    );
  }
}
