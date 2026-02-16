import 'package:caffee/Core/Utils/app_icon.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/payment_method_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key, required this.chnagePaymentMethod});
  final Function({required int index}) chnagePaymentMethod;
  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentList = const [
    Assets.imagesCreditCard,
    Assets.imagesPaypal,
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                activeIndex = index;
                widget.chnagePaymentMethod(index: activeIndex);
                setState(() {});
              },
              child: PaymentMethodItem(
                image: paymentList[index],
                isActive: activeIndex == index ? true : false,
              ),
            ),
          );
        },
      ),
    );
  }
}
