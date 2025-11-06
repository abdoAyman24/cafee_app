import 'dart:developer';

import 'package:caffee/Core/Widget/custom_product_image_item.dart';
import 'package:caffee/Core/helper/container_decoration.dart';
import 'package:caffee/Core/utils_/app_color.dart';
import 'package:caffee/Core/utils_/app_text_styles.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_item_cubit/cart_item_cubit.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdate) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        log('widget rebuild');
        return Container(
          width: MediaQuery.of(context).size.width * 0.96,
          height: MediaQuery.of(context).size.height * 0.18,
          padding: EdgeInsets.all(13),
          decoration: containerDecration(29),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomProductImageItem(
                imageUrl: cartItemEntity.productEntity.imageUrl,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItemEntity.productEntity.name.length > 14
                          ? '${cartItemEntity.productEntity.name.substring(0, 14)}...'
                          : cartItemEntity.productEntity.name,
                      style: AppText.bold20,
                    ),
                    Text(
                      () {
                        final words = cartItemEntity.productEntity.additional
                            .split(' ');
                        if (words.length > 2) {
                          return '${words.take(2).join(' ')}...';
                        } else {
                          return cartItemEntity.productEntity.additional;
                        }
                      }(),
                      style: AppText.medium18.copyWith(
                        color: appColor.greyText,
                      ),
                    ),

                    Row(
                      children: [
                        Text('\$', style: AppText.semiBold20),
                        Text(
                          cartItemEntity.productEntity.priceS.toString(),
                          style: AppText.semiBold20,
                        ),
                        SizedBox(width: 40.w),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCartItem(
                              cartItemEntity,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: containerDecration(8),
                            child: Icon(
                              Icons.delete_outline_rounded,
                              color: const Color.fromARGB(255, 158, 158, 158),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // context.read<CartCubit>().icreseCartItemQuantity(
                            //   cartItemEntity,
                            // );
                            cartItemEntity.increseQuantity();
                            context.read<CartItemCubit>().updateCartItem(
                              cartItemEntity,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: containerDecration(8),
                            child: Icon(
                              Icons.add,
                              color: const Color.fromARGB(255, 158, 158, 158),
                              size: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            '${cartItemEntity.quantity.toInt()}',
                            style: AppText.bold18,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // context.read<CartCubit>().decreseCartItemQuantity(
                            //   cartItemEntity,
                            // );
                            cartItemEntity.decreseQuantity();
                            context.read<CartItemCubit>().updateCartItem(
                              cartItemEntity,
                            );
                            if (cartItemEntity.quantity == 0) {
                              context.read<CartCubit>().deleteCartItem(
                                cartItemEntity,
                              );
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: containerDecration(8),
                            child: Center(
                              child: Icon(
                                Icons.remove,

                                color: const Color.fromARGB(255, 158, 158, 158),
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
