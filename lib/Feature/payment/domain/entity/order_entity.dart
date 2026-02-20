import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';

class OrderEntity {
  final ProductEntity productEntity;
  final double quantity;
  final double totalPrice;

  OrderEntity({required this.productEntity, required this.quantity, required this.totalPrice});
}