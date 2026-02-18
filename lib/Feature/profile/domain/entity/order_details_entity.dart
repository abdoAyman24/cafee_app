import 'package:caffee/Feature/payment/data/model/order_model.dart';

class OrderDetailsEntity {
  final List<OrderModel> orderModelList;
  final String orderId;
  final String userId;
  final String createAt;

  OrderDetailsEntity({required this.orderModelList, required this.orderId, required this.userId, required this.createAt});

}