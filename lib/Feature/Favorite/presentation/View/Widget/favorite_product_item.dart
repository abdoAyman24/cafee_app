import 'package:caffee/Core/Utils/app_color.dart';
import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:caffee/Core/Widget/custom_product_image_item.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteProductItem extends StatelessWidget {
  const FavoriteProductItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.96,
      height: MediaQuery.of(context).size.height * 0.20,
      padding: EdgeInsets.all(13),
      decoration: ShapeDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.09, 0.04),
          end: Alignment(1.00, 1.00),
          colors: [
            const Color(0xFF383737),
            const Color(0xFC111010),
            Colors.black,
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
        shadows: [
          BoxShadow(
            color: Color(0x3F463F3F),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomProductImageItem(imageUrl: product.imageUrl),
          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name.length > 14
                      ? '${product.name.substring(0, 14)}...'
                      : product.name,
                  style: AppText.bold20,
                ),
                Text(
                  () {
                    final words = product.additional.split(' ');
                    if (words.length > 2) {
                      return '${words.take(2).join(' ')}...';
                    } else {
                      return product.additional;
                    }
                  }(),
                  style: AppText.medium18.copyWith(color: appColor.greyText),
                ),

                Expanded(
                  child: Row(
                    children: [
                      Text('\$', style: AppText.semiBold20),
                      Text(
                        product.priceM.toString(),
                        style: AppText.semiBold20,
                      ),
                      SizedBox(width: 40.w),
                      Icon(Icons.favorite, color: appColor.primary, size: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
