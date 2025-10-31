import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:equatable/equatable.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);

  void addProduct(ProductEntity product) {
    CartItemEntity cartItemEntity = cartEntity.getCartItemEntity(product);
    if (cartEntity.isExist(product)) {
      cartItemEntity.increseQuantity();
    } else {
      cartEntity.addProduct(cartItemEntity);
    }
    emit(CartAddProduct());
  }

  void icreseCartItemQuantity(CartItemEntity cartItemEntity) {
    emit(CartInitial());

    cartItemEntity.increseQuantity();

    emit(CartIncreseQuantity());
  }

  void decreseCartItemQuantity(CartItemEntity cartItemEntity) {
    emit(CartInitial());
    cartItemEntity.decreseQuantity();
    if (cartItemEntity.quantity == 0) {
      cartEntity.deleteCartItem(cartItemEntity);
    }
    emit(CartDecreseQuantity());
  }

  void deleteCartItem(CartItemEntity cartItemEntity) {
    emit(CartInitial());

    cartEntity.deleteCartItem(cartItemEntity);
    emit(CartItemDelete());
  }
}
