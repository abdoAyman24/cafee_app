import 'package:caffee/Feature/payment/data/model/order_model.dart';
import 'package:caffee/Feature/profile/domain/entity/order_details_entity.dart';

class OrderDetailsModel {
  final List<OrderModel> orderModelList;
  final String orderId;
  final String userId;
  final String createAt;

  OrderDetailsModel({
    required this.orderModelList,
    required this.orderId,
    required this.userId,
    required this.createAt,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      orderModelList: (json['orders'] as List)
          .map((e) => OrderModel.fromJson(e))
          .toList(),
      orderId: json['orderId'],
      userId: json['userId'],
      createAt: json['createdAt'],
    );
  }
  
  OrderDetailsEntity toEntity() {
    return OrderDetailsEntity(
      orderModelList: orderModelList,
      orderId: orderId,
      userId: userId,
      createAt: createAt,
    );
  }

  tojson() {
    return {
      'orderId': orderId,
      'userId': userId,
      'createdAt': createAt,
      'orders': orderModelList.map((e) => e.toJson()),
    };
  }
}
