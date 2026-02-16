import 'package:caffee/Core/Widget/customAppBar.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/Cart/Presentation/View/Widget/cart_check_out_widget.dart';
import 'package:caffee/Feature/Cart/Presentation/View/Widget/cart_list_view_product.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_item_cubit/cart_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: CustomAppBar(
                    leftWidget: Text('Shoping Cart', style: AppText.bold28),
                    rightWidget: SizedBox(),
                    showRightWidget: false,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                CartListViewProduct(
                  cartItemEntity: context
                      .watch<CartCubit>()
                      .cartEntity
                      .cartItems,
                ),
              ],
            ),
          ),

          BlocBuilder<CartItemCubit, CartItemState>(
            builder: (context, state) {
              return CartCheckOutWidget(
                cartEntity: context
                    .watch<CartCubit>()
                    .cartEntity
,
              );
            },
          ),
        ],
      ),
    );
  }
}
