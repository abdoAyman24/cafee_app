import 'package:caffee/Feature/profile/presentation/view/widget/order_details_item.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/order_total_price.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    int lenth = 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: lenth,
              itemBuilder: (context, index) {
                return index == (lenth - 1)
                    ? OrderTotalPrice()
                    : OrderDetailsItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
