import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/master_card_widget.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/payment_item_info.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/total_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TahnkViewbodyDetails extends StatelessWidget {
  const TahnkViewbodyDetails({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text('Thank you!', style: AppText.medium25),
        Text('Your transaction was successful', style: AppText.regular18),
        const SizedBox(height: 40),
        PaymentItemInfo(
          title: 'Date',
          value:
              '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
        ),
        const SizedBox(height: 8),

        PaymentItemInfo(
          title: 'Time',
          value: '${DateTime.now().hour}:${DateTime.now().minute} AM',
        ),
        const SizedBox(height: 8),

        PaymentItemInfo(title: 'To', value: getUser().name),
        Divider(color: Color(0xffC7C7C7), height: 17.h),

        TotalInfo(title: 'Total', value: '$totalPrice'),
        const SizedBox(height: 24),

        MasterCardWidget(),
      ],
    );
  }
}
