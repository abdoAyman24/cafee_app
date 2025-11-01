part of 'cart_item_cubit.dart';

sealed class CartItemState {
  const CartItemState();
}

final class CartItemInitial extends CartItemState {}
final class DeleteCartItem extends CartItemState {
  final CartItemEntity cartItemEntity;

  DeleteCartItem({required this.cartItemEntity});
}


final class CartItemUpdate extends CartItemState {
  final CartItemEntity cartItemEntity;

  CartItemUpdate({required this.cartItemEntity});
  
}
