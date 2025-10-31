part of 'product_size_cubit.dart';

sealed class ProductSizeState extends Equatable {
  const ProductSizeState();

  @override
  List<Object> get props => [];
}

final class ProductSizeInitial extends ProductSizeState {}
final class Generate extends ProductSizeState {}

final class Smalle extends ProductSizeState {}
final class Medium extends ProductSizeState {}
final class Large extends ProductSizeState {}


