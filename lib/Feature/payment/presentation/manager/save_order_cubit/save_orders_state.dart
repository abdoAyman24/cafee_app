part of 'save_orders_cubit.dart';

sealed class SaveOrdersState extends Equatable {
  const SaveOrdersState();

  @override
  List<Object> get props => [];
}

final class SaveOrdersInitial extends SaveOrdersState {}
final class SaveOrdersStart extends SaveOrdersState {}


final class SaveOrdersSuccess extends SaveOrdersState {}

final class SaveOrdersFailure extends SaveOrdersState {
  final String errorMessage;

  SaveOrdersFailure({required this.errorMessage});
}
