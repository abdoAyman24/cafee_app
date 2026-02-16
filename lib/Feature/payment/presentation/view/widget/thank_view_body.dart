import 'package:caffee/Feature/payment/presentation/view/widget/check_icon.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/clip_circle.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/dash_line_widget.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/par_code_widget.dart';
import 'package:caffee/Feature/payment/presentation/view/widget/thank_body_details.dart';
import 'package:flutter/material.dart';

class ThankViewBody extends StatelessWidget {
  const ThankViewBody({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 672,
            decoration: ShapeDecoration(
              color: const Color.fromARGB(255, 51, 50, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TahnkViewbodyDetails(totalPrice: totalPrice),
            ),
          ),
          ParCodeWidget(),
          CheckIcon(),
          DashLineWidget(),
          ClipCircle(leftSide: -20),
          ClipCircle(rightSide: -20),
        ],
      ),
    );
  }
}
