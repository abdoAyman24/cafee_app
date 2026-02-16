import 'package:caffee/Core/helper/build_app_bar.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/payment_details_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key, required this.cartEntit});
  final CartEntity cartEntit;
  static const String routeName = 'paymentDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(tilte: 'Payment Details'),
      body: PaymentDetailsViewBody(cartEntity: cartEntit),
    );
  }
}
