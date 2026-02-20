part of 'get_orders_cubit.dart';

sealed class GetOrdersState extends Equatable {
  const GetOrdersState();

   @override
  List<Object> get props => [];
}

final class GetOrdersInitial extends GetOrdersState {}

final class GetOrdersload extends GetOrdersState {}

final class GetOrdersSuccess extends GetOrdersState {
  final List<OrderDetailsEntity> orderDetailsEntityList;

 const GetOrdersSuccess({required this.orderDetailsEntityList});
  @override
  List<Object> get props => [orderDetailsEntityList];
}

final class GetOrdersFailure extends GetOrdersState {
  final String errorMessage;

 const GetOrdersFailure({required this.errorMessage});
  @override
  List<Object> get props => [messages];
}
