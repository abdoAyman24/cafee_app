import 'package:caffee/Feature/Cart/Presentation/View/Widget/cart_view_body.dart';
import 'package:caffee/Feature/Cart/Presentation/View/Widget/cart_view_body_bloc_builder.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CartViewBodyBlocBuilder(child: CartViewBody()));
  }
}
