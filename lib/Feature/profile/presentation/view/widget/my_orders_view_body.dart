import 'dart:developer';
import 'package:caffee/Core/helper/error_builder.dart';
import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/payment/presentation/manager/get_orders_cubit/get_orders_cubit.dart';
import 'package:caffee/Feature/profile/domain/entity/order_details_entity.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/my_order_view_body_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyOrdersViewBody extends StatefulWidget {
  const MyOrdersViewBody({super.key});

  @override
  State<MyOrdersViewBody> createState() => _MyOrdersViewBodyState();
}

class _MyOrdersViewBodyState extends State<MyOrdersViewBody> {
  @override
  void initState() {
    context.read<GetOrdersCubit>().getOrders(userId: getUser().id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Column(
        children: [
          Expanded(
            child: BlocConsumer<GetOrdersCubit, GetOrdersState>(
              listener: (context, state) {
                if (state is GetOrdersFailure) {
                  errorBuilder(context, state.errorMessage);
                  log(state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is GetOrdersload) {
                  return Skeletonizer(
                    enabled: true,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return MyOrderViewBodyItem(
                          orderModelEntityList: OrderDetailsEntity(
                            orderModelList: [],
                            orderId: '#64645646404',
                            userId: '#64645646404',
                            createAt: '04 Dec 25',
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is GetOrdersSuccess) {
                  List<OrderDetailsEntity> orderDetailsEntityList =
                      state.orderDetailsEntityList;
                  return ListView.builder(
                    itemCount: orderDetailsEntityList.length,
                    itemBuilder: (context, index) {
                      return MyOrderViewBodyItem(
                        orderModelEntityList: orderDetailsEntityList[index],
                      );
                    },
                  );
                } else if (state is GetOrdersFailure) {
                  return Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 40),
                        const SizedBox(height: 20),
                        Text(state.errorMessage, style: AppText.medium16),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 40),
                        const SizedBox(height: 20),
                        Text(
                          'OOps,Something Went Wronge',
                          style: AppText.medium16,
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
