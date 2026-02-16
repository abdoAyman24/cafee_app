import 'dart:developer';

import 'package:caffee/Core/Widget/custom_button.dart';
import 'package:caffee/Core/helper/get_transaction_data.dart';
import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:caffee/Core/service/payment_api_key.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/payment_intent_input_model.dart';
import 'package:caffee/Feature/payment/presentation/manager/save_order_cubit/save_orders_cubit.dart';
import 'package:caffee/Feature/payment/presentation/manager/stripe_cubit/stripe_cubit.dart';
import 'package:caffee/Feature/payment/presentation/view/thank_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({
    super.key,
    required this.isPaypal,
    required this.cartEntity,
  });
  final bool isPaypal;
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripeCubit, StripeState>(
      listener: (context, state) {
        if (state is StripeSuccess) {
          context.read<SaveOrdersCubit>().saveOrderInFireBase(
            cartItems: cartEntity.cartItems,
          );
          Navigator.pushNamedAndRemoveUntil(
            context,
            ThankView.routeName,
            arguments: cartEntity.calculateTotalPrice(),
            (route) {
              log(
                'Route: name=${route.settings.name}, arguments=${route.settings.arguments},${route.toString()}',
              );
              return route.isFirst;
            },
          );
        }
        if (state is StripeFailure) {
          Navigator.pop(context);
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Pay',
          onTap: () {
            if (isPaypal) {
              excutePaypalPayment(context, cartEntity: cartEntity);
            } else {
              excuteStripePayment(context, cartEntity.calculateTotalPrice());
            }
          },
          isLoading: state is StripeLoad,
        );
      },
    );
  }

  void excuteStripePayment(BuildContext context, double totalPrice) {
    BlocProvider.of<StripeCubit>(context).makePayment(
      paymentIntentInputModel: PaymentIntentInputModel(
        amount: totalPrice,
        currency: 'USD',
        customerId: getUser().customerId,
      ),
    );
  }

  void excutePaypalPayment(
    BuildContext context, {
    required CartEntity cartEntity,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: PaymentApiKey.paypalclientId,
          secretKey: PaymentApiKey.paypalSecretKey,
          transactions: [
            {
              "amount": getTransactionData(
                cartEntity: cartEntity,
              ).amount.toJson(),
              "description": "The payment transaction description.",

              "item_list": getTransactionData(
                cartEntity: cartEntity,
              ).itemsList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pushNamedAndRemoveUntil(context, ThankView.routeName, (
              route,
            ) {
              log(
                'Route: name=${route.settings.name}, arguments=${route.settings.arguments},${route.toString()}',
              );
              return route.isFirst;
            });
          },
          onError: (error) {
            log("onError: $error");
            buildErrorBar(context, error.toString());
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onCancel: () {
            log('cancelled:');
            buildErrorBar(context, 'Transaction Cancelled');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void buildErrorBar(BuildContext context, String errorMessage) {}
}
