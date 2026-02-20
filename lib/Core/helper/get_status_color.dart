import 'package:caffee/Core/helper/order_status_data.dart';
import 'package:flutter/material.dart';

Color getStatusColor({required String status}) {
  if (status == OrderStatusData.pending) {
    return Colors.yellow;
  }
  if (status == OrderStatusData.cancelled) {
    return Colors.red;
  }
  if (status == OrderStatusData.accepted) {
    return Colors.green;
  }
  if (status == OrderStatusData.delivered) {
    return Colors.blue;
  }
  return Colors.grey;
}
