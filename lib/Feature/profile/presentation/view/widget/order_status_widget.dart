import 'package:caffee/Core/helper/get_status_color.dart';
import 'package:caffee/Core/utils/app_color.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: getStatusColor(status: status),
      ),
      child: Text(
        status,
        style: AppText.medium16.copyWith(color: AppColor.black),
      ),
    );
  }
}
