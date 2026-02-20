import 'package:caffee/Core/helper/formate_date.dart';
import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/profile/domain/entity/order_details_entity.dart';
import 'package:caffee/Feature/profile/presentation/view/order_details.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/order_status_widget.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/ordr_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderViewBodyItem extends StatelessWidget {
  const MyOrderViewBodyItem({super.key, required this.orderModelEntityList});

  final OrderDetailsEntity orderModelEntityList;

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
            children: [OrderICon()],
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
                      orderModelEntityList.orderId,
                      style: AppText.regular11.copyWith(
                        color: AppColor.greyText,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      FormateDate(
                        inputeDate: orderModelEntityList.createAt,
                      ).date,
                      style: AppText.regular13,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  r'Value:$' + orderModelEntityList.getTotal().toString(),
                  style: AppText.semiBold16,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 130.w,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            OrderDetails.routeName,
                            arguments: orderModelEntityList,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.textFormColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'View Details',
                              style: AppText.medium16,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      OrderStatusWidget(
                        status: orderModelEntityList.orderStatus,
                      ),
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
