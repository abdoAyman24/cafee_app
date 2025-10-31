
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});

  double calculateTotalPrice() {
    double sum = 0;
    for (var cartItem in cartItems) {
      sum += cartItem.calculatePrice();
    }
    return sum;
  }

  void addProduct(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  void deleteCartItem(CartItemEntity cartItmeEntity) {
    cartItems.remove(cartItmeEntity);
  }

  CartItemEntity getCartItemEntity(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, quantity: 1);
  }

  bool isExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }
}
