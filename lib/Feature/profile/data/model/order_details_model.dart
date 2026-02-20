import 'package:caffee/Feature/payment/data/model/order_model.dart';
import 'package:caffee/Feature/profile/domain/entity/order_details_entity.dart';

class OrderDetailsModel {
  final List<OrderModel> orderModelList;
  final String orderId;
  final String userId;
  final String createAt;
  final String orderStatus;

  OrderDetailsModel({
    required this.orderModelList,
    required this.orderId,
    required this.userId,
    required this.createAt,
    required this.orderStatus,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      orderModelList: (json['orders'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList(),
      orderId: json['orderId'],
      userId: json['userId'],
      createAt: json['createdAt'].toString(),
      orderStatus: json['status'],
    );
  }

  OrderDetailsEntity toEntity() {
    return OrderDetailsEntity(
      orderModelList: orderModelList,
      orderId: orderId,
      userId: userId,
      createAt: createAt,
      orderStatus: orderStatus,
    );
  }

  tojson() {
    return {
      'orderId': orderId,
      'userId': userId,
      'createdAt': createAt,
      'orders': orderModelList.map((e) => e.toJson()),
      'status': 'pending',
    };
  }
}
