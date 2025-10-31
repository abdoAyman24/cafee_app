import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  double quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  double calculatePrice() {
    return productEntity.priceS * quantity;
  }

  void increseQuantity() {
    quantity++;
  }

  void decreseQuantity() {
    quantity--;
  }
}
