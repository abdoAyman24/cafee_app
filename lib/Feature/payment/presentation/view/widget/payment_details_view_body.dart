import 'package:caffee/Core/Widget/custom_button.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/paymentView.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/payment_method_list_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key, required this.cartEntity});
final CartEntity cartEntity;
  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: PaymentMethodListView(
            // to avoid need change payment method constructor
            chnagePaymentMethod: ({required index}) {
            
          },)),
          SliverToBoxAdapter(
            child: Paymentview(
              formKey: formKey,
              autovalidateMode: autovalidateMode,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.center,
              child: CustomButton(
                text: 'Pay',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
