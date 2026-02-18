import 'package:caffee/Core/helper/build_app_bar.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/order_details_view.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});
  static const String routeName = 'orderDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(tilte: 'My Order'),
      body: OrderDetailsView(),
    );
  }
}
