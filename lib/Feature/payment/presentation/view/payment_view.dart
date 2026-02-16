import 'package:caffee/Core/helper/build_app_bar.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/payment_view_body.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key, required this.cartEntity});
  static const String routeName = 'paymentView';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(tilte: 'My Cart'),
      body: PaymentViewBody(cartEntity: cartEntity,),
    );
  }
}
