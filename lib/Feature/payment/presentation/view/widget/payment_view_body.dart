import 'package:caffee/Core/Widget/custom_button.dart';
import 'package:caffee/Core/service/service_locator.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/payment/domain/repos/payment_repos.dart';
import 'package:caffee/Feature/payment/presentation/manager/stripe_cubit/stripe_cubit.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/basket_view.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/custom_buttom_sheet.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/product_item_info.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/total_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    var children = [
      BasketView(cartEntity: cartEntity.cartItems),
      const SizedBox(height: 20),
      ProductItemInfo(
        title: 'Order Subtotal',
        value: cartEntity.calculateTotalPrice().toString(),
      ),
      const SizedBox(height: 4),

      ProductItemInfo(
        title: 'Discount',
        value: '0',
      ),
      const SizedBox(height: 4),

      ProductItemInfo(title: 'Shipping', value: '8'),
      const SizedBox(height: 4),
      Divider(height: 34, thickness: 2, color: Color(0xffC7C7C7)),
      TotalInfo(
        title: 'Total',
        value: (cartEntity.calculateTotalPrice() - 8).toString(),
      ),
      const SizedBox(height: 8),
      CustomButton(
        text: 'Complete Paymen',
        onTap: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,
            backgroundColor: Colors.grey,
            barrierColor: Colors.black54,
            builder: (context) {
              return BlocProvider(
                create: (context) => StripeCubit(getIt.get<PaymentRepos>()),
                child: CustomButtomSheet(cartEntity: cartEntity,),
              );
            },
          );
        },
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(children: children),
    );
  }
}
