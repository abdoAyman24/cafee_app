part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoad extends SignInState {}

final class SignInSuccess extends SignInState {
  final UserEntity userEntity;

  SignInSuccess({required this.userEntity});
}

final class SignInFailure extends SignInState {
  final String errorMessage;

  SignInFailure({required this.errorMessage});
}
