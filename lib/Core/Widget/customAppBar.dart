import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
    this.showRightWidget = true,
  });
  final Widget leftWidget;
  final Widget rightWidget;
  final bool showRightWidget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [leftWidget, showRightWidget ? rightWidget : SizedBox()],
    );
  }
}
