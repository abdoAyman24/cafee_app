part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}
final class CartAddProduct extends CartState {}
final class CartItemDelete extends CartState {}
final class CartIncreseQuantity extends CartState {}
final class CartDecreseQuantity extends CartState {}



