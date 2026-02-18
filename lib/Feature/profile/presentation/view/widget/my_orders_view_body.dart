import 'package:caffee/Feature/profile/presentation/view/widget/my_order_view_body_item.dart';
import 'package:flutter/material.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return MyOrderViewBodyItem(
                  orderId: '#64645646404',
                  date: '04 Dec 25',
                  totalValue: '78.00',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
