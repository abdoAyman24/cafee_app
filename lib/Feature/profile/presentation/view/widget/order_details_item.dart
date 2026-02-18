import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/my_order_item_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsItem extends StatelessWidget {
  const OrderDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),

                    border: BoxBorder.all(width: 1, color: AppColor.greyText),
                  ),
                  //clipBehavior: Clip.antiAlias,
                  height: 28.h,
                  width: 60.w,
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(14),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://wffygksikhphlzgvmvib.supabase.co/storage/v1/object/public/caffe_images/images/1000000041.jpg.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: 110.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Caffee',
                    style: AppText.bold20.copyWith(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 8),
                  MyOrderItemInfo(head: 'Total', value: '2'),
                  MyOrderItemInfo(head: 'Price', value: r'$200'),
                ],
              ),
            ),
          ],
        ),
        const Divider(height: 40),
      ],
    );
  }
}
