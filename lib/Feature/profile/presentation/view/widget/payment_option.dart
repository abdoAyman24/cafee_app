import 'package:caffee/Core/helper/build_app_bar.dart';
import 'package:caffee/Core/utils/app_icon.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/paymnet_option_item_info.dart';
import 'package:flutter/material.dart';

class PaymentOption extends StatelessWidget {
  const PaymentOption({super.key});
  static const String routeName = 'payment_option';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(tilte: 'Payment Option'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            PaymentOptionItemInfo(imagePath: Assets.imagesPaypal),
            PaymentOptionItemInfo(imagePath: Assets.imagesCreditCard),
            PaymentOptionItemInfo(imagePath: Assets.imagesMasterCard),
          ],
        ),
      ),
    );
  }
}
