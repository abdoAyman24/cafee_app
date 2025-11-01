import 'package:caffee/Feature/Cart/Presentation/View/Widget/cart_view_body.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cartView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: Scaffold(
        body: CartViewBody(),
        
      ),
    );
  }
}
