import 'package:caffee/Feature/Cart/Presentation/View/Widget/cart_product_item.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:flutter/material.dart';

class CartListViewProduct extends StatelessWidget {
  const CartListViewProduct({super.key, required this.cartItemEntity});
  final List<CartItemEntity> cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 18),

      itemCount: cartItemEntity.length,
      itemBuilder: (context, index) {
        return CartProductItem(cartItemEntity: cartItemEntity[index]);
      },
    );
  }
}
