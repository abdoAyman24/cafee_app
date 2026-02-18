import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/profile/presentation/view/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderViewBodyItem extends StatelessWidget {
  const MyOrderViewBodyItem({
    super.key,
    required this.orderId,
    required this.date,
    required this.totalValue,
  });

  final String orderId;
  final String date;
  final String totalValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColor.greyText.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.greyText,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.layers_rounded,
                    color: AppColor.black,
                    size: 7.h,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 130.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Order Id', style: AppText.semiBold16),
                    const Spacer(),
                    Text(
                      'Create On ',
                      style: AppText.regular13.copyWith(
                        color: AppColor.greyText,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      orderId,
                      style: AppText.bold13.copyWith(color: AppColor.greyText),
                    ),
                    const Spacer(),
                    Text(date, style: AppText.regular16),
                  ],
                ),
                const SizedBox(height: 5),
                Text(r'Value:$' + totalValue, style: AppText.semiBold16),
                const SizedBox(height: 12),

                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, OrderDetails.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.textFormColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('View Details', style: AppText.medium16),
                    ),
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
