import 'package:bloc/bloc.dart';
import 'package:caffee/Feature/Auth/domain/user_entity.dart';
import 'package:caffee/Feature/Auth/domain/user_repo.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.userRepo) : super(SignInInitial());
  final UserRepo userRepo;

  Future<void> sigInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoad());
    var result = await userRepo.signInWithEmailAndPasword(
      email: email,
      password: password,
    );
    result.fold(
      (l) {
        emit(SignInFailure(errorMessage: l.message));
      },
      (r) {
        emit(SignInSuccess(userEntity: r));
      },
    );
  }
}
