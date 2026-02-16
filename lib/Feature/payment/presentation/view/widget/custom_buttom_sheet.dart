import 'package:caffee/Core/service/service_locator.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:caffee/Feature/payment/presentation/manager/save_order_cubit/save_orders_cubit.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/custom_buttom_bloc_consumer.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/payment_method_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButtomSheet extends StatefulWidget {
  const CustomButtomSheet({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  State<CustomButtomSheet> createState() => _CustomButtomSheetState();
}

bool isPaypal = false;

class _CustomButtomSheetState extends State<CustomButtomSheet> {
  void changePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodListView(chnagePaymentMethod: changePaymentMethod),
          const SizedBox(height: 20),
          BlocProvider(
            create: (context) => SaveOrdersCubit(getIt.get<PaymentRepos >()),
            child: CustomButtomBlocConsumer(
              isPaypal: isPaypal,
              cartEntity: widget.cartEntity,
            ),
          ),
        ],
      ),
    );
  }
}
