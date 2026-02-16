part of 'update_user_data_cubit.dart';

sealed class UpdateUserDataState extends Equatable {
  const UpdateUserDataState();

  @override
  List<Object> get props => [];
}

final class UpdateUserDataInitial extends UpdateUserDataState {}
final class UpdateUserDataStart extends UpdateUserDataState {}


final class UpdateUserDatasuccess extends UpdateUserDataState {}

final class UpdateUserDataFailure extends UpdateUserDataState {
  final String errorMessage;

  UpdateUserDataFailure({required this.errorMessage});
}
