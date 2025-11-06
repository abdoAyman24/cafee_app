import 'package:caffee/Core/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:caffee/Core/Widget/custom_product_image_item.dart';
import 'package:caffee/Core/utils_/app_color.dart';
import 'package:caffee/Core/utils_/app_text_styles.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Core/Widget/product_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Product_item extends StatelessWidget {
  const Product_item({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailsView.routeName,
          arguments:  {
    'product': product,
    'cartCubit': context.read<CartCubit>(),
    'favoriteCubit':context.read<FavoriteCubit>()
  },
        );
      },
      child: Container(
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.09, 0.04),
            end: Alignment(1.00, 1.00),
            colors: [
              const Color(0xFF383737),
              const Color(0xFC111010),
              const Color(0xFC111010),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SizedBox(
            width: 70.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomProductImageItem(imageUrl: product.imageUrl),
                ),
                //  const SizedBox(height: 5),
                Text(
                  product.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.semiBold20,
                ),
                Text(
                  product.additional,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppText.regular16.copyWith(color: Colors.grey),
                ),
                Row(
                  children: [
                    Text(
                      '\$',
                      style: AppText.medium18.copyWith(color: appColor.primary),
                    ),
                    Text('${product.priceS}', style: AppText.medium18),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        context.read<CartCubit>().addProduct(product);
                      },
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appColor.primary,
                        ),
                        child: Icon(Icons.add, color: appColor.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
