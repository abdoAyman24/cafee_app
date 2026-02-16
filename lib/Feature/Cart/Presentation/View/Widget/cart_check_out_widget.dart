import 'package:caffee/Core/Widget/custom_elevat_button.dart';
import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/payment/presentation/view/payment_view.dart';
import 'package:flutter/material.dart';

class CartCheckOutWidget extends StatelessWidget {
  const CartCheckOutWidget({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SubTotal( ${cartEntity.cartItems.length} Items)',
                style: AppText.regular16,
              ),
              Row(
                children: [
                  Text(
                    '\$  ',
                    style: AppText.regular18.copyWith(color: AppColor.primary),
                  ),
                  Text(
                    '${cartEntity.calculateTotalPrice().toInt()}',
                    style: AppText.regular18,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              CustomElevatButton(
                text: 'CheckOut',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PaymentView.routeName,
                    arguments: cartEntity,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
