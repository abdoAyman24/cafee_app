import 'package:caffee/Core/helper/build_app_bar.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/my_orders_view_body.dart';
import 'package:flutter/material.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});
  static const String routeName = 'myOrders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(tilte:'Orders'),
      body: MyOrdersViewBody(),
    );
  }
}
