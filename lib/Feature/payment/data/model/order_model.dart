import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:caffee/Feature/home/data/Model/product_model.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Feature/payment/domain/repos/entity/order_entity.dart';

class OrderModel {
  final ProductEntity productEntity;
  final double quantity;
  final double totalPrice;

  OrderModel({
    required this.productEntity,
    required this.quantity,
    required this.totalPrice,
  });
  factory OrderModel.fromCartItemEntity(CartItemEntity cartItemEntity) {
    return OrderModel(
      productEntity: cartItemEntity.productEntity,
      quantity: cartItemEntity.quantity,
      totalPrice: cartItemEntity.calculatePrice(),
    );
  }
  OrderEntity toEntity() {
    return OrderEntity(
      productEntity: productEntity,
      quantity: quantity,
      totalPrice: totalPrice,
    );
  }

  toJson() {
    return {
      'product': ProductModel.fromEntity(productEntity).toJson(),
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      productEntity: ProductModel.fromJson(json['product']).toEntity(),
      quantity: json['quantity'],
      totalPrice: json['totalPrice'],
    );
  }
}
