import 'package:caffee/Core/helper/build_app_bar.dart';
import 'package:caffee/Core/service/service_locator.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:caffee/Feature/profile/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/my_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});
  static const String routeName = 'myOrders';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(tilte: 'Orders'),
      body: BlocProvider(
        create: (context) =>GetOrdersCubit(getIt.get<PaymentRepos>()),
        child: MyOrdersViewBody(),
      ),
    );
  }
}
